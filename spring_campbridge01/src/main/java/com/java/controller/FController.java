package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("my")
public class FController {

	
	@GetMapping("/")
	public String index() {
		return "index";
	}// index()
	
	@GetMapping("login")
	public String login() {
		return "/my/login";
	}// login()
	
	//id 찾기
		@GetMapping("idpw_search")
		public String idpw_search() {
			return "/my/idpw_search";
		}// login()
	
		//id 찾기완료
		@GetMapping("idsearch")
		public String idsearch() {
			return "/my/idsearch";
		}// login()
		
		//pw 찾기완료
		@GetMapping("pwsearch")
		public String pwsearch() {
			return "/my/pwsearch";
		}// login()
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////로그인(id, pw 찾기)
		
		//회원가입 페이지
		@GetMapping("signUp")
		public String signUp() {
			return "/my/signUp";
		}// signUp()
		
		//회원가입 완료
		@GetMapping("signUp02")
		public String signUp02() {
			return "/my/signUp02";
		}// signUp02()
	
	
}
