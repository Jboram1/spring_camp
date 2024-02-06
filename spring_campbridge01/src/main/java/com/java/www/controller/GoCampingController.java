package com.java.www.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.www.dto.GoCampingDto;
import com.java.www.service.GoCampingService;

@Controller
@RequestMapping("search")
public class GoCampingController {
	
	@Autowired
	GoCampingService goService;
	
	
	
	
	@RequestMapping("campsearch")
	public String campsearch() {
		return "/search/campsearch";
	}
	

	
	
	//캠핑장 목록 메소드
	@Transactional
	public String campgingList(String page, String serviceKey) throws Exception {
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/GoCamping/basedList"); /*url*/
		urlBuilder.append("?"+URLEncoder.encode("serviceKey","UTF-8") + "="+serviceKey); /*serviceKey*/
		urlBuilder.append("&"+URLEncoder.encode("numOfRows","UTF-8") + "="+URLEncoder.encode("10", "UTF-8")); /*목록 건수*/
		urlBuilder.append("&"+URLEncoder.encode("pageNo","UTF-8") + "="+URLEncoder.encode(page, "UTF-8")); /*페이지번호*/
		urlBuilder.append("&"+URLEncoder.encode("MobileOS","UTF-8") + "="+URLEncoder.encode("ETC", "UTF-8")); /*OS 구분 : IOS (아이폰), AND (안드로이드), WIN (윈도우폰), ETC(기타)*/
		urlBuilder.append("&"+URLEncoder.encode("MobileApp","UTF-8") + "="+URLEncoder.encode("AppTest", "UTF-8")); /*서비스명(어플명)*/
		urlBuilder.append("&"+URLEncoder.encode("_type","UTF-8") + "="+URLEncoder.encode("json", "UTF-8")); /*응답메세지 형식 : REST방식의 URL호출 시 json값 추가(디폴트 응답메세지 형식은XML)*/
		URL url = new URL(urlBuilder.toString());
		//URL url = new URL("https://apis.data.go.kr/B551011/GoCamping/basedList?serviceKey=q%2BhmANz1x8F%2F0t51p%2FApSH3XstZxKxTFpRCsJvSTNYW%2Fed%2F6zR%2FhzlmX%2FiK2a%2FzTK6QdD72ud%2BiNxUI4cIFVgQ%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		}else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder(); //String 을 계속 더하면 String변수를 계속 새롭게 만듬.
		String line;
		while((line = rd.readLine()) != null) {
			sb.append(line); //json 데이터를 sb에 1줄씩 저장
		}
		rd.close();
		conn.disconnect();
		
		System.out.println("----------------");
		System.out.println(sb.toString());
		System.out.println("[ json 파싱 ]");
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(sb.toString());
		System.out.println("jsonobject : "+jsonObject);
		//json데이터에서 특정값 찾기
		JSONObject jsonObject2 = (JSONObject) jsonObject.get("response");
		JSONObject jsonObject3 = (JSONObject) jsonObject2.get("body");
		JSONObject jsonObject4 = (JSONObject) jsonObject3.get("items");
		JSONArray docuArray = (JSONArray) jsonObject4.get("item");
		System.out.println("docuArray 개수 : "+docuArray.size());
		
		for(int i=0;i<10;i++) {
			JSONObject jObject = (JSONObject) docuArray.get(i);
			System.out.println("jObject facltNm" +jObject.get("facltNm"));
			
			//json데이터를 java오브젝트로 변환 : ObjectMapper
			ObjectMapper objectMapper = new ObjectMapper();
			GoCampingDto campgingListDto = null;
			
			//json데이터를 java오브젝트로 변경
			try {
				campgingListDto = objectMapper.readValue(jObject.toString(),GoCampingDto.class);
			} catch (Exception e) {e.printStackTrace();}
			
			//캠 1개 데이터 저장
			goService.insertCamping(campgingListDto);
			System.out.println("데이터 저장되었습니다.");
			
		}
		
		return sb.toString();
	}//campgingList
	
	
	
	
	

}
