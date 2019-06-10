package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

@Service
public class userService {
	
//	@Autowired
//	userRepo repo1;
	
	@Autowired
	userdataRepo repoU;
	
	@Autowired
	passengersRepo repoP;
	
	int id;
	String firstname;
	String lastname;
	String phone;
	
	public boolean login(String username, String password) {
		List<userdata> userData = repoU.findByUsername(username);  //change this loop
		for(userdata user : userData) {
			if(user.getPassword().equals(password) && user.getUsername().equals(username)) {
				user.setLogged_in(true);
				repoU.save(user);
				return true;
			}
		}
		return false;
	}

	public boolean addUser(ModelMap model, String firstname, String lastname, String email, String phone) {
		List<userdata> userInfo = repoU.findAll(); // change
		if(userInfo.isEmpty()){
			userdata temp = new userdata();
			temp.setFirstname(firstname);
			temp.setLastname(lastname);
			temp.setEmail(email);
			temp.setPhone(phone);
			repoU.save(temp);
			return true;
		}
		
		for(userdata user: userInfo) {
			if(user.getEmail().equals(email)) {
				model.put("errorEmail", "This email address is already registered.");
				return false;
			}
			else if(user.getPhone().equals(phone)) {
				model.put("errorPhone", "This phone number is already registered.");
				return false;
			}
		}
		
		userdata temp = new userdata();
		temp.setFirstname(firstname);
		temp.setLastname(lastname);
		temp.setEmail(email);
		temp.setPhone(phone);
		repoU.save(temp);
		return true;
	}

	public boolean setUserPass(ModelMap model, String username, String password1, String password2, String email) {
		List<userdata> userInfo = repoU.findAll();
		
		if(!password1.equals(password2)) {
			model.put("errorPass", "Passwords do not match");
			return false;
		}
//		for(userdata user: userInfo) {
//			if(user.getUsername().equals(username)) {
//				model.put("errorUsername", "Username already exists.");
//				return false;
//			}
//		}
		
		for(int i=0; i<userInfo.size()-1; i++) {
			if(userInfo.get(i).getUsername().equals(username)) {
				model.put("errorUsername", "Username already exists.");
				return false;
			}
		}
		
		for(userdata user : userInfo) {
			if(user.getEmail().equals(email)) {
				id = user.getId();
				firstname = user.getFirstname();
				lastname = user.getLastname();
				phone = user.getPhone();
		}
	}
		userdata temp = new userdata();
		temp.setFirstname(firstname);
		temp.setLastname(lastname);
		temp.setEmail(email);
		temp.setPhone(phone);
		temp.setUsername(username);
		temp.setPassword(password1);
		repoU.deleteById(id);
		repoU.save(temp);
		return true;
	}

	public void resetAllUsers() {
		List<userdata> listOfUsers = repoU.findAll();
		for(userdata user: listOfUsers) {
			user.setLogged_in(false);
		}
		repoU.saveAll(listOfUsers);
	}

	public void addPassenger(String flightNum, String firstname2, String lastname2) {
		userdata currentUser = new userdata();
		List<userdata> listOfUsers = repoU.findAll();
		for(userdata user: listOfUsers) {
			if(user.isLogged_in()==true) {
				currentUser = user;
			}
		}
		passengers newPassenger = new passengers();
		newPassenger.setFirstname(firstname2);
		newPassenger.setLastname(lastname2);
		newPassenger.setFlightid(flightNum);
		newPassenger.setUserid(currentUser.getId());
		repoP.save(newPassenger);
	}
}








