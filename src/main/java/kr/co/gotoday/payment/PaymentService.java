package kr.co.gotoday.payment;

public interface PaymentService {
	boolean confirmPaymentWithToss(String paymentKey, String orderId, int amount) throws Exception;
	
}
