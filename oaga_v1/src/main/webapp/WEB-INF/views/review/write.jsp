<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<link rel="stylesheet" href="css/review/writestyle.css" />
<style>
.reviewBody {
	margin-top: 80px;
}

.oagagnb>li>a:hover {
	color: inherit;
	text-decoration: none;
	font-family: inherit;
	font-size: 16px;
	line-height: 1;
}

.oagagnb>li>a {
	font-family: inherit;
	font-size: 16px;
	line-height: 1;
}

h1 {
	display: block;
	font-size: 32px;
	margin-block-start: 8px;
	margin-block-end: 0;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
}

.oagah1>a:hover {
	color: inherit;
	text-decoration: none;
}
</style>
<!-- 리뷰 작성 타이틀 -->
<div class="reviewBody"
	style="background-color: rgba(240, 240, 240, 0.8);">
	<div class="r_sec">
		<!-- form 태그 시작 -->
		<form method="post" name="r_form" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}">
			<div class="r_box">
				<div>
					<h3 class="title">MY여행리뷰 작성</h3>
				</div>
				<div class="t_btn">
					<button type="submit" class="write_btn" id="btn-t-save" value="ING"
						onclick="javascript: form.action='/oaga/api/review/upload/t';">임시
						저장</button>
					<button type="submit" class="write_btn" id="btn-save" value="DONE"
						onclick="javascript: form.action='/oaga/api/review/upload';">등록</button>
				</div>
				<div style="display: flex">
					<div class="place">여행지 :</div>
					<select class="i_place" name="areaName">
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="대전">대전</option>
						<option value="대구">대구</option>
						<option value="광주">광주</option>
						<option value="부산">부산</option>
						<option value="울산">울산</option>
						<option value="세종">세종</option>
						<option value="경기">경기</option>
						<option value="강원">강원</option>
						<option value="충북">충북</option>
						<option value="충남">충남</option>
						<option value="경북">경북</option>
						<option value="경남">경남</option>
						<option value="전북">전북</option>
						<option value="전남">전남</option>
						<option value="제주도">제주도</option>
					</select>
				</div>

				<div style="display: flex">
					<div class="place">제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</div>
					<input class="i_place" id="r_title" name="title"
						placeholder="제목을 입력하세요">
				</div>

				<div class="t_check">
					<!-- 라디오 버튼 구현하기 -->
					<div class="t_title">여행 테마 :</div>
					<div>
						<input type="radio" name="theme" value="나홀로여행" id="ex_rd1">
						<label class="t_radio" for="ex_rd1">나홀로 여행</label> <input
							type="radio" name="theme" value="가족여행" id="ex_rd2"> <label
							class="t_radio" for="ex_rd2">가족 여행</label> <input type="radio"
							name="theme" value="친구와함께" id="ex_rd3"> <label
							class="t_radio" for="ex_rd3">친구와 함께</label> <input type="radio"
							name="theme" value="연인과함께" id="ex_rd4"> <label
							class="t_radio" for="ex_rd4">연인과 함께</label> <input type="radio"
							name="theme" value="비즈니스여행" id="ex_rd5"> <label
							class="t_radio" for="ex_rd5">비즈니스 여행</label>
					</div>
				</div>
				<div style="display: flex; margin-bottom: 20px">
					<div class="r_image_button">대표 이미지 :</div>
					<input class="upload_name" id="r_imageUrl" readonly="readonly"
						placeholder="첨부파일"> <label class="r_image_label"
						for="r_image">파일 선택</label> <input type="file"
						class="r_image_input" id="r_image" name="file" accept="image/*"
						required="required"
						onchange="javascript:document.getElementById('r_imageUrl').value = this.value">
				</div>
				<div class=""></div>
				<div class="c_box">
					<div>
						<textarea class="summernote" id="content" name="content">
			</textarea>
					</div>

				</div>
			</div>

		</form>
	</div>
</div>


<!-- 리뷰 작성 내용 -->



<script>
	$(document).ready(function() {
		$('.summernote').summernote({
			height : 900,
			tabsize : 5,
			placeholder : '내용을 작성해 주세요'
		});

	});
</script>



<%@ include file="../layout/footer.jsp"%>