package kr.co.gotoday.reservation_detail;

import lombok.Data;

@Data
public class DetailVO {
	// 1. 예약 정보
	private String reservationId; // 예약 번호 (R2024...)
	private String contentName; // 공연/전시 명
	private String reservationDate; // 예약 날짜 (2024-05-01)
	private String scheduleTime; // 시간 (10:00 ~ 12:00) - schedule 테이블 조인 필요
	private int totalTicket; // 티켓 매수 (외 2명)

	// 2. 결제 정보
	private String paymentMethod; // 결제 수단 (카드)
	private String paymentStatus; // 결제 상태 (결제 완료)
	private int amount; // 결제 금액 (44,000)
	private String paymentDate; // 결제 일시

	// 3. 예약자 정보 (User 테이블 조인)
	private String userName; // 예약자 명 (김*수)
	private String userPhone; // 연락처
	private String userEmail; // 이메일
}
