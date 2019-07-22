package com.example.demo;
//java com.example.demo.travellingwebsiteproject;



import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class travellingwebsiteproject extends SpringBootServletInitializer{
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(travellingwebsiteproject.class);
	}

	public static void main(String[] args) throws Exception{
		SpringApplication.run(travellingwebsiteproject.class, args);
	}

}
