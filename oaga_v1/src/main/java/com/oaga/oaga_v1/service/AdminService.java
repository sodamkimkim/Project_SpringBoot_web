package com.oaga.oaga_v1.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oaga.oaga_v1.dto.RequestRestaurantDto;
import com.oaga.oaga_v1.dto.RequestTravelDto;
import com.oaga.oaga_v1.dto.RequestUpdateHotplaceDto;
import com.oaga.oaga_v1.dto.RequestUpdateRestaurantDto;
import com.oaga.oaga_v1.placeModel.Area;
import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.placeModel.HotPlace;
import com.oaga.oaga_v1.placeModel.Restaurant;
import com.oaga.oaga_v1.repository.AreaRepository;
import com.oaga.oaga_v1.repository.HotPlaceRepository;
import com.oaga.oaga_v1.repository.RestaurantRepositoryt;
import com.oaga.oaga_v1.repository.AreaGuRepository;
import com.oaga.oaga_v1.repository.UserRepository;
import com.oaga.oaga_v1.userModel.User;

@Service
public class AdminService {

	@Value("${file.path}")
	private String uploadFolder;

	@Autowired
	private AreaRepository areaRepository;
	@Autowired
	private AreaGuRepository travelInfoRepository;
	@Autowired
	private HotPlaceRepository guInfoRepository;

	@Autowired
	private RestaurantRepositoryt restaurantRepository;
	
	@Autowired
	private UserRepository userRepository;

	@Transactional
	public List<Area> areaAll() {
		return areaRepository.findAll();
	}

	@Transactional
	public List<AreaGu> areaGuAll(int area) {
		return travelInfoRepository.mAreaIdList(area);
	}

	public List<AreaGu> areaGuNmae(int id) {
		return travelInfoRepository.mAreaGuId(id);
	}

	public List<HotPlace> findAreaGuId(int areaGuId) {
		return guInfoRepository.mFindByAreaGu(areaGuId);
	}

	public List<HotPlace> findHotplaceId(int hotplaceId) {
		return guInfoRepository.mFindByid(hotplaceId);
	}

	public List<Restaurant> findAreaGuId2(int areaGuId) {
		return restaurantRepository.mRestaurantGroupByGuInfoId(areaGuId);
	}

	public List<Restaurant> findRestaurant(int areaGuId) {
		return restaurantRepository.mFindByRestaurant(areaGuId);
	}

	private String extracktExt(String originalFileName) {
		int pos = originalFileName.lastIndexOf(".");
		return originalFileName.substring(pos + 1);
	}

	@Transactional
	public void saveGuInfo(RequestTravelDto dto) {
		UUID uuid = UUID.randomUUID();
		String imageFileName = uuid.toString() + "." + extracktExt(dto.getFile().getOriginalFilename());
		String newFileName = (imageFileName.trim()).replaceAll("\\s", "");

		Path imageFilePath = Paths.get(uploadFolder + newFileName);
		System.out.println("dmsapdmpasmdpasdmaps");

		try {
			Files.write(imageFilePath, dto.getFile().getBytes());
			guInfoRepository.save(dto.toEntity(newFileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Transactional
	public Page<Restaurant> searchRestaurantByTitle(String title, Pageable pageable) {
		return restaurantRepository.findByNameContaining(title, pageable);

	}

	@Transactional
	public void deleteRestaurantById(int restaurantId) {
		restaurantRepository.deleteById(restaurantId);
	}

	@Transactional
	public void saveRestaurant(RequestRestaurantDto dto) {
		UUID uuid = UUID.randomUUID();
		String imageFileName = uuid.toString() + "." + extracktExt(dto.getFile().getOriginalFilename());
		String newFileName = (imageFileName.trim()).replaceAll("\\s", "");
		Path imageFilePath = Paths.get(uploadFolder + newFileName);
		System.out.println("dmsapdmpasmdpasdmaps");
		try {
			Files.write(imageFilePath, dto.getFile().getBytes());
			restaurantRepository.save(dto.toEntity(newFileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@Transactional
	public void updateGuInfo(RequestUpdateHotplaceDto dto, int id) {
		
		HotPlace hotplaceEntity = guInfoRepository.mFindByid2(id);

		UUID uuid = UUID.randomUUID();
		String imageFileName = uuid.toString() + "." + extracktExt(dto.getFile().getOriginalFilename());
		String newFileName = (imageFileName.trim()).replaceAll("\\s", "");
		Path imageFilePath = Paths.get(uploadFolder + newFileName);
		try {
			Files.write(imageFilePath, dto.getFile().getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		hotplaceEntity.getId();
		hotplaceEntity.setName(dto.getName());
		hotplaceEntity.setAddress(dto.getAddress());
		hotplaceEntity.setContent(dto.getContent());
		hotplaceEntity.getAreaGu();
		hotplaceEntity.getCategoryType();
		hotplaceEntity.getCreateDate();
		hotplaceEntity.setImage(newFileName);
		hotplaceEntity.setOriginImageUrl(dto.getOriginImageUrl());
			
		
	}

	@Transactional
	public void updateRestaurant(RequestUpdateRestaurantDto dto, int id) {

		Restaurant restaurantEntity = restaurantRepository.mFindByRestaurantId2(id);

		
		UUID uuid = UUID.randomUUID();
		String imageFileName = uuid.toString() + "." + extracktExt(dto.getFile().getOriginalFilename());
		String newFileName = (imageFileName.trim()).replaceAll("\\s", "");
		Path imageFilePath = Paths.get(uploadFolder + newFileName);
		try {
			Files.write(imageFilePath, dto.getFile().getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
			
			restaurantEntity.getId();
			restaurantEntity.setName(dto.getName());
			restaurantEntity.setAddress(dto.getAddress());
			restaurantEntity.setContent(dto.getContent());
			restaurantEntity.getAreaGu();
			restaurantEntity.getCategoryType();
			restaurantEntity.getCreateDate();
			restaurantEntity.setOriginImageUrl(dto.getOriginImageUrl());
			restaurantEntity.setImage(newFileName);

	}
	
	// 놀거리 검색
	public Page<HotPlace> findBySearchTitle(Pageable pageable, String searchTitle) {
		return guInfoRepository.findByNameContaining(searchTitle, pageable);
	}
	
	// 회원정보 검색
	@Transactional(readOnly = true)
	public Page<User> searchUser(String searchName, Pageable pageable) {
		return userRepository.findByUserNickName(pageable, searchName);
	}
	
	// 회원 삭제
	@Transactional
	public void deleteUser(int userId) {
		userRepository.deleteById(userId);
	}
	
	// oauth별로 조회
	public Page<User> findByUserOauth(Pageable pageable ,String oauth) {
		return userRepository.findByOauth(pageable, oauth);
	}
	
	// 놀거리 삭제
	@Transactional
	public void deletePlay(int id) {
		guInfoRepository.deleteById(id);
	}
}
