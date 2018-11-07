
import java.io.*;
import java.net.*;
import java.util.*;

// 서버 생성
public class MultiServer {
		
	// 반환형이 MultiServerThread인 list 변수선언
	private ArrayList<MultiServerThread> list;
	
	// 서버 프로그램으로 연결 요청을 한다.
	private Socket socket;

	public MultiServer() throws IOException {
		// list 객체 생성
		list = new ArrayList<MultiServerThread>();
		
		//요청이 오면 클라이언트와 연결을 맺고 또 다른 소켓을 만드는 일을 한다.
		ServerSocket serverSocket = new ServerSocket(5000);	
		
		// MultiServerThread 변수 선언
		MultiServerThread mst = null;
		
		// 소켓을 받을 때 사용할 while문 변수
		boolean isStop = false;
		
		while (!isStop) {
			System.out.println("Server ready...");
			
			// accept() 이 소켓에 대한 연결을 청취하고이를 수락
			socket = serverSocket.accept();
			
			// MultiServerThread 객체 생성
			mst = new MultiServerThread(this);
			
			// list 변수에 MultiServerThread 객체 리스트로 넣어두기
			list.add(mst);
			
			// MultiServerThread 객체 스레드에 넣기
			Thread t = new Thread(mst);
			
			// 스레드 시작
			t.start();
		}
	}
	
	// 파일종료
	public void Ddos(){
		System.exit(0);
	}
	
	
	// @@ MultiServerThread에서 사용 
	public ArrayList<MultiServerThread> getList(){
		return list;
	}

	
	// @@ MultiServerThread에서 사용
	public Socket getSocket() {
		return socket;
	}

	
	public static void main(String arg[]) throws IOException {
		// 멀티서버 객체 생성자 생성
		// 스레드 생성하기
		new MultiServer();
	}

}