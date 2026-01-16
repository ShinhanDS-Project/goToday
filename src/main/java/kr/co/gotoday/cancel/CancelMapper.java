package kr.co.gotoday.cancel;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gotoday.content.ContentScheduleVO;
import kr.co.gotoday.payment.PaymentVO;
import kr.co.gotoday.reservation.ReservationVO;
import kr.co.gotoday.user.CalendarVO;

@Mapper
public interface CancelMapper {
	PaymentVO findPaymentByOrderId(String orderId);
	
	ReservationVO findReservationByReservationId(int reservation_id);
	
	ContentScheduleVO findContent_scheduleByContentId(int content_id);
	
	int updatePaymentStatusToCancel(String orderId);
	
	int updateReservationStatusToCancel(int reservationId);
	
}
