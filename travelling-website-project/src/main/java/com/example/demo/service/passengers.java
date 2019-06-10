package com.example.demo.service;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.Table;

@Entity
@Table(appliesTo="passengers")
public class passengers {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "passengerid")
	private Integer passengerid;
	
//	@Id
	@Column
	private Integer userid;
	
	@Column
	private String flightid;
	
	@Column
	private String firstname;
	
	@Column
	private String lastname;

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getFlightid() {
		return flightid;
	}

	public void setFlightid(String flightid) {
		this.flightid = flightid;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
}
