package com.example.demo.service;

import java.text.ParseException;
//import java.sql.Date;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class flightService {

	@Autowired
	flightRepo repo;

	public List<flights> findFlights(String departure, String arrival, Date depdate, int passengers,
			String travelClass) throws ParseException {

		List<flights> possibleFlights = new ArrayList<>();
		List<flights> allFlights = repo.findAll();
		for (flights flight : allFlights) {

			String fixedDepDate = flight.getDep_time().toString();
			String d = fixedDepDate.split(" ")[0];
			
			if (flight.getDeparture().equalsIgnoreCase(departure) && flight.getArrival().equalsIgnoreCase(arrival)
					&& d.equals(depdate.toString())) {
				if (travelClass.equalsIgnoreCase("Economy") && flight.getEconomy() >= passengers) {
					possibleFlights.add(flight);
				}
				if (travelClass.equalsIgnoreCase("Business") && flight.getBusiness() >= passengers) {
					possibleFlights.add(flight);
				}
				if (travelClass.equalsIgnoreCase("First") && flight.getFirst() >= passengers) {
					possibleFlights.add(flight);
				}
			}
		}
		return possibleFlights;
	}
	
//	public List<flights> findFlights(String departure, String arrival, Date depdate, Date arrdate, int passengers,
//			String travelClass) throws ParseException {
//
//		List<flights> possibleFlights = new ArrayList<>();
//		List<flights> allFlights = repo.findAll();
//		for (flights flight : allFlights) {
//			
//			String fixedArrDate = flight.getArr_time().toString();
//			String f = fixedArrDate.split(" ")[0];
//
//			String fixedDepDate = flight.getDep_time().toString();
//			String d = fixedDepDate.split(" ")[0];
//			
//			if (flight.getDeparture().equalsIgnoreCase(departure) && flight.getArrival().equalsIgnoreCase(arrival)
//					&& f.equals(arrdate.toString()) && d.equals(depdate.toString())) {
//				if (travelClass.equalsIgnoreCase("Economy") && flight.getEconomy() >= passengers) {
//					possibleFlights.add(flight);
//				}
//				if (travelClass.equalsIgnoreCase("Business") && flight.getBusiness() >= passengers) {
//					possibleFlights.add(flight);
//				}
//				if (travelClass.equalsIgnoreCase("First") && flight.getFirst() >= passengers) {
//					possibleFlights.add(flight);
//				}
//			}
//		}
//		return possibleFlights;
//	}
}
