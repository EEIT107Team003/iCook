package forum.listener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.web.socket.messaging.SessionConnectedEvent;

import forum.model.User;
import forum.model.Users;

public class StompConnectEvent implements ApplicationListener<SessionConnectedEvent> {
	
	@Autowired
	Users users;

	@Override
	public void onApplicationEvent(SessionConnectedEvent sessionConnectedEvent) {
		StompHeaderAccessor sha = StompHeaderAccessor.wrap(sessionConnectedEvent.getMessage());
		//使用StompHeaderAccessor 取得訊息的標頭
		//wrap方法「根據接收到的訊息所負載的資訊和標頭」製造一個物件實體
		System.out.println("STOMP Connect [sessionId: " + sha.getSessionId() + "]");
		
		User user = new User();
		user.setId(sha.getSessionId());
		//使用StompHeaderAccessor的getSessionId方法取得SessionId並設定給user
		users.addUsers(user);
		//將user加入用戶列表
		
		System.out.println("Conn size: " + users.getUsers().size());
		System.out.println("WebSocket Connects Successfully!");
		
	}

}
