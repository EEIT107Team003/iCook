package forum.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import forum.model.User;
import forum.model.Users;

@RestController //該註釋將標註的類別內的所有方法預設使用@ResponseBody標註
public class MyRestController {

	@Autowired
	Users users;
	
	@RequestMapping(value = "/getuserlist", method = RequestMethod.GET, produces = "application/json")
	public Set<User> getUsers(){
		return users.getUsers();
	}
}
