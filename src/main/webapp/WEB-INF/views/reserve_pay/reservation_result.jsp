<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>예약 완료 및 결제</title>
    <script src="https://js.tosspayments.com/v1/payment"></script>
</head>
<body>
    <header>
        <a href="#" aria-label="GoToday 홈">GoToday</a>

        <nav aria-label="메인 메뉴">
            <a href="#">Q&amp;A</a>
            <a href="#">PopUp</a>
            <a href="#">Exhibition</a>
        </nav>

        <div>
            <button type="button" name="btnSearch" aria-label="검색">
                검색
            </button>
            <a href="#" aria-label="마이페이지">마이페이지</a>
        </div>
    </header>

    <hr />

    <h1>주문서</h1>
    
    <div style="padding: 10px; background-color: #f5f5f5; border-radius: 5px; margin-bottom: 20px;">
        <p><strong>주문 상품:</strong> ${payInfo.orderName}</p>
        <p><strong>결제 금액:</strong> ${payInfo.amount}원</p>
    </div>

    <button class="button" id="payment-button" style="margin-top: 30px">결제하기</button>

    <script>
        const button = document.getElementById("payment-button");
        
        // [수정완료] 내 API 개별 연동 클라이언트 키
        const clientKey = "test_ck_Z1aOwX7K8mv4q4Qap4q03yQxzvNP"; 
        const tossPayments = TossPayments(clientKey);

        button.addEventListener("click", async function () {
            try {
                // 1. 먼저 서버에 결제 요청 (PENDING 상태로 예약 저장)
                const response = await fetch("/project/reserve/payment.do", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded",
                    },
                    body: new URLSearchParams({
                        receiver_name: "${payInfo.customerName}",
                        receiver_birth: "",
                        receiver_phone: ""
                    })
                });

                const result = await response.json();

                // 2. 서버 응답 확인
                if (!result.success) {
                    alert(result.msg || "결제 준비 중 오류가 발생했습니다.");
                    return;
                }

                // 3. 서버 응답 데이터로 토스 결제창 호출 (requestPayment 직접 호출)
                tossPayments.requestPayment('카드', {
                    amount: result.amount,
                    orderId: result.orderId,
                    orderName: result.orderName,
                    customerName: result.customerName,
                    customerEmail: "${payInfo.customerEmail}",

                    // 성공/실패 시 이동할 URL (Context Path 주의: /project 부분이 맞는지 확인하세요)
                    successUrl: window.location.origin + "/project/reserve_pay/success.do",
                    failUrl: window.location.origin + "/project/payments/fail.do",
                });

            } catch (error) {
                console.error("결제 요청 실패:", error);
                alert("결제 요청 중 오류가 발생했습니다.");
            }
        });
    </script>
</body>
</html>