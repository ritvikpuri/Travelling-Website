package com.example.demo.service;

public interface UserService {
	void save(User user);
	
	User findByUsername(String username);

	public default void addUserDetails(String username, String firstname, String lastname, String email, String phone) {
		
	}
}
