package forum.listener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import forum.model.Users;

public class StompDisconnectEvent implements ApplicationListener<SessionDisconnectEvent> {
	
	@Autowired
	Users users;

	@Override
	public void onApplicationEvent(SessionDisconnectEvent sessionDisconnectEvent) {
		StompHeaderAccessor sha = StompHeaderAccessor.wrap(sessionDisconnectEvent.getMessage());
		//使用StompHeaderAccessor 取得訊息的標頭
		//wrap方法「根據接收到的訊息所負載的資訊和標頭」製造一個物件實體
		
		System.out.println("STOMP Disconnect [sessionId: " + sha.getSessionId() + "]");
        users.removeUsers(sha.getSessionId());
        //將斷線使用者從用戶列表移除
        System.out.println("Disc size: " + users.getUsers().size());
	}

}
