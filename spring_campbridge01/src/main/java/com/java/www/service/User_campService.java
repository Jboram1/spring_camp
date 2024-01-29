package com.java.www.service;

import com.java.www.dto.User_campDto;

public interface User_campService {

	
	//로그인
	User_campDto loginSelect(User_campDto ucdto);

	//아이디찾기
	User_campDto idsearch(String name, String email);

}
