<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/oaga/css/style.css" />

<br />
<style>
.areagu_img {
	
	width: inherit;
	height: inherit;
}
</style>
<div class = "container">
<input type="hidden" name ="${_csrf.parameterName}" value = "${_csrf.token}">
<div style="width: 100%; display: flex; justify-content: center;">
	<div style="width: 1200px; height: 500px;">
		<c:forEach var="guInfoImage" items="${guInfoImage}">
		${guInfoImage.image}
		</c:forEach>
	</div>
</div>
<br/>
<br/>

<div
	style=" font-size: 25px; font-style: oblique; padding-top: 10px; margin-left: 366px; font-weight: bold;">HOT플레이스</div>

<div class="content-randmark"
	style="display: flex; justify-content: center;">

	<div
		style="width: 1200px; height: 200px; display: flex; justify-content: flex-start; align-items: center;margin-left: 30px; ">
		<div
			style="display: flex; justify-content: center; align-content: center; font-weight: bold; font-size: 20px; ">
			
			
			<c:choose>
				<c:when test="${empty guInfoList}">
					<p style="font-size: 25px; display: flex; align-items: center; margin-left: 50px;">업데이트중 입니다!</p>
				</c:when>
				<c:otherwise>
				<c:forEach var="guInfoList" items="${guInfoList}">
					<a href="/oaga/travel_detail/gu/${guInfoList.id}"
						style="width: auto; height: auto; margin-right: 15px;"> 
						<img alt="" src="http://localhost:9090/oaga/upload/${guInfoList.image}"		
						style="width: 200px; height: 150px; border-radius: 1ex; margin-top: 30px;">
						<h5 style="margin-top: -2px;">${guInfoList.name}</h5>
					</a>
				</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>

</div>
<br/>
<br/>
<div
	style="font-size: 25px; font-style: oblique; padding-top: 10px; margin-left: 366px; font-weight: bold;">맛집/카페</div>
<div class="content-randmark"
	style="display: flex; justify-content: center;">
	
	<div
		style="width: 1200px; height: 200px; display: flex; justify-content: flex-start; align-items: center; margin-left: 30px;">
		<div
			style=" display: flex; justify-content: flex-start; align-items: center;font-weight: bold; font-size: 20px; ">
			<c:choose>
				<c:when test="${empty restaurantList}">
					<p style="font-size: 25px; display: flex; align-items: center; margin-left: 50px;">업데이트중 입니다!</p>
				</c:when>
				<c:otherwise>
					<c:forEach var="restaurantList" items="${restaurantList}">
						<a href="/oaga/travel_detail/${restaurantList.id}"
							style="width: auto; height: auto; margin-right: 15px;"> 
							<img
		
							alt="" src="http://localhost:9090/oaga/upload/${restaurantList.image}"
							style="width: 200px; height: 150px; border-radius: 1ex; margin-top: 30px;">
							<h5 style="margin-top: -2px;">${restaurantList.name}</h5>
						</a>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>
	
</div>


<br />
<br />

</div>
<%@ include file="../layout/footer.jsp"%>


