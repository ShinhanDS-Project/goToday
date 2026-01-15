package kr.co.gotoday.cancel;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gotoday.payment.PaymentVO;

@Service
public class CancelService {

    @Autowired
    CancelMapper cancelMapper;

    // 토스페이먼츠 시크릿 키 (개발자센터에서 확인, "test_sk_..." 형태)
    private final String TOSS_SECRET_KEY = "test_sk_DpexMgkW36ym117LE2x48GbR5ozO"; 

    @Transactional
    public void cancelPayment(String orderId, String cancelReason) throws Exception {
        
        // 1. orderId로 결제 정보 조회 (paymentKey 필요)
        PaymentVO payment = cancelMapper.findPaymentByOrderId(orderId);
        if (payment == null) {
            throw new Exception("결제 정보를 찾을 수 없습니다.");
        }
        
        String paymentKey = payment.getPayment_key();

        // 2. 토스페이먼츠 API 호출하여 취소 요청
        sendCancelRequestToToss(paymentKey, cancelReason);

        // 3. API 취소 성공 시, 우리 DB 상태 업데이트
        int payResult = cancelMapper.updatePaymentStatusToCancel(orderId);
        int resResult = cancelMapper.updateReservationStatusToCancel(payment.getReservation_id());

        if (payResult == 0 || resResult == 0) {
            throw new Exception("DB 상태 업데이트 실패");
        }
    }

    // 토스 API 호출 메서드 (HttpURLConnection 사용)
    private void sendCancelRequestToToss(String paymentKey, String cancelReason) throws Exception {
        URL url = new URL("https://api.tosspayments.com/v1/payments/" + paymentKey + "/cancel");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        // 헤더 설정
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        
        // 인증 헤더 (Basic Auth: SecretKey를 Base64 인코딩)
        String encodedAuth = Base64.getEncoder().encodeToString((TOSS_SECRET_KEY + ":").getBytes(StandardCharsets.UTF_8));
        connection.setRequestProperty("Authorization", "Basic " + encodedAuth);
        connection.setDoOutput(true);

        // Body 설정 (JSON 문자열)
        String jsonBody = "{\"cancelReason\":\"" + cancelReason + "\"}";

        // 전송
        try (OutputStream os = connection.getOutputStream()) {
            byte[] input = jsonBody.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        // 응답 코드 확인
        int code = connection.getResponseCode();
        if (code != 200) {
            // 에러 처리 (필요시 에러 스트림을 읽어서 로그 출력)
            throw new Exception("토스 결제 취소 실패: 응답 코드 " + code);
        }
        
        // 성공 시 별도 응답을 읽을 필요가 없다면 여기서 종료
    }
}