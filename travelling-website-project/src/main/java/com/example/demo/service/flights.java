package com.example.demo.service;

import java.util.Date;
//import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.Table;

@Entity
@Table(appliesTo = "flights")
public class flights {

	@Id
	@Column(name="flight_num")
	private String flight_num;
	
	@Column//(name="airlines")
	private String airlines;
	
	@Column
	private String departure;
	
	@Column
	private String arrival;

	@Column
	private Date dep_time;
	
	@Column
	private Date arr_time;
	
	@Column
	private int economy;
	
	@Column
	private int business;
	
	@Column
	private int first;
	
	@Column
	private int price;

	@Column
	private String duration;
	
	public String getFlight_num() {
		return flight_num;
	}

	public void setFlight_num(String flight_num) {
		this.flight_num = flight_num;
	}

	public String getAirlines() {
		return airlines;
	}

	public void setAirlines(String airlines) {
		this.airlines = airlines;
	}

	public String getDeparture() {
		return departure;
	}

	public void setDeparture(String departure) {
		this.departure = departure;
	}

	public String getArrival() {
		return arrival;
	}

	public void setArrival(String arrival) {
		this.arrival = arrival;
	}

	public Date getArr_time() {
		return arr_time;
	}

	public void setArr_time(Date arr_time) {
		this.arr_time = arr_time;
	}

	public Date getDep_time() {
		return dep_time;
	}

	public void setDep_time(Date dep_time) {
		this.dep_time = dep_time;
	}

	public int getEconomy() {
		return economy;
	}

	public void setEconomy(int economy) {
		this.economy = economy;
	}

	public int getBusiness() {
		return business;
	}

	public void setBusiness(int business) {
		this.business = business;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}
	
	
}
