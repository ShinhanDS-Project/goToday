<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <script src="https://js.tosspayments.com/v1/payment"></script>
  </head>
  <body>
    <h1>주문서</h1>
    
    <div style="padding: 10px; background-color: #f5f5f5; border-radius: 5px; margin-bottom: 20px;">
        <p><strong>주문 상품:</strong> ${payInfo.orderName}</p>
        <p><strong>결제 금액:</strong> ${payInfo.amount}원</p>
    </div>

    <button class="button" id="payment-button" style="margin-top: 30px">결제하기</button>

    <script>
      main();

      function main() {
        const button = document.getElementById("payment-button");
        
        // [수정완료] 내 API 개별 연동 클라이언트 키
        const clientKey = "test_ck_Z1aOwX7K8mv4q4Qap4q03yQxzvNP";
        const tossPayments = TossPayments(clientKey);
        
        // '결제하기' 버튼 클릭
        button.addEventListener("click", function () {
          
          // [수정완료] 위젯 대신 requestPayment 직접 호출
          tossPayments.requestPayment('카드', {
            amount: ${payInfo.amount},
            orderId: "${payInfo.orderId}",
            orderName: "${payInfo.orderName}",
            customerName: "${payInfo.customerName}",
            customerEmail: "${payInfo.customerEmail}",
            
            // 성공/실패 시 이동할 URL (Context Path가 /project가 맞는지 확인하세요)
            successUrl: window.location.origin + "/project/success",
            failUrl: window.location.origin + "/project/fail",
          });
        });
      }
    </script>
  </body>
</html>