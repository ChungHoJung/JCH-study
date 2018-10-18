
public class SMSSender extends MessageSender {

	String returnPhoneNo;		//회신 전화번호
	String message;				// 메시지
	
	public SMSSender(String title, String senderName,String returnPhoneNo, String message) {
		// TODO Auto-generated constructor stub
		super(title,senderName);
		this.returnPhoneNo = returnPhoneNo;
		this.message = message;
	}

	@Override	//(오류 잡아주는 역할)
	void sendMessage(String recipient) {
		// TODO Auto-generated method stub
		System.out.println("==========문자 메시지 전송==========");
		System.out.println("제    목 :" + title);
		System.out.println("발 신 자 :" + senderName);
		System.out.println("수 신 자 :" + recipient);
		System.out.println("회신전화 :" + returnPhoneNo);
		System.out.println("메 시 지 :" + message);
		System.out.println();
		
	}
	
	
}
