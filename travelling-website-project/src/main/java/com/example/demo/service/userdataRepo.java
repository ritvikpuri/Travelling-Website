package com.example.demo.service;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface userdataRepo extends JpaRepository<userdata, Integer>{

	List<userdata> findByUsername(String username);

}