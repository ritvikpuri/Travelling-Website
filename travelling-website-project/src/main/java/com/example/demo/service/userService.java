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
		List<userdata> userData = repoU.findByUsername(username); // change this loop
		for (userdata user : userData) {
			if (user.getPassword().equals(password) && user.getUsername().equals(username)) {
				user.setLogged_in(true);
				repoU.save(user);
				return true;
			}
		}
		return false;
	}

	public void resetAllUsers() {
		List<userdata> listOfUsers = repoU.findAll();
		for (userdata user : listOfUsers) {
			user.setLogged_in(false);
		}
		repoU.saveAll(listOfUsers);
	}

	public void addPassenger(String flightNum, String firstname2, String lastname2) {
		userdata currentUser = new userdata();
		List<userdata> listOfUsers = repoU.findAll();
		for (userdata user : listOfUsers) {
			if (user.isLogged_in() == true) {
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

	public boolean addUser(ModelMap model, String firstname2, String lastname2, String email, String phone,
			String username, String password1, String password2) {

		List<userdata> listOfUsers = repoU.findAll();
		for (userdata user : listOfUsers) {
			if (user.getEmail().equals(email)) {
				model.put("errorEmail", "This email is already registered.");
				return false;
			}
			if (user.getPhone().equals(phone)) {
				model.put("errorPhone", "This phone number is already registered.");
				return false;
			}
			if (user.getUsername().equalsIgnoreCase(username)) {
				model.put("errorUsername", "This username is already taken.");
				return false;
			}
		}

		if (!password1.equals(password2)) {
			model.put("errorPassword", "Passwords do not match.");
			return false;
		}

		userdata temp = new userdata();
		temp.setEmail(email);
		temp.setFirstname(firstname2);
		temp.setLastname(lastname2);
		temp.setPassword(password1);
		temp.setPhone(phone);
		temp.setUsername(username);
		repoU.save(temp);
		return true;
	}
}
