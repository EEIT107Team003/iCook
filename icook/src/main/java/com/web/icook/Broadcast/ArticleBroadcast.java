package com.web.icook.Broadcast;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ArtBroadcast")
public class ArticleBroadcast {
	private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<Session>());

	public ArticleBroadcast() {
		System.out.println("class loaded " + this.getClass());
	}

	@OnOpen
	public void onOpen(Session session) {
		System.out.printf("Session opened, id: %s%n", session.getId());
		sessions.add(session);

	}

	@OnMessage
	public void onMessage(String message, Session session) {
		System.out.printf("Message received. Session id: %s Message: %s%n", session.getId(), message);
		for (Session openSession : sessions)
			try {
				System.out.println("session.getId()==" + session.getId());
				openSession.getBasicRemote().sendText("最新消息:" + message);
//				session.getBasicRemote().sendText(String.format("準備要給所有人We received your message: %s%n", message));
			} catch (IOException ex) {
				ex.printStackTrace();
			}
	}

	@OnError
	public void onError(Throwable e) {
		e.printStackTrace();
	}

	@OnClose
	public void onClose(Session session) {
		System.out.printf("Session closed with id: %s%n", session.getId());
		sessions.remove(session);
	}
}
