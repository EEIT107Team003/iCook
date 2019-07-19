package forum.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import forum.model.Message;
import forum.model.MessageDescription;
import forum.model.Users;

@Controller
public class WebChatController {

	@Autowired
	Users users;
	
	@MessageMapping("/chat")		//類似@RequestMapping
	@SendTo("/forum/overview/topic/messages")		//傳送到哪個網域
	public MessageDescription send(final Message message) throws Exception{
		
		final String time = new SimpleDateFormat("HH:mm").format(new Date());
		System.out.println(message);
		return new MessageDescription(message.getFrom(), message.getText(), time, users.getUsers());
		
	}
}
