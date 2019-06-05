package com.example.demo.service;

import java.sql.Date;
//import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class loginController {
	
	@Autowired
	userService serviceU;
	@Autowired
	flightService serviceF;
	@Autowired
	flightRepo repoF;
	@Autowired
	userdataRepo repoU;

	
	userdata currentUser = new userdata();
	
	@GetMapping(value = "/login")
	public String showLoginPage(ModelMap model) {
		
//		  ModelAndView view = new ModelAndView(); 
//		  view.setViewName("login");
		serviceU.resetAllUsers();	
		return "login";
	}
	
	@PostMapping(value="/login")
	public String showWelcomePage(ModelMap model, @RequestParam String username, @RequestParam String password) {
		
		boolean check = serviceU.login(username,password);
		
		if(check) {
			return "book";
		}
		else {
			model.put("errorMessage", "Please check username or password");
			return "login";
			
		}
	}
	
	@GetMapping(value="/new")
	public String newUserPage() {
		return "new";
	}
	
	@PostMapping(value="/new")
	public String enterUserInformation(ModelMap model, @RequestParam String firstname, @RequestParam String lastname, @RequestParam String email, @RequestParam double phone) {
		
		boolean check = serviceU.addUser(model, firstname, lastname, email, phone);
		
		if(check) {
			currentUser.setFirstname(firstname);
			currentUser.setLastname(lastname);
			currentUser.setPhone(phone);
			currentUser.setEmail(email);
			return "new2";
		}
		else {
			return "new";
		}
	}
	
//	@GetMapping(value="/book")
//	public String viewBookFlights() {
//		return "book";
//	}
	
	@PostMapping(value="/book")
	public String bookFlights(ModelMap model, @RequestParam String departures, @RequestParam String arrival, @RequestParam Date depdate, @RequestParam Date arrdate, @RequestParam int passengers, @RequestParam String travelClass) {
		
		List<flights> flightList =  serviceF.findFlights(departures, arrival, depdate, arrdate, passengers, travelClass);
		model.addAttribute("flightList", flightList);
		
		if(flightList.isEmpty()) {
			model.put("errorMessage", "There are no flights availale with the criteria. Please try again.");
			return "viewflights";
		}
		else {
			return "viewflights";
		}
		
	}
	
//	@GetMapping(value="/new2")
//	public String selectFlights() {
//		return "new2";
//	}
	
	@PostMapping(value="/new2")
	public String chooseUserPass(ModelMap model, @RequestParam String username, @RequestParam String password1, @RequestParam String password2) {
		
		boolean check = serviceU.setUserPass(model, username, password1, password2, currentUser.getEmail());
		
		if(check) {
			return "login";
		}
		else {
			return "new2";
		}
	}
	
	@GetMapping(value="/selected/{flightNum}")
	public String showSelectedFlight(@PathVariable("flightNum") String flightNum, ModelMap model) {
		// fetch details from db using flightNum.\
		userdata loggedInUser = new userdata();
		List<userdata> listOfUsers = repoU.findAll();
		for(userdata user: listOfUsers) {
			if(user.isLogged_in()==true) {
				loggedInUser = user;
				break;
			}
		}
		model.put("loggedInUser", loggedInUser);
		List<flights> listOfFlights = repoF.findAll();
		for(flights flight: listOfFlights) {
			if(flight.getFlight_num().equals(flightNum)) {
				model.put("bookedFlight", flight);
				break;
			}
		}
		return "selected";
	}
	
	@PostMapping(value="/selected/{flightNum}")
	public String bookSelectedFlight(@PathVariable("flightNum") String flightNum, ModelMap model) {
		return "payment";
	}
	
}








