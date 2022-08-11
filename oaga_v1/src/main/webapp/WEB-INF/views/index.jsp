<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
#ui-id-1 {
	width: 560px;
}

.ui-menu-item-wrapper {
	width: 560px;
}

.ui-helper-hidden-accessible>div {
	width: 560px;
}
</style>
<!-------------------------mainBn------------------------------------------------------------------------------------------>
<div class="mainBn">
	<div class="bnWrap">
		<h2>
			우리의 국내여행 커뮤니티, <span>오늘 어디가지?</span>
		</h2>
		<p class="tit">100만 사용자들의 여행리뷰를 확인하세요.</p>
		<div class="srchBox">
			<div class="searchArea">
				<form class="srch2">
					<input type="text" class="searchArea-input" id="searchArea"
						name="searchArea" placeholder="도시명으로 검색" />
					<button class="Q2">
						<img src="/oaga/images/mainpage/icon_search1.gif" alt="" />
					</button>
				</form>
				<!-- 검색했을 때 나올 결과 -->
				<div id="area_search_div" class="area_autocomplete"
					style="display: block;"></div>
				<!--  -->
				<div class="keyword">
					<div class="city">
						추천 키워드: <a href="#">부산</a> <a href="#">광안리</a>, <a href="#">포항</a>
					</div>
					<!--city-->
				</div>
			</div>
			<!--srch2-->
			<!--keyword-->
		</div>
		<!--srchBox-->
	</div>
	<!--bnWrap-->
</div>
<!--mainBn-->
<!-------------------------sec1시작------------------------------------------------------------------------------------------>
<section class="sec1">
	<div class="secWrap">
		<h3>
			<span>OaGa</span>에서 여행을 시작하세요!
		</h3>

		<div class="con">
			<div class="box">
				<a href="/oaga/travel_info"> <img
					src="images/mainpage/intro01.jpg" alt="" />
				</a>
				<h4>여행지정보</h4>
				<p>
					우리나라의 도시, 관광명소,<br /> 맛집 정보를 확인하세요.
				</p>
			</div>
			<!--box-->
			<div class="box">
				<a href="/oaga/review"> <img src="images/mainpage/intro02.jpg"
					alt="" />
				</a>
				<h4>리뷰보기</h4>
				<p>
					100만 여행자들의 리뷰를 확인하고,<br /> 정보를 공유하세요.
				</p>
			</div>
			<!--box-->
			<div class="box">
				<a href="/oaga/mytraveler"> <img
					src="images/mainpage/intro03.jpg" alt="" />
					<h4>MyTraveler</h4>
					<p>
						나와 취향이 비슷한 회원들을 선택하여<br />작성리뷰를 한 눈에 확인하세요.
					</p>
				</a>

			</div>
			<!--box-->
		</div>
		<!--con-->
	</div>
	<!--secWrap-->
</section>
<!--sec1-->
<br />
<!-------------------------sec2시작------------------------------------------------------------------------------------------>
<section class="sec2">
	<div class="secWrap">
		<h3>인기 여행리뷰</h3>
		<p class="tit">다른 여행자들의 리뷰를 참고해 나만의 여행을 계획해보세요!</p>

		<div class="row1">
			<c:forEach var="reviews" items="${reviews.content}" begin="0" end="2">
				<div class="box">
					<a href="/oaga/detail/${reviews.id}">
						<div class="ImgBox">
							<img
								src="http://localhost:9090/oaga/upload/${reviews.reviewImageUrl}" />
							<div class="txt">
								<p>${reviews.title}</p>
							</div>
							<!--txt-->
						</div> <!--ImgBox-->

						<div class="data">
							<ul class="info">
								<li class="placeName">${reviews.areaName}</li>
								<li class="withFriend">${reviews.theme}</li>
								<li class="userName">${reviews.user.userNickName}</li>
							</ul>
							<!--info-->

							<ul class="count">
								<li class="view">${reviews.count}</li>
							</ul>
							<!--view-->
						</div> <!--data-->
					</a>
				</div>
				<!--box-->
			</c:forEach>
		</div>
		<!--row1-->

		<div class="row2">
			<c:forEach var="reviews" items="${reviews.content}" begin="3" end="6">
				<div class="box">
					<a href="/oaga/detail/${reviews.id}">
						<div class="ImgBox">
							<img
								src="http://localhost:9090/oaga/upload/${reviews.reviewImageUrl}" />
							<div class="txt">
								<p>${reviews.title}</p>
							</div>
							<!--txt-->
						</div> <!--ImgBox-->

						<div class="data">
							<ul class="info">
								<li class="placeName">${reviews.areaName}</li>
								<li class="withFriend">${reviews.theme}</li>
								<li class="userName">${reviews.user.userNickName}</li>
							</ul>
							<!--info-->

							<ul class="count">
								<li class="view">${reviews.count}</li>
							</ul>
							<!--view-->
						</div> <!--data-->
					</a>
				</div>
				<!--box-->
			</c:forEach>
		</div>
		<!--row2-->

		<a href="/oaga/list"><div class="more">여행리뷰 모두보기</div></a>
	</div>
	<!--secWrap-->
