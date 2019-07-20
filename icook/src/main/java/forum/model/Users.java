package forum.model;

import java.util.HashSet;
import java.util.Set;

public class Users {
	

	private	Set<User> users;

	public Users() {
		this.users = new HashSet<>();
	}
	
	public Set<User> getUsers() {
		return users;
	}
	
	public void addUsers(User user) {
		System.out.println(user.toString());
		users.add(user);
	}
	
	public void removeUsers(String id) {
		for(User user : users) {
			if(user.getId().equals(id)) {
				System.out.println(user.toString());
				users.remove(user);
			}
		}
	}
}
