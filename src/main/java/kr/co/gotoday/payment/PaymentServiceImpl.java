package kr.co.gotoday.payment;



import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    PaymentMapper paymentMapper;

    // [중요] 내 시크릿 키 (CancelService랑 똑같은 키여야 함!)
    private final String TOSS_SECRET_KEY = "test_sk_DpexMgkW36ym117LE2x48GbR5ozO";

    @Override
    public boolean confirmPaymentWithToss(String paymentKey, String orderId, int amount) throws Exception {
        
        // 1. 토스 승인 API URL 설정
        URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        // 2. 헤더 설정
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        
        // 인증 헤더 (시크릿 키 인코딩)
        String encodedAuth = Base64.getEncoder().encodeToString((TOSS_SECRET_KEY + ":").getBytes(StandardCharsets.UTF_8));
        connection.setRequestProperty("Authorization", "Basic " + encodedAuth);
        connection.setDoOutput(true);

        // 3. Body 설정 (JSON)
        String jsonBody = String.format("{\"paymentKey\":\"%s\",\"orderId\":\"%s\",\"amount\":%d}", 
                                        paymentKey, orderId, amount);

        // 4. 전송
        try (OutputStream os = connection.getOutputStream()) {
            byte[] input = jsonBody.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        // 5. 응답 확인 (200 OK면 성공)
        int code = connection.getResponseCode();
        
        // 성공(200)이면 true 반환
        return code == 200;
    }
}