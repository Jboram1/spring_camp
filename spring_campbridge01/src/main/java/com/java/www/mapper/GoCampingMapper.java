package com.java.www.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.java.www.dto.GoCampingDto;

@Mapper
public interface GoCampingMapper {

	//캠핑 데이터 1개 저장
	void insertCamping(GoCampingDto campgingListDto);

	
	
	

}
