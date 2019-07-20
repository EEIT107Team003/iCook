package forum.model;

import java.util.Set;

public class MessageDescription {
	
	private	String				from;
	private	String				text;
	private	String				time;
	private	Set<User> 			users;
	
	
	public MessageDescription(String from, String text, String time, Set<User> users) {
		this.from = from;
		this.text = text;
		this.time = time;
		this.users = users;
	}
	public String getFrom() {
		return from;
	}
	public String getText() {
		return text;
	}
	public String getTime() {
		return time;
	}
	public Set<?> getUsers() {
		return users;
	}
}
