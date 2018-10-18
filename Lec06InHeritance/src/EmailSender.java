
public class EmailSender extends MessageSender {
	
	String senderAddr; 	//발신자 이메일
	String emailBody;   //이메일 본문
	
	public EmailSender(String title, String senderName,String senderAddr, String emailBody) {
		// TODO Auto-generated constructor stub
		super(title,senderName);
		this.senderAddr = senderAddr;
		this.emailBody = emailBody;
		
	}

	@Override
	void sendMessage(String recipient) {
		// TODO Auto-generated method stub
		System.out.println("==========이메일 전송==========");
		System.out.println("제    목 :" + title);
		System.out.println("발 신 자 :" + senderName);
		System.out.println("수 신 자 :" + recipient);
		System.out.println("발신자 주소 :" + senderAddr);
		System.out.println("이 메 일 :" + emailBody);
		System.out.println();
		
	}
}
