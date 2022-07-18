package com.oaga.oaga_v1.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.oaga.oaga_v1.auth.PrincipalDetail;
import com.oaga.oaga_v1.dto.ResponseDto;
import com.oaga.oaga_v1.reviewModel.Reply;
import com.oaga.oaga_v1.service.ReviewService;

@RestController
public class ReviewApiController {
	
	@Autowired
	private ReviewService reviewService;

	// 댓글 등록
	// api/review/${data.reviewId}/reply
	@PostMapping("/api/review/{reviewId}/reply")
	private ResponseDto<Reply> saveReply(@PathVariable int reviewId, @RequestBody Reply reply, @AuthenticationPrincipal PrincipalDetail detail) {
		Reply replyEntity = reviewService.saveReply(reviewId, detail.getUser(), reply);
		return new ResponseDto<>(HttpStatus.OK, replyEntity);
	}
	
	// 댓글 삭제
	// /api/review/${reviewId}/reply/${replyId}
	@DeleteMapping("/api/review/reply/{replyId}")
	private ResponseDto<Integer> deleteReply(@PathVariable int replyId) {
		// 서비스에 요청
		reviewService.deleteReply(replyId);
		return new ResponseDto<>(HttpStatus.OK, 1);
	}
	

}
