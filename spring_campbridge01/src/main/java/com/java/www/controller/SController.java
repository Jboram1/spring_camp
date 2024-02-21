package com.java.www.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.www.dto.GoCampingDto;
import com.java.www.service.CampSearchService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("search")
public class SController {
	
	@Autowired CampSearchService campsearchService; // 이 서비스는 DB에서 데이터를 가져오는 로직을 담당
	@Autowired HttpSession session;
	
	

	//캠핑장 검색  //전체 가져오기
	@GetMapping("campsearch")
	public String campsearch(@RequestParam(defaultValue = "1") int page, Model model) {
		
		//전체 가져오기
		Map<String, Object> map = campsearchService.selectAll(page);
		//model에 데이터 담기
		model.addAttribute("map",map);

		return "/search/campsearch";
	}// campsearch()
	
	
	
	@PostMapping("/csMore") //더보기 버튼
	@ResponseBody
	public Map<String, Object> campsearch(@RequestParam(defaultValue = "1") int page){
		//db에서 가져오기
		System.out.println("page : "+page);
		Map<String, Object> map = campsearchService.selectAll(page);
		
		return map;
	}//campsearch
	
	
	
	@GetMapping("/sChkData")
	@ResponseBody
	public List<GoCampingDto> campsearch(@RequestParam(value="doNm[]") List<String> doNm) throws Exception{
		
		System.out.println("배열확인 : "+doNm);
		List<GoCampingDto> list = campsearchService.chSelect(doNm);
		
		return list;
	}//campsearch
	



	//캠핑장 뷰페이지
	@GetMapping("campsearch_view")
	public String campsearch_view(@RequestParam(defaultValue = "1") int contentId, Model model) {
		
		System.out.println("SC contentId : "+contentId);
		
		//게시글 1개 가져오기
		Map<String, Object> map = campsearchService.selectOne(contentId);
		
		//model저장
		model.addAttribute("map",map);
		return "/search/campsearch_view";
	}// campsearch_view()
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////캠핑장 검색
	
	//지도 검색
	@GetMapping("mapsearch")
	public String mapsearch() {
		return "/search/mapsearch";
	}// mapsearch()
	
	//지도 검색-페이지
	@GetMapping("mapsearch_view")
	public String mapsearch_view() {
		return "/search/mapsearch_view";
	}// mapsearch_view()
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////지도 검색
	
	//추천검색
	@GetMapping("recommendsearch")
	public String recommendsearch() {
		return "/search/recommendsearch";
	}// recommendsearch()
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////추천 검색
	
	//테마검색
	@GetMapping("tSearch")
	public String tSearch() {
		return "/search/tSearch";
	}// tSearch()
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////테마 검색

}
