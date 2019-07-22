package com.web.icook.test;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/hello")
public class HelloWorldEndpoint {

	private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<Session>());

	public HelloWorldEndpoint() {
		System.out.println("class loaded " + this.getClass());
	}

	@OnOpen
	public void onOpen(Session session) {
		System.out.printf("Session opened, id: %s%n", session.getId());
		 sessions.add(session);
		 
		try {

			session.getBasicRemote().sendText("Hi there, we are successfully connected.");
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	@OnMessage
	public void onMessage(String message, Session session) {
		System.out.printf("Message received. Session id: %s Message: %s%n", session.getId(), message);
		for (Session openSession : sessions)
			try {
				System.out.println("session.getId()==" + session.getId());
				openSession.getBasicRemote().sendText(String.format("準備要給所有人We received your message: %s%n", message));
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

//@ServerEndpoint("/ws/{user}")
//public class WSServer {
//	private String currentUser;
//
//	@OnOpen
//	public void onOpen(@PathParam("user") String user, Session session) {
//
//		currentUser = user;
//
//		System.out.println("Connected ... " + session.getId());
//
//	}
//
//	@OnMessage
//	public String onMessage(String message, Session session) {
//
//		System.out.println(currentUser + "：" + message);
//		return currentUser + "：" + message;
//
//	}
//
//	@OnClose
//	public void onClose(Session session, CloseReason closeReason) {
//
//		System.out.println(String.format("Session %s closed because of %s", session.getId(), closeReason));
//
//	}
//
//	@OnError
//	public void onError(Throwable t) {
//
//		t.printStackTrace();
//
//	}

//}
