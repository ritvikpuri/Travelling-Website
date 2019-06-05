package com.example.demo.service;

import java.sql.Date;
import java.util.ArrayList;
//import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class flightService {

	@Autowired
	flightRepo repo;

	public List<flights> findFlights(String departure, String arrival, Date depdate, Date arrdate, int passengers, String travelClass) {
		
		List<flights> possibleFlights = new ArrayList<>();
		List<flights> allFlights = repo.findAll();
		for(flights flight: allFlights) {
			if(flight.getDeparture().equalsIgnoreCase(departure) && flight.getArrival().equalsIgnoreCase(arrival) && flight.getArr_time().equals(arrdate) && flight.getDep_time().equals(depdate)) {
				if(travelClass.equalsIgnoreCase("Economy") && flight.getEconomy()>=passengers) {
					possibleFlights.add(flight);
				}
				if(travelClass.equalsIgnoreCase("Business") && flight.getBusiness()>=passengers) {
					possibleFlights.add(flight);
				}
				if(travelClass.equalsIgnoreCase("First") && flight.getFirst()>=passengers) {
					possibleFlights.add(flight);
				}
			}
		}
		return possibleFlights;
	}
}
