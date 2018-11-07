
import java.net.*;
import java.io.*;

public class MultiServerThread implements Runnable {
	// 소켓 변수선언
	private Socket socket;
	
	// MultiServer 생성자에서 MultiServerThread list 목록에 소켓 추가하기 위해
	private MultiServer ms;
	
	// 입력스트림 변수
	private ObjectInputStream ois;
	
	// 출력스트림 변수
	private ObjectOutputStream oos;
	
	public MultiServerThread(MultiServer ms) {
		this.ms = ms;
	}
	
	// 직렬화 후 스레드 실행
	public synchronized void run() {
		boolean isStop = false;
		
		try {
			// MultiServer 클래스에서 생성된 소켓을 가져오기
			socket = ms.getSocket();
			
			// 소켓의 입력스트림 값을 가져온 객체 생성
			ois = new ObjectInputStream(socket.getInputStream());
			// 소켓의 출력스트림 값을 가져온 객체 생성
			oos = new ObjectOutputStream(socket.getOutputStream());
			
			String message = null;
			
			while (!isStop) {
				// readObject -> 객체 읽기
				// ois에 입력스트림 값을 읽어 message 변수에 담기
				message = (String) ois.readObject();
				
				// 메시지 출력 -> 클라이언트 name 값 + 내용
				System.out.println("message 확인 : " + message);
				
				String[] str = message.split("#");
				
				// 메신저 아이디 
				String name = "list"+"#";
				
				// 클라이언트에 뿌려줄 각 소켓을 담은 ms 변수의 이름들을 가져오기
				for(int i=0; i<ms.getList().size(); i++){
					name += ms.getList().get(i)+"#";
				}
				System.out.println("name값 확인 : " + name);
				
				if (str[1].equals("exit")) {
					broadCasting(message);
					isStop = true;
				}else if(str[1].equals("list")){
					broadCasting(name);
				}else if(str[1].equals("")){
					broadCasting(name);
				}else if(str[1].equals("check")){
					
					System.out.println("str[0] : "+str[0]);
					System.out.println("str[1] : "+str[1]);
					System.out.println("str[2] : "+str[2]);

					String taget = str[2];
					System.out.println(taget);
					if(taget.equals(str[0])){
						socket.close();
					}
					
				}else if(str[1].equals("종료")){
					ms.Ddos();
				}
				else {
					broadCasting(message);
				}
			}		
			// multiserver socket 삭제
			
			ms.getList().remove(this);
			System.out.println("소켓에 저장된 ip값 가져오기" + socket.getInetAddress());
			System.out.println("list size : " + ms.getList().size());
			
		}catch (Exception e) {
			ms.getList().remove(this);
			System.out.println("소켓에 저장된 ip값 가져오기(catch)" + socket.getInetAddress());
			System.out.println("list size(소켓에 들어있는 수) : " + ms.getList().size());
		}
	}

	public void broadCasting(String message) throws IOException {
		for (MultiServerThread ct : ms.getList()) {
			ct.send(message);
		}
	}

	// ObjectOutputStream
	public void send(String message) throws IOException {
		// writeObject(Object obj)
		//지정된 객체를 ObjectOutputStream에 기입
		// 저장된 메시지 변수를 oos에 저장
		oos.writeObject(message);
	}
}
