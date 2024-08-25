package webSocket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import dao.ChatRoomDAO;

@ServerEndpoint("/EstimateBroadCasting")
public class EstimateChatWebSocket {
	
public static Set<Session> setClients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnMessage	// 클라이언트부터 메시지가 도착했을 때
	public void onMessage(String message, Session session) throws Exception {
		ChatRoomDAO crDao = new ChatRoomDAO();
		try {
			JSONParser jsonParser = new JSONParser();
            
            //JSON데이터를 넣어 JSON Object 로 만들어 준다.
            JSONObject jsonObject = (JSONObject) jsonParser.parse(message);
            
            System.out.println("유저IDX : " + jsonObject.get("usersIdx"));
            System.out.println("채팅방IDX : " + jsonObject.get("roomIdx"));
            System.out.println("채팅내용 : " + jsonObject.get("content"));
            
            // 반환 타입은 'Object'
            // Object는 모든 Java 객체의 최상위 타입이므로, JSON에서 추출한 값의 실제 타입에 관계없이 저장 가능
            Object roomIdxObj = jsonObject.get("roomIdx");
            Object usersIdxObj = jsonObject.get("usersIdx");
            String content = (String)jsonObject.get("content");
            
            int roomIdx;
            int usersIdx;
            
            // JSON 객체에서 값의 타입은 동적이기 때문에, 
            // 이 값이 실제로 String, Long, Integer 등 어떤 타입인지 확인할 필요
            // 'roomIdxObj', 'usersIdxObj'의 실제 타입을 확인한 후 적절히 변환하여 사용
            // Long 타입일 경우 intValue() 메서드를 사용하여 int로 변환합니다.
            // String 타입일 경우 Integer.parseInt() 메서드를 사용하여 int로 변환합니다.
            if (roomIdxObj instanceof Long) {
                roomIdx = ((Long) roomIdxObj).intValue();
            } else if (roomIdxObj instanceof String) {
                roomIdx = Integer.parseInt((String) roomIdxObj);
            } else {
                throw new IllegalArgumentException("Unexpected type for roomIdx");
            }
            
            if (usersIdxObj instanceof Long) {
                usersIdx = ((Long) usersIdxObj).intValue();
            } else if (usersIdxObj instanceof String) {
                usersIdx = Integer.parseInt((String) usersIdxObj);
            } else {
                throw new IllegalArgumentException("Unexpected type for usersIdx");
            }
            
            synchronized(setClients) {	// (동기화처리)
            	for(Session client : setClients) {
            		if(!client.equals(session)) {
            			client.getBasicRemote().sendText(content);
            		}
            	}
            }
            
            crDao.insertChatContents(roomIdx, usersIdx, content);
            
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@OnOpen		// 새로운 클라이언트가 서버로 접속했을 때
	public void onOpen(Session session) {
		setClients.add(session);
		System.out.println("새로운 클라이언트! / 현재 참여자 수 : " + setClients.size() + "명입니다.");
	}
	
	@OnClose	// 클라이언트의 접속이 끊어졌을 때
	public void onClose(Session session) {
		setClients.remove(session);
	}
}
