package websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import classifyroom.classifyroomDAO.ClassifyroomDAO;
import classifyroom.classifyroomVO.ClassifyroomVO;
import member.memberVO.MemberVO;

// javax.websocket.server.ServerEndpoint;
@ServerEndpoint(value = "/kaja", configurator = HttpSessionConfigurator.class) // 클라이언트는 이 주소로 서버에 접속한다.  // 서버에 접속하는 위치가 /kaja 라는 것. 
public class KajaSocket {
	
	private Map<Session, EndpointConfig> listclient = Collections.synchronizedMap(new HashMap<>());
	
	private static List<Session> listclient2  = Collections.synchronizedList(new ArrayList<>());
	
	
	@OnOpen //  client가 접속하면  
	public void onOpen(Session userSession, EndpointConfig config) {
		if (!listclient.containsKey(userSession)) {
			listclient.put(userSession, config);
		}
		listclient2.add(userSession);
	} // 홍길동 소켓을 세션목록에 넣는다. 
	
	// 어노테이션의 장점 -> 코드를 짧게 쓰면서도 많은 걸 포함한 기능 구현을 가능하게 한다. 
	
	@SuppressWarnings("unlikely-arg-type")
	@OnMessage  // client 에서 chat 이 오면 여기서 처리  -> 채터 전부에게 chat 을 뿌리겠다 
	public void handleMessage(String message, Session userSession) throws IOException {  
			
		ClassifyroomVO co = new ClassifyroomVO();
		ClassifyroomDAO cao = ClassifyroomDAO.getInstance();
		System.out.println("넘어온 message : "+message);
		
		String[] wantName = message.split("]");
		String name = wantName[0].substring(1);
		System.out.println("message 전송자 : " + name);
		
		String room = cao.getRoom(name);
		System.out.println("가자소켓 넘어온 ses가 있는 room :"+room);
		
		for(int i = 0; i < listclient.size(); i++) {
			//위 해쉬맵으로 부터 userSession을 키로 EndpointConfig값을 가져온다.	
			if (listclient.containsKey(userSession)) {      
				EndpointConfig config = listclient.get(userSession);
				
				// HttpSessionConfigurator에서 설정한 session값을 가져온다.	
				HttpSession session = 
						(HttpSession)config.getUserProperties().get(HttpSessionConfigurator.Session);
				
				//가져온 session으로부터 imsiName 변수에 사용자 이름을 담는다.
				MemberVO vo = (MemberVO)session.getAttribute("login");
				String imsiName = vo.getMem_id();
				System.out.println("imsiName(해쉬) : " + imsiName);
				
				//String imsiName = (String) session.getAttribute("login");
				//System.out.println("imsiName(해쉬) : " + imsiName);
				
				
				//메시지를 전달한 사용자가 들어있는 방의 사용자들을 리스트로 구한다
				ArrayList<String> ids = cao.getMemIds((room));
				
				//현재 사용자를 제외한 사용자가 들어있는 방의 사용자 id와 해쉬맵으로 부터 얻은 세션의 id가 일치하면 메시지를 전달한다
				//(= 같은 방 사용자들에게 메시지를 전달한다)
				for(String member : ids) {
					if(!listclient.equals(userSession) && member == imsiName) {
						((Session) listclient).getBasicRemote().sendText(message);
					}
				}
				
				
//				synchronized (listclient2) {
//					for(Session imsi : listclient2) {
//						
//						ArrayList<String> BelongMem = cao.getMemIds(room);
//						for(int j = 0; j < BelongMem.size(); i++) {
//							String checkName = BelongMem.get(i);
//							if( !imsi.equals(userSession) && checkName == imsiName) { 
//								imsi.getBasicRemote().sendText(message);
//							}
//						}
//					}
//				}
				
				
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