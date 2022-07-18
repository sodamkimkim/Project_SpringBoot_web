<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/user/myPageStyle.css" />
<div class="re_list_box">
	<div class="profile_b">
		<div class="text-center my-5 myPageEditWrap">
			<img class="img-fluid rounded-circle mb-4 myPageProfile"
				src="https://dummyimage.com/150x150/6c757d/dee2e6.jpg" alt="...">
			<div class="myPageEditBtns">
			
			<!-- "javascript: form.action='/oaga/api/review/upload';" -->
				<button class="editUserInfoBtn btn" ><a href="/oaga/user/updateUserInfo_form">회원정보 수정하기
				</a></button>
				
				<button class="editUserProfile btn">회원 프로필 수정하기</button>
			</div>
		</div>
		<div class="info_box">
			<div class="info">
				<p class="logged_cnt_box logged_clip">
					<b>작성한 리뷰</b> <span>0</span>
				</p>
				<div class="logged_line">&nbsp;</div>
				<p class="logged_cnt_box logged_plan">
					<b>좋아요</b> <span>0</span>
				</p>
				<div class="logged_line">&nbsp;</div>
				<p class="logged_cnt_box logged_qa">
					<b>Q&amp;A</b> <span>0</span>
				</p>
			</div>
		</div>
	</div>
	<!-- 리뷰 리스트 -->
	<section class="review_list_container">
		<header class="li_header">
			<div>
				<h3 class="li_title">${principal.user.userNickName}님이작성한 리뷰</h3>
			</div>
		</header>
		<ul>
			<li class="li_item"><a class="li_item_a" href="#">
					<p style="margin-left: 1rem; margin-right: 20px; font-size: 30px;">ㆍ</p>
					<img class="li_item_img" src="/oaga/images/reviewPage/reviewer.jpg">
					<div class="li_t_wrap">
						<h3 class="li_item_t">리뷰 제목</h3>
						<h4 class="li_item_d">작성일</h4>
					</div> <span class="Icon_icon__2BP_o TabOverview_icon__3umjF"
					aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 24 24">
							<path
								d="M6.49 20.13L8.26 21.9 18.16 12 8.26 2.1 6.49 3.87 14.62 12 6.49 20.13z"></path></svg></span>
			</a></li>
			<li class="li_item"><a class="li_item_a" href="#">
					<p style="margin-left: 1rem; margin-right: 20px; font-size: 30px;">ㆍ</p>
					<img class="li_item_img" src="/oaga/images/reviewPage/reviewer.jpg">
					<div class="li_t_wrap">
						<h3 class="li_item_t">리뷰 제목</h3>
						<h4 class="li_item_d">작성일</h4>
					</div> <span class="Icon_icon__2BP_o TabOverview_icon__3umjF"
					aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 24 24">
							<path
								d="M6.49 20.13L8.26 21.9 18.16 12 8.26 2.1 6.49 3.87 14.62 12 6.49 20.13z"></path></svg></span>
			</a></li>
			<li class="li_item"><a class="li_item_a" href="#">
					<p style="margin-left: 1rem; margin-right: 20px; font-size: 30px;">ㆍ</p>
					<img class="li_item_img" src="/oaga/images/reviewPage/reviewer.jpg">
					<div class="li_t_wrap">
						<h3 class="li_item_t">리뷰 제목</h3>
						<h4 class="li_item_d">작성일</h4>
					</div> <span class="Icon_icon__2BP_o TabOverview_icon__3umjF"
					aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 24 24">
							<path
								d="M6.49 20.13L8.26 21.9 18.16 12 8.26 2.1 6.49 3.87 14.62 12 6.49 20.13z"></path></svg></span>
			</a></li>


		</ul>
	</section>

</div>


<%@ include file="../layout/footer.jsp"%>
