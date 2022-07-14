package com.oaga.oaga_v1.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.placeModel.GuInfo;
import com.oaga.oaga_v1.repository.RandMarkRepository;
import com.oaga.oaga_v1.repository.TravelInfoRepository;

@Service
public class TravelInfoService {
	@Autowired
	private TravelInfoRepository travelInfoRepository;
//	@Autowired
//	private RandMarkRepository markRepository;
	
//	@Transactional
//	public List<GuInfo> guInfo(int areaGu){
//		
//		return markRepository.mFindByAreaGu(areaGu);

//	}
	

	
	@Transactional
	public List<AreaGu> seoul(){
		return travelInfoRepository.seoul();
	}
	@Transactional
	public List<AreaGu> busan(){
		return travelInfoRepository.busan();
	}
	@Transactional
	public List<AreaGu> jeju(){
		return travelInfoRepository.jeju();
	}
	@Transactional
	public List<AreaGu> deagu(){
		return travelInfoRepository.deagu();
	}
	@Transactional
	public List<AreaGu> inchun(){
		return travelInfoRepository.inchun();
	}
	
	
	
}