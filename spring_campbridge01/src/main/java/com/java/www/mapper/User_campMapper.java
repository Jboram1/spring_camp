package com.java.www.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.java.www.dto.User_campDto;

@Mapper
public interface User_campMapper {

	//로그인
	User_campDto loginSelect(User_campDto ucdto);

	//아이디찾기-name,mail
	User_campDto idsearch(String name, String email);

}
