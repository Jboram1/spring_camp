package com.java.www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.www.dto.User_campDto;
import com.java.www.mapper.User_campMapper;

@Service
public class User_campServiceImpl implements User_campService {

	@Autowired
	User_campMapper userCampMapper;
	
	
	@Override //로그인
	public User_campDto loginSelect(User_campDto ucdto) {
		User_campDto usercampDto = userCampMapper.loginSelect(ucdto);
		return usercampDto;
	}

	
	@Override //아이디찾기 -name,mail
	public User_campDto idsearch(String name, String email) {
		User_campDto ucdto = userCampMapper.idsearch(name,email);
		return ucdto;
	}

}
