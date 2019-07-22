package com.example.demo.service;

import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
//import java.util.Date;
import java.util.List;
import java.util.ListIterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class loginController {

	@Autowired
	userdataService serviceU;
	@Autowired
	flightService serviceF;
	@Autowired
	flightRepo repoF;
	@Autowired
	userdataRepo repoU;

	@Autowired
	private UserService userService;

	@Autowired
	private SecurityService securityService;

	@Autowired
	private UserValidator userValidator;

	@Autowired
	UserRepository userRepository;
	
	@Autowired
	NotificationService notificationService;
	
	private Logger logger = LoggerFactory.getLogger(loginController.class);

	userdata currentUser = new userdata();
	ModelMap globalModel = new ModelMap();
	int tempPassengers = 0;
	ModelMap modifySeachModel = new ModelMap();


	@GetMapping(value = "/registration")
	public String registration(Model model) {
		model.addAttribute("userForm", new User());
		return "registration";
	}

	@PostMapping(value = "/registration")
	public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, ModelMap model,
			@RequestParam String firstname, @RequestParam String lastname, @RequestParam String email,
			@RequestParam String phone) {
		userValidator.validate(userForm, bindingResult); // binding result is used for registering errors

		if (bindingResult.hasErrors()) {
			return "registration";
		}

		userService.save(userForm);
		securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());
		userForm.setEmail(email);
		userForm.setFirstname(firstname);
		userForm.setLastname(lastname);
		userForm.setPhone(phone);
		return "redirect:/book";
	}

	@GetMapping("/login")
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Your username and password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");

		return "login";
	}

	@GetMapping({ "/", "/book" })
	public String book(Model model) {
		return "book";
	}

	@GetMapping(value = "/new")
	public String newUserPage() {
		return "new";
	}

	@PostMapping(value = "/new")
	public String enterUserInformation(ModelMap model, @RequestParam String firstname, @RequestParam String lastname,
			@RequestParam String email, @RequestParam String phone, @RequestParam String username,
			@RequestParam String password1, @RequestParam String password2) {

		boolean check = serviceU.addUser(model, firstname, lastname, email, phone, username, password1, password2);

		if (check) {
			return "login";
		} else {
			return "new";
		}
	}


	@PostMapping({ "/", "/book" })
	public String bookFlights(ModelMap model, @RequestParam String departures, @RequestParam String arrival,
			@RequestParam Date depdate, @RequestParam int passengers,
			@RequestParam String travelClass) throws ParseException {

		List<flights> flightList = serviceF.findFlights(departures, arrival, depdate, passengers, travelClass);
		model.addAttribute("flightList", flightList);
		tempPassengers = passengers;

		if (flightList.isEmpty()) {
			model.put("errorMessage", "There are no flights availale with the criteria. Please try again.");
			return "viewflights";
		} else {
			return "viewflights";
		}

	}
	
//	@PostMapping({ "/", "/book" })
//	public String bookFlights(ModelMap model, @RequestParam String departures, @RequestParam String arrival,
//			@RequestParam Date depdate, @RequestParam Date arrdate, @RequestParam int passengers,
//			@RequestParam String travelClass) throws ParseException {
//
//		List<flights> flightList = serviceF.findFlights(departures, arrival, depdate, arrdate, passengers, travelClass);
//		model.addAttribute("flightList", flightList);
//		tempPassengers = passengers;
//
//		if (flightList.isEmpty()) {
//			model.put("errorMessage", "There are no flights availale with the criteria. Please try again.");
//			return "viewflights";
//		} else {
//			return "viewflights";
//		}
//
//	}


	@GetMapping(value = "/selected/{flightNum}")
	public String showSelectedFlight(@PathVariable("flightNum") String flightNum, ModelMap model) {

		User loggedInUser = new User();
		String username;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			username = ((UserDetails) principal).getUsername();
		} else {
			username = principal.toString();
		}
		List<User> listOfUsers = userRepository.findAll();
		for (User user : listOfUsers) {
			if (user.getUsername().equals(username)) {
				loggedInUser = user;
			}
		}
		model.put("loggedInUser", loggedInUser);
		List<flights> listOfFlights = repoF.findAll();
		for (flights flight : listOfFlights) {
			if (flight.getFlightNum().equals(flightNum)) {
				model.put("bookedFlight", flight);
				model.put("passengers", tempPassengers);
				break;
			}
		}
		return "selected";
	}
	
//	@PostMapping(value = "/selected/{flightNum}", produces={"application/json"})
//	public String bookSelectedFlightForPassengers(@PathVariable("flightNum") String flightNum, ModelMap model,
//			@RequestBody Object passenger) {
//		model.put("flightId", flightNum);
//		//serviceU.addPassengerFromList(flightNum, passengers);
//		
//		return "payment";
//	}
	
	@PostMapping(value = "/selected/{flightNum}")
	public String bookSelectedFlight(@PathVariable("flightNum") String flightNum, ModelMap model,
			@RequestParam String firstname, @RequestParam String lastname) {
		model.put("flightId", flightNum);
//		serviceU.addPassenger(flightNum, firstname, lastname);
		String[] firstNames = firstname.split(",");
		String[] lastNames = lastname.split(",");
		List<passengers> listOfPassengers = new ArrayList<>();
		
		for(int i = 0; i < firstNames.length; i++) {
			serviceU.addPassenger(flightNum, firstNames[i], lastNames[i]);
			passengers newPassenger = new passengers();
			newPassenger.setFirstname(firstNames[i]);
			newPassenger.setLastname(lastNames[i]);
			newPassenger.setFlightid(flightNum);
			listOfPassengers.add(newPassenger);
		}
		
		User loggedInUser = new User();
		String username;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			username = ((UserDetails) principal).getUsername();
		} else {
			username = principal.toString();
		}
		List<User> listOfUsers = userRepository.findAll();
		for (User user : listOfUsers) {
			if (user.getUsername().equals(username)) {
				loggedInUser = user;
			}
		}
		
		flights flight = repoF.findByFlightNum(flightNum);
		
		try {
			notificationService.sendNotificationNew(model, loggedInUser, listOfPassengers, flight);
		}catch(MailException e) {
			//catch error
			logger.info("error sending message"+e.getMessage());
		}
		
		return "payment";
	}


	@GetMapping(value = "/payment")
	public String showPaymentPage() {
		return "payment";
	}

	@GetMapping(value = "/logout")
	public String logout() {
		return "login";
	}

	@PostMapping(value = "/logout")
	public String returnToLogin() {
		return "login";
	}

}
