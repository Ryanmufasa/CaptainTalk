package websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


// javax.websocket.server.ServerEndpoint;
@ServerEndpoint("/kaja") // 클라이언트는 이 주소로 서버에 접속한다.  // 서버에 접속하는 위치가 /kaja 라는 것. 
public class KajaSocket { // KajaSocket.java 
	// KajaSocket.java 는 소켓을 처리할 수 있음
	
	// MVC 패턴 중 Controller 역할을 하는 것과 같음. 
	// 채팅을 받아서 전체에게 send 하는 일이 주요 작업. 
	
	// session :  1 브라우저 (client)  = 1 session (장바구니..)  
	// 이 session import는  org.apache... 
	
	// Session interface : 브라우저(client)가 websocket에 접속할 때 만들어지며, 컬렉션으로 관리한다. 
		// ( 즉, 자바의 socket 개념.. 홍길동 소켓, 이도령 소켓...)
		// 여기서 Sessiont 은  c/s 모델(클라이언트-서버 모델) chatting 의 socket 과 같다. 
		// 10명의 클라이언트가 있아면 10명의 모든 session에 대한 정보가 들어간다.
	
	// Session import 할때 org.apache... 가 아니라  javax.websocket.Session 임 
	

	private static List<Session> listclient  = Collections.synchronizedList(new ArrayList<>());
	
	// 동기화 처리 // 하나 처리하고 lock, unlock 반복 
	
	// thread-safe 컬렉션
	// Vector, Hashtable은 synchronized method 로 multi-thread 에서 문제 없음. 
	// -> 문제가 없다는 것은 기본 형태가 synchronized 로 되어 있는 것. 
	   //  ArrayList, HashMap, HashSet 등은 multi-thread 에서 not safe
				// -> 이것들은 synchronized 형태가 갖춰져 있지 않기 때문에 멀티 쓰레드에서 문제가 발생할 수 있다는 것. 
	
	//참고) Vector 는 ArrayList 보다 먼저 생긴 synchronized 형태의 올드한 방식이당... 
	
	// 그러므로 Collections.synchronizedList() 를 사용하여 safe 로
	// 방법은 처리시 전체 lock 을 걸어준다. 
	
	//  예) hong: 안녕
	//		 lee : 방가방가 
	//	결과 ) 	  안방녕가방가      -> 글자가 섞여버리는 것. 이렇게 되면 안됨. 
	
	//   안녕 입력되면 lock 하고 보내고, 다 전송되면 unlock 해서 방가방가 입력된거 전송하고 lock 해서 따로따로 보내지게 되는 것. 
	// 쓰레드 때문에 나한번 너한번 이렇게 진행되게 하는것.. 쓰레드를 쓸때 쓰레드세이프가 되지 않으면 내용이 섞일 수 있음. 
	
	// 이에 비해 concurrent 는 처리되는 해당 요소만 lock 을 건다. 
	// 그러므로 SynchronizedMap 보다는 ConcurrentHashMap 클래스 사용시 속도가 상대적으로 빠르다.. 
	
	// 컬렉션에 .synchronizedList() 를 써도 되지만 ConcurrentHashMap 을 써도 된다.. 이건 개인 공부 할것. 
	
	// session 도 소켓이므로 멀티채팅을 했을 때 ArrayList를 사용해서 threadList 를 생성해서 소켓을 담았었음
	 
	// 글자가 섞이는걸 막기 위해 collection에다가 .synchronizedList() 를 하면 된다~ 로 알고 있으면 됨. 
	
	@OnOpen //  client가 접속하면  
	public void onOpen(Session ses1) {
		listclient.add(ses1); //  클라이언트 접속자를 세션 리스트에 추가 
	} // 홍길동 소켓을 세션목록에 넣는다. 
	
	// 어노테이션의 장점 -> 코드를 짧게 쓰면서도 많은 걸 포함한 기능 구현을 가능하게 한다. 
	
	@OnMessage  // client 에서 chat 이 오면 여기서 처리  -> 채터 전부에게 chat 을 뿌리겠다 
	public void onMessage(Session ses1, String chat2) throws IOException {
		
		// 여기서 모든 세션에게 메시지를 전송한다. 
		// synchronized : thread-safe 가 목적으로 해당 thread 만 처리됨 
		synchronized (listclient) {  // 예) 둘이서 안녕 방가방가 채팅시 안방가녕방가  
			for(Session imsi : listclient) {
				
				// 이걸 하지 않으면 내가 보낸 내용이 두번 출력 된다.  기본으로 텍스에 넣고, 전체 뿌려주고 ) 
				if( !imsi.equals(ses1) ) { // 여기서 chat 보낸 사람은 빼고 전송하자는 것. 
					imsi.getBasicRemote().sendText(chat2);
					// 처음에는 홍길동 소켓 꺼내서 거기다가 chat을 send
					// 그 다음에는 이도령 socket..
					// 채팅방에 있는 사람들에게  '방가방가' 다 전달되는것. (보낸사람 제외)
				}
			}
		}
	}
	
	@OnError // data 전송시 에러 발생하면 
	public void onError(Throwable e1) {
		e1.printStackTrace();
	}
	
	@OnClose  // 클라이언트 연결이 끊어지면 
	public void onClose(Session ses1) {
		listclient.remove(ses1); // 컬렉션에서 해당 클라이언트 세션(소켓) 을 삭제 
	}

}