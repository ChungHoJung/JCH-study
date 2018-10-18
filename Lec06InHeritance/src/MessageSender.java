
public abstract class MessageSender {
	
	String title;		//제목
	String senderName; //보내는 사람
	
	//public MessageSender() {}
	
	MessageSender(String title, String senderName){
		this.title = title;
		this.senderName = senderName;
	}
	
	//메시지를 전송
	abstract void sendMessage(String recipient); // 추상 메서드(로직 없음)

}