</section>
<!--sec2-->
<!------------------------------sec3시작--------------------------------------------------------------------------------------------->
<section class="sec3">
	<div class="secWrap">
		<h4>여름 휴양지 어디로 갈까?</h4>
		<br />
		<div class="row1">
			<div class="box big">
				<a href="/oaga/travel_hotplace/9">
					<div class="tipImg">
						<img src="images/mainpage/tip01.jpg" alt="" />
						<div class="spot_cnt">5</div>
					</div> <!--tipImg-->

					<div class="txt">
						<h5>제주도 애월</h5>
						<p>어디를 가서 무엇을 봐야할지 도저히 감이 잡히지 않는다면, 필수 스팟을 중심으로 둘러보자.</p>
					</div>
				</a>
				<!--txt-->
			</div>
			<!--box-->

			<div class="box">
				<a href="/oaga/travel_hotplace/4">
				<div class="tipImg">
					<img src="images/mainpage/tip02.jpg" alt="" />
					<div class="spot_cnt">7</div>
				</div>
				<!--tipImg-->
				<div class="txt">
					<h5>부산 해운대</h5>
					<p>짧은 주말, 당일치기로 부산 숨겨진 핫플레이스를 여행하자!</p>
				</div>
				</a>
				<!--txt-->
			</div>
			<!--box-->
			<div class="box">
			<a href="/oaga/travel_hotplace/27">
				<div class="tipImg">
					<img src="images/mainpage/tip03.jpg" alt="" />
				</div>
				<!--tipImg-->
				<div class="txt">
					<h5>경북 포항</h5>
					<p>포항하면 가장 먼저 생각날 곳들. 포항에서 이곳을 가지 않고 ...</p>
				</div>
				<!--txt-->
				</a>
			</div>
			
			<!--box-->
		</div>
		<!--row1-->

		<div class="row2">
			<div class="box">
			
				<a href="/oaga/travel_hotplace/8">
				<div class="tipImg">
					<img src="/oaga/images/mainpage/서귀포.jpg" alt="" />
					<div class="spot_cnt">5</div>
				</div>
				<!--tipImg-->
				<div class="txt">
					<h5>제주도 서귀포</h5>
					<p>서귀포의 핫플레이스에서 화려한 밤을 보내보세요 제대로 즐길 수...</p>
				</div>
				<!--txt-->
				</a>
			</div>
			<!--box-->

			<div class="box">
			<a href="/oaga/travel_hotplace/5">
				<div class="tipImg">
					<img src="/oaga/images/mainpage/광안리.jpg" alt="" />
					<div class="spot_cnt">5</div>
				</div>
				<!--tipImg-->
				<div class="txt">
					<h5>부산 광안리</h5>
					<p>가도가도 아직도 못가본 곳이 많은 부산. 한 두개가 아닌 여러 개의 얼굴을...</p>
				</div>
				</a>
				<!--txt-->
			</div>
			<!--box-->

			<div class="box big">
			<a href="/oaga/travel_hotplace/28">
				<div class="tipImg">
					<img src="/oaga/images/mainpage/경주.jpg" alt="" />
					<div class="spot_cnt">5</div>
				</div>
				<!--tipImg-->
				<div class="txt">
					<h5>경북 경주</h5>
					<p>볼거리로 가득한 경주, 어디부터 갈까?</p>
				</div>
				</a>
				<!--txt-->
			</div>
			<!--box-->
		</div>
		<!--row2-->
		
		<div class="more"><a href="/oaga/travel_info">여행지 모두보기</a></div>
	</div>
	<!--secWrap-->
</section>
<!--sec3-->

<!----------------------------------sec4---------------------------------------------------------------------------------------->

<section class="sec4">
	<div class="secWrap">
		<h4>인기여행지 TOP 10</h4>
		<!---------------------------------row1------------------------------------------->
		<div class="row1">
			<div class="box box1">
				<a href="/oaga/travel/areainfo/2">
					<div class="cityName">부산</div>
				</a>
			</div>
			<!--box-->
			<div class="box box2">
				<a href="/oaga/travel/areainfo/5">
					<div class="cityName">인천</div>
				</a>
			</div>
			<!--box-->
			<div class="box box3">
				<a href="/oaga/travel/areainfo/14">
					<div class="cityName">경북</div>
				</a>
			</div>
			<!--box-->
		</div>
		<!--row1-->
		<!---------------------------------row2------------------------------------------->
		<div class="row2">
			<div class="col col1">
				<div class="box box1_1">
					<a href="/oaga/travel/areainfo/1">
						<div class="cityName">서울</div>
					</a>
				</div>
				<!--box-->
				<div class="box box1_2">
					<a href="/oaga/travel/areainfo/4">
						<div class="cityName">제주도</div>
					</a>
				</div>
				<!--box-->
			</div>
			<!--col-->
			<div class="col col2">
				<div class="box box2_1">
					<a href="/oaga/travel_hotplace/9">
						<div class="cityName">제주도 애월</div>
					</a>
				</div>
				<!--box-->
				<div class="box box2_2">
					<a href="/oaga/travel_hotplace/2">
						<div class="cityName">서울 마포구</div>
					</a>
				</div>
				<!--box-->
			</div>
			<!--col-->
			<div class="col col3">
				<div class="box box3_1">
					<a href="/oaga/travel_hotplace/1">
						<div class="cityName">서울 강남구</div>
					</a>
				</div>
				<!--box-->
				<div class="box box3_2">
					<a href="/oaga/travel_hotplace/34">
						<div class="cityName">여수</div>
					</a>
				</div>
				<!--box-->
			</div>
			<!--col-->
			<div class="col col4">
				<div class="box high">
					<a href="/oaga/travel_hotplace/28">
						<div class="cityName">경주</div>
					</a>
				</div>
				<!--box-->
			</div>
			<!--col-->
		</div>
		<!--row2-->
	</div>
	<!--secWrap-->
</section>
<!--sec4-->

<script src="/oaga/js/index.js"></script>

<%@ include file="layout/footer.jsp"%>

