package kr.co.gotoday.cancel;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gotoday.payment.PaymentVO;

@Mapper
public interface CancelMapper {
	PaymentVO findPaymentByOrderId(String orderId);
	
	int updatePaymentStatusToCancel(String orderId);
	
	int updateReservationStatusToCancel(int reservationId);
	
}
