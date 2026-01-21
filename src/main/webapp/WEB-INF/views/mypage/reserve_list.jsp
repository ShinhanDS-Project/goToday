<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<<<<<<< Updated upstream
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

=======
    <meta charset="UTF-8">
    <title>예약 관리 | GoToday</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
    <style>
        /* 기본 초기화 */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body {
            font-family: 'Pretendard', -apple-system, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.5;
        }

        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 60px 20px;
        }

        .page-title {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 40px;
            text-align: left;
        }

        .list-wrapper {
            max-width: 800px;
            margin: 0 auto;
        }

        .empty-box {
            text-align: center;
            padding: 80px 20px;
            background: white;
            border-radius: 20px;
            color: #999;
            font-size: 16px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        /* 예약 아이템 카드 */
        .reserve-item {
            background: white;
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            position: relative;
            transition: transform 0.2s ease;
        }

        .reserve-item:hover {
            transform: translateY(-3px);
        }

        /* 배지 스타일 최적화 */
        .badge {
            position: absolute;
            top: 25px;
            left: 25px;
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 700;
            color: white;
            background-color: #4dc3ff; /* 기본값 (D-Day) */
            z-index: 10;
        }

        .badge.bg-end { background-color: #ff6b35; }
        .badge.bg-cancel { background-color: #ff4444; }

        /* 정보 영역 레이아웃 */
        .datetime { 
            margin-bottom: 20px; 
            padding-top: 35px; /* 배지 공간 */
        }

        .reserve-code { font-size: 12px; color: #999; margin-bottom: 8px; font-family: monospace; }
        .date { font-size: 16px; font-weight: 700; color: #333; margin-right: 12px; }
        .time { font-size: 15px; color: #666; }

        .state { display: inline-block; margin-top: 10px; font-size: 13px; font-weight: 700; }
        .state.done { color: #4dc3ff; }
        .state.canceled { color: #ff4444; }
        .state.visited { color: #28a745; }

        .payment-type.waiting {
            display: inline-block;
            margin-left: 10px;
            padding: 4px 12px;
            background-color: #fff3cd;
            color: #856404;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
        }

        /* 모바일 티켓 버튼 */
        .ticket-btn {
            display: block;
            margin-top: 15px;
            padding: 10px 24px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .ticket-btn:hover { background-color: #4dc3ff; }

        /* 콘텐츠 미리보기 영역 */
        .reserve-content {
            display: flex;
            align-items: center;
            gap: 20px;
            margin: 20px 0;
            padding: 20px 0;
            border-top: 1px solid #f0f0f0;
            border-bottom: 1px solid #f0f0f0;
        }

        .reserve-content p { flex: 1; font-size: 17px; font-weight: 700; color: #333; }
        .reserve-content img { width: 90px; height: 90px; border-radius: 12px; object-fit: cover; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }

        /* 하단 액션 버튼 영역 */
        .action-area {
            display: flex;
            gap: 10px;
        }

        .info-btn, .review-btn {
            flex: 1;
            padding: 12px 0;
            border: 1.5px solid #ddd;
            background: white;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s;
            text-align: center;
        }

        .info-btn:hover { border-color: #4dc3ff; color: #4dc3ff; }
        .review-btn { background-color: #4dc3ff; border-color: #4dc3ff; color: white; }
        .review-btn:hover { background-color: #3ab3ef; border-color: #3ab3ef; }

        .paging { text-align: center; margin-top: 50px; font-size: 16px; }
        .paging a { margin: 0 8px; text-decoration: none; color: #999; font-weight: 600; }
        .paging a.active { color: #4dc3ff; text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="page-title">예약 관리</h1>

        <div class="list-wrapper">
            <c:choose>
                <c:when test="${empty reservationList}">
                    <div class="empty-box">예약 내역이 없습니다.</div>
                </c:when>
                <c:otherwise>
                    <c:forEach var="r" items="${reservationList}">
                        <div class="reserve-item">
                            <div class="badge ${r.dday eq 'END' ? 'bg-end' : (r.dday eq 'CANCEL' ? 'bg-cancel' : '')}">
                                ${r.dday}
                            </div>
                            
                            <div class="datetime">
                                <p class="reserve-code">Order No. ${r.reservation_code}</p>
                                <span class="date">${r.reserved_for_at}</span>
                                <span class="time">${r.time_zone}</span>
                                
                                <div class="status-row">
                                    <c:choose>
                                        <c:when test="${r.reservation_status eq 'DONE'}">
                                            <p class="state done">예약 완료</p>
                                        </c:when>
                                        <c:when test="${r.reservation_status eq 'CANCELED'}">
                                            <p class="state canceled">예약 취소</p>
                                        </c:when>
                                        <c:when test="${r.reservation_status eq 'VISITED'}">
                                            <p class="state visited">이용 완료</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p class="state">${r.reservation_status}</p>
                                        </c:otherwise>
                                    </c:choose>
                                
                                    <c:if test="${r.payment_status eq 'WAITING_FOR_DEPOSIT'}">
                                        <p class="payment-type waiting">입금 대기</p>
                                    </c:if>
                                </div>

                                <c:if test="${r.receive_type eq 'MOBILE' && r.reservation_status ne 'CANCELED'}">
                                    <button type="button" class="ticket-btn" 
                                            onclick="location.href='${pageContext.request.contextPath}/ticket/${r.reservation_id}'">
                                        모바일 티켓 확인
                                    </button>
                                </c:if>
                            </div>
                            
                            <div class="reserve-content">
                                <p>${r.title}</p>
                                <img src="${pageContext.request.contextPath}${reservation.imgPath}" alt="포스터">
                            </div>
                            
                            <div class="action-area">
                                <button type="button" class="info-btn" data-reservation-id="${r.reservation_id}">예약 상세</button>
                                
                                <c:if test="${r.reservation_status eq 'VISITED'}">
                                    <button type="button" class="review-btn" 
                                            data-reservation-id="${r.reservation_id}"
                                            data-content-id="${r.content_id}">
                                        리뷰 작성
                                    </button>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>

                    <div class="paging">
                        <a href="#">&lt;</a>
                        <a href="#" class="active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">&gt;</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
	
    <script>
        // jQuery가 로드된 후 실행되도록 보장
        $(document).ready(function() {
            // 예약 정보 상세 이동
            $(".info-btn").on("click", function () {
                const reservation_id = $(this).data("reservation-id");
                window.location.href = "${pageContext.request.contextPath}/mypage/reservations/" + reservation_id;
            });
            
            // 리뷰 쓰기 이동
            $(".review-btn").on("click", function () {
                const reservation_id = $(this).data("reservation-id");
                const content_id = $(this).data("content-id");
                window.location.href = "${pageContext.request.contextPath}/review/write?reservation_id=" + reservation_id + "&content_id=" + content_id;
            });
        });
    </script>
>>>>>>> Stashed changes
</body>
</html>