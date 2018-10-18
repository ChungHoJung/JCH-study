
public class AbstractMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SMSSender sms1 = 
				new SMSSender("결제완료", "12번가", "02-123-1234", "고객님께서 주문하신 상품이 결제완료 되었습니다");
		
		EmailSender email1 = 
				new EmailSender("결제완료", "12번가", "master@12st.co.kr", "고객님께서 주문하신 상품이 결제완료 되었습니다");
	
		SMSSender sms2 = 
				new SMSSender("배송완료", "12번가", "02-123-1234", "고객님께서 주문하신 상품이 배완료 되었습니다");
		
		EmailSender email2 = 
				new EmailSender("배송완료", "12번가", "master@12st.co.kr", "고객님께서 주문하신 상품이 배송완료 되었습니다");
		
		/*sms1.sendMessage("010-1234-5678");
		email1.sendMessage("abcd@naver.com");
		sms2.sendMessage("010-1234-5678");
		email2.sendMessage("abcd@naver.com");
		*/
		
		send(sms1, "010-1234-5678");
		send(email1, "abc@naver.com");
		send(sms2, "010-5678-5678");
		send(email2, "abcde@naver.com");
		
	}
	
	public static void send(MessageSender ms, String recipient){
		ms.sendMessage(recipient);
	}

}
