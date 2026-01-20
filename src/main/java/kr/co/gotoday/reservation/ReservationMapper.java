package kr.co.gotoday.reservation;

<<<<<<< HEAD
public class ReservationMapper {

=======
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gotoday.content.ContentScheduleVO;
import kr.co.gotoday.payment.PaymentVO;
import kr.co.gotoday.user.CalendarVO;

@Mapper
public interface ReservationMapper {
	int createReservation(ReservationVO reservationVO);
	int createPayment(PaymentVO paymentVO);
	ReservationVO findByReservationId(int reservation_id);
	List<VendorReservationListDTO> findReservationByVendor(VendorReservationSearchDTO dto);
	int subCurrentTicket(Map<String, Object> map);
	int addCurrentTicket(Map<String, Object> map);
	int createScheduleByReservation(CalendarVO calendarVO);
	PaymentVO findByOrderId(String order_key);
	int updatePaymentStatus(Map<String, Object> map);
	int updateReservationStatusById(int reservation_id);
	List<ReservationListDTO>findReservationListByUserId(int user_id);
>>>>>>> 0390013b8e1b2684066cc3fcdd2ac2cf330cdd34
}
