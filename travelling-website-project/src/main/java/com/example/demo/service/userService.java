package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class userService {
	
	@Autowired
	userRepo repo;
	
	public boolean login(String username, String password) {
		List<users> userData = repo.findAll();
		for(users user : userData) {
			if(user.getPassword().equals(password) && user.getUsername().equals(username)) {
				return true;
			}
		}
		return false;
	}

	public boolean addUser(String username, String password) {
		List<users> userData = repo.findAll();
		boolean check = false;
		
		if (userData.isEmpty()){
			users temp = new users();
			temp.setUsername(username);
			temp.setPassword(password);
			repo.save(temp);
			return true;
		}
		else {
			for(users user: userData) {
				if(user.getUsername().equals(username)) {
					check = false;
				}
				else {
					check = true;
				}
			}
			if(check) {
				users temp = new users();
				temp.setUsername(username);
				temp.setPassword(password);
				repo.save(temp);
				return true;
			}
		}
		return false;
	}
}
