package com.java.www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.www.dto.GoCampingDto;
import com.java.www.mapper.GoCampingMapper;

@Service
public class GoCampingServiceImpl implements GoCampingService {
	
	@Autowired GoCampingMapper goCampingMapper;
	
	

	@Override //캠핑 데이터 1개 저장
	public void insertCamping(GoCampingDto campgingListDto) {
		goCampingMapper.insertCamping(campgingListDto);
	}

}
