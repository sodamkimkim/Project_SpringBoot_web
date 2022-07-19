package com.oaga.oaga_v1.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.oaga.oaga_v1.auth.PrincipalDetail;
import com.oaga.oaga_v1.dto.KakaoProfile;
import com.oaga.oaga_v1.dto.KakaoProfile.KakaoAccount;
import com.oaga.oaga_v1.dto.OAuthToken;
import com.oaga.oaga_v1.dto.RequestUserProfileDto;
import com.oaga.oaga_v1.reviewModel.Review;
import com.oaga.oaga_v1.service.ReviewService;
import com.oaga.oaga_v1.service.UserService;
import com.oaga.oaga_v1.userModel.RoleType;
import com.oaga.oaga_v1.userModel.User;

@Controller
public class UserController {

	@Value("${oaga.key}")
	private String oagaKey;

	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	private HttpSession httpSession;

	@Autowired
	private UserService userService;

	@Autowired
	private RequestUserProfileDto userProfileDto;

	@Autowired
	ReviewService reviewService;
	
	@GetMapping("/auth/login_form")
	public String loginForm() {
		return "user/login_form";
	}

	@GetMapping("/auth/join_form")
	public String joinForm() {
		return "user/join_form";
	}

	@GetMapping("/auth/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null) {
			new SecurityContextLogoutHandler().logout(request, response, authentication);
		}
		return "redirect:/";
	}


	@GetMapping("/user/updateUserInfo_form")
	public String updateForm() {
		return "user/update_form";
	}
	

	@PostMapping("/auth/joinProc")
	public String save(RequestUserProfileDto dto) {
			dto.setRole(RoleType.USER);
	
		int result = userService.saveUser(dto);
		return "redirect:/";
	}

//<그냥 참고>	
//	// 로그인 되어있지 않은 경우
//	@GetMapping("/review")
//	public String reviewHome(@PageableDefault(size = 6, sort = "count", direction = Direction.DESC) Pageable pageable,
//			Model model) {
//		Page<Review> reviews = reviewService.getBestReviewList(pageable);
//		List<User> bestUser = userService.bestUser();
//		System.out.println(bestUser);
//		
//		model.addAttribute("reviews", reviews);
//		model.addAttribute("bestUser", bestUser);
//		return "/review/home";
//	}
//	// 로그인 한 경우
//	@GetMapping("/mreview")
//	public String reviewHome(@PageableDefault(size = 6, sort = "count", direction = Direction.DESC) Pageable pageable,
//			Model model, @AuthenticationPrincipal PrincipalDetail detail) {
//		Page<Review> reviews = reviewService.getBestReviewList(pageable);
//		int reviewCount = reviewService.reviewCount(detail.getUser().getId());
//		List<User> bestUser = userService.bestUser();
//		System.out.println(bestUser);
//		
//		model.addAttribute("reviews", reviews);
//		model.addAttribute("reviewCount", reviewCount);
//		model.addAttribute("bestUser", bestUser);
//		return "/review/home";
//	}
//	
//	// a태그는 항상 get으로 mapping한다.
//	@GetMapping("/board/{id}")
//	public String findById(@PathVariable int id, Model model) {
//		model.addAttribute("board", boardService.boardDetail(id));
//		return "/board/detail";
//	}
//
//	@GetMapping("/board/{id}/update_form")
//	public String updateForm(@PathVariable int id, Model model) {
//		model.addAttribute("board", boardService.boardDetail(id));
//		return "/board/update_form";
//	}
//	///////////////////////////////////////////////////////////////////

//	@GetMapping("/myPage_form")
//	public String myPage(Model model) {
//		
//		System.out.println("");
//		return "user/mypage_form";
//	}
	//로그인한 자기 정보 가져오기
	//프로필사진, 여행리뷰 작성한거
	@GetMapping("/myPage_form")
	public String userInfo(@PageableDefault(size = 6, sort = "createDate", direction=Direction.DESC) Pageable pageable ,Model model, @AuthenticationPrincipal PrincipalDetail detail) {
		User myInfo = userService.searchUser(detail.getUsername());
		Page<Review> myReviews = reviewService.getMyReviews(pageable, detail.getUser().getId());
		System.out.println("in UserController, session의 myInfo찍어봄."+myInfo.toString());
		System.out.println("in UserController, myReviews: " + myReviews.toString());
		int nowPage = myReviews.getPageable().getPageNumber() +1;
		int startPage = Math.max(nowPage-2, 1);
		int endPage = Math.min(nowPage + 2, myReviews.getTotalPages());
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for(int i = startPage; i <=endPage;i++) {
			pageNumbers.add(i);
		}
		model.addAttribute("myinfo", myInfo);
		model.addAttribute("myReviews", myReviews);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageNumbers",pageNumbers);
		return "user/mypage_form";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 소셜로그인
	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(@RequestParam String code) {
		/**
		 * Oaga Rest Api 키 : 31c71a748886ababf2df137e8f33a1a4 사이트 도메인 :
		 * http://localhost:9090 redirect uri:
		 * http://localhost:9090/oaga/auth/kakao/callback
		 * 
		 */

		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();

		// header
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "31c71a748886ababf2df137e8f33a1a4");
		params.add("redirect_uri", "http://localhost:9090/oaga/auth/kakao/callback");
		params.add("code", code);

		// header와 body하나의 object로 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

		// Http요청(post)
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				kakaoTokenRequest, String.class);

		OAuthToken authToken = null;
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			authToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		RestTemplate rt2 = new RestTemplate();
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + authToken.getAccessToken());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<>(headers2);
		ResponseEntity<KakaoProfile> kakaoProfileResponse = rt2.exchange("https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST, kakaoProfileRequest, KakaoProfile.class);

		KakaoAccount account = kakaoProfileResponse.getBody().getKakaoAccount();
		System.out.println("카카오 아이디: " + kakaoProfileResponse.getBody().getId());
		System.out.println("카카오 이메일: " + account.getEmail());
		System.out.println("블로그에서 사용될 유저네임 : " + account.getEmail() + "_" + kakaoProfileResponse.getBody().getId());

				
		User kakaoUser = User.builder().username(account.getEmail() + "_" + kakaoProfileResponse.getBody().getId())
				.password(oagaKey).email(account.getEmail()).oauth("kakao").build();
		System.out.println("카카오유저 :" + kakaoUser);
		User originUser = userService.searchUser(kakaoUser.getUsername());
		if (originUser.getUsername() == null) {
			System.out.println("카카오유전데 신규라서 회원가입할거임");
			userService.saveUser(kakaoUser);
		}
		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(kakaoUser.getUsername(), oagaKey));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		return "redirect:/";
	}
}
