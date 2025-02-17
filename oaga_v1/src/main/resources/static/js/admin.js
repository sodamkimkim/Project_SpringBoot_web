let token = $("meta[name='_csrf']").attr("content");
let tokenName = $("meta[name='_csrf']").attr("name");
let header = $("meta[name='_csrf_header']").attr("content");

let index = {
	init: function() {
		$(".adD_listItem_btn").click(function() {
			var str = "";
			var tdArr = new Array();
			var adD_listItem_btn = $(this);

			var tr = adD_listItem_btn.parent().parent();
			var td = tr.children();
			console.log(td.eq(0).text()); // 레스토랑 이름
			console.log(td.eq(1).text()); // 레스토랑 주소
			let id = td.eq(1).children().val();
			console.log(id);
			$.ajax({
				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token)
				},

				type: "delete",
				url: "/oaga/admin/deleterestaurant/" + id,
			}).done(function(data) {
				if (data.status) {
					alert("삭제가 완료되었습니다.");
					location.href = "/oaga/admin/restaurantDeletepage/";
				}
			}).fail(function(error) {
				alert(" 삭제에 실패하였습니다.")

			});
		});

	},
}
index.init();

function deletePlay(hotplaceId) {
	var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
	if (deleteConfirm) {
		$.ajax({
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token)
			},
			type: "DELETE",
			url: `/oaga/api/admin/deletePlay/${hotplaceId}`,
		}).done(function() {
			updateDeletePlay(hotplaceId);
		}).fail(function() {
			alert("삭제 실패");
		});
	}

}

function updateDeletePlay(id) {
	/*	$("#play-delete-btn-" + id).text("삭제완료");
		$("#play-delete-btn-" + id).css("color", "red");
		$("#play-delete-btn-" + id).css("pointer-events", "none");*/
	$(".tr-" + id).remove();

}

function selectrestaurantList(selectedId) { // area 선택 시

	let data = selectedId;
	console.log(data.data);


	$.ajax({

		type: "GET",
		url: `/oaga/api/admin/areaId/${data}`
	}).done(function(response) {
		addSelectedGuList3(response);
	}).fail(function(error) {

	});

}

function addSelectedGuList3(response) {//구칸에 구이름 뿌리기
	$('#areaGu').empty();

	var test = response.data;

	var a = test.length;

	var test = response.data;
	console.log(test + " test");
	var a = test.length;

	var select = new Array();

	for (let i = 0; i <= a - 1; i++) {
		select[i] = `
					 <div  style=" width: 100%; ">
						<c:forEach var="areaGuList" items="${test}" id ="areaGuList">


								<div class ="areaGuList" style="width: 100%; height: 35px; cursor: pointer;" id ="getAreaGuList"
								onclick ="areaGuClick3(${test[i].id})">${test[i].guname}</div>

						</c:forEach>				
					</div>`;


	}
	$('#areaGu').append(select);
}
function areaGuClick3(id) {



	$.ajax({
		type: "GET",
		url: `/oaga/api/admin/restaurantUpdate/${id}`
	}).done(function(response) {
		addSelectedRestaurant(response);
		console.log(response.data);
	}).fail(function(error) {

	});

}
function addSelectedRestaurant(response) { //hotplace_info 리스트 뿌리기 

	$('#restaurantList').empty();

	var restaurantName = response.data;
	var a = restaurantName.length;
	if (a != 0) {
		var restaurantNameList = new Array();
		for (let i = 0; i < a; i++) {
			restaurantNameList[i] = `<div style="width: 100%; height: 30px;border: 1px solid; margin-bottom:5px; cursor: pointer;"
								onclick ="restaurantclick(${restaurantName[i].id})">
									${restaurantName[i].name}
								</div>`
		}


		$('#restaurantList').append(restaurantNameList);
	} else if (a == 0) {
		var error = `<div>데이터가 없습니다.</div>`
		$('#restaurantList').append(error);
	}






}

function restaurantclick(updateId) { // hotplace 리스트 클릭했을때 어펜듬

	let data = updateId;
	console.log(data);
	$.ajax({
		type: "GET",
		url: `/oaga/api/admin/restaurant_info/${data}`
	}).done(function(response) {
		console.log(response + "dsa,[pdasm,p]");

		setRestaurantData(response);
	}).fail(function() {

	})
}


function setRestaurantData(estaurantData) {


	$('#restaurantList').empty();

	let setData = estaurantData.data;

	var restaurantDataApend = `<br/>
						<br/>
						<div>
						<form action="/oaga/api/admin/restaurant/update/${setData[0].id}"  method="post" enctype="multipart/form-data" >						
						<input type="hidden" name ="${tokenName}" value = "${token}">	
							
						<input type="hidden" id = "areaGuId" name = "areaGuId" value="${setData[0].areaGuId}"> 
						<input type="hidden" id = "categoryType" name = "categoryType" value="${setData[0].categoryType}"> 
						<label >이름 :</label>
						<input style="margin-bottom: 20px; height: 35px;" name = "name"id = "setname" value = ${setData[0].name}>
						<br/>
						<br/>
						<label>주소 :</label>
						<input style="margin-bottom: 20px; height: 35px;"name = "address" id = "setaddress" value = ${setData[0].address}>
						<br/>
						<br/>
						<label>내용 :</label>
						<textarea style="width: 300px; height: 250px;"name = "content" id = "content" resize: none;>${setData[0].content}</textarea>
						
						<br/>
						<br/>
						
						<input class="upload_name" id="r_imageUrl" readonly="readonly" name = "originImageUrl"
						type = "hidden" value="${setData[0].originImageUrl}">
						
						<input type="file"class="r_image_input" id="image" name="file" accept="image/*"
						required="required"
						onchange="javascript:document.getElementById('r_imageUrl').value = this.value">

						<div>
							<button class="btn btn-primary" id="btn-update" type="submit"
							style="width: 100px; height: 30px; float: right; margin-top: 30px; margin-right: 15px;">수정</button>
							
							<a type="button" class="btn btn-primary" onclick="addSelectedGuInfo(${setData[0].areaGu.id})";
							style="width: 100px; height: 30px; float: right; margin-top: 30px; margin-right: 15px;">뒤로가기</a>
						</div>
						</form>
						</div>
						`

	$('#restaurantList').append(restaurantDataApend);
}







// end of update




// =====================================end restaurant update

// =====================================hotplace update
function selectList2(selectedId) { // area 선택 시

	let data = selectedId;

	$.ajax({
		type: "GET",
		url: `/oaga/api/admin/areaId/${data}`
	}).done(function(response) {
		addSelectedGuList2(response);
	}).fail(function(error) {

	});

}

function addSelectedGuList2(response) {//구칸에 구이름 뿌리기
	$('#areaGu').empty();

	var test = response.data;

	var a = test.length;

	var test = response.data;
	var a = test.length;

	var select = new Array();

	for (let i = 0; i <= a - 1; i++) {
		select[i] = `
					 <div>
						<c:forEach var="areaGuList" items="${test}" id ="areaGuList">


								<div class ="areaGuList"id ="getAreaGuList"
								onclick ="areaGuClick2(${test[i].id})">${test[i].guname}</div>

						</c:forEach>				
					</div>`;


	}
	$('#areaGu').append(select);
}
function areaGuClick2(id) {


	$.ajax({
		type: "GET",
		url: `/oaga/api/admin/hotplace_update/${id}`
	}).done(function(response) {
		addSelectedHotplace(response);

	}).fail(function(error) {

	});

}
function addSelectedHotplace(response) { //hotplace 리스트 뿌리기 

	$('#hotplaceList').empty();

	var hotplaceName = response.data;
	var a = hotplaceName.length;
	if (a != 0) {
		var hotplaceNameList = new Array();
		for (let i = 0; i < a; i++) {
			hotplaceNameList[i] = `<c:forEach var="hotplaceList" items="${hotplaceName}">
								<div style="width: 100%; height: 33px;  border-bottom: 2px solid #333;cursor: pointer;"
								onclick ="hotplaceclick(${hotplaceName[i].id})">
									${hotplaceName[i].name}
								</div>
							</c:forEach>`
		}


		$('#hotplaceList').append(hotplaceNameList);
	} else if (a == 0) {
		var error = `<div>데이터가 없습니다.</div>`
		$('#hotplaceList').append(error);
	}






}

function hotplaceclick(updateId) { // hotplace 리스트 클릭했을때 어펜듬

	let data = updateId;
	console.log(data);

	$.ajax({

		type: "GET",
		url: `/oaga/api/admin/hotplace_info/${data}`
	}).done(function(response) {
		console.log(response);
		setGuinfoData(response);
	}).fail(function() {

	})
}


function setGuinfoData(hotplaceData) {
	$('#hotplaceList').empty();

	let setData = hotplaceData.data;




	var hotplaceDataApend = `<br/>
						<br/>
						<div style = "width : 100%; height: 100%; background-color:white; border-bottom:2px solid #333;">
						<form action="/oaga/api/admin/hotplace/update/${setData[0].id}"  method="post" enctype="multipart/form-data" >						
						<input type="hidden" name ="${tokenName}" value = "${token}">
						
						<input type="hidden" id = "areaGuId" name = "areaGuId" value="${setData[0].areaGuId}"> 
						<input type="hidden" id = "categoryType" name = "categoryType" value="${setData[0].categoryType}"> 
						<label >이름 :</label>
						<input style=" height: 35px;" name = "name" id = "name" value = ${setData[0].name}>
						<br/>
						<br/>
						<label>주소 :</label>
						<input style=" height: 35px;"name = "address" id = "address" value = ${setData[0].address}>
						<br/>
						<br/>
						<label>내용 :</label>
						<textarea style="width: 300px; height: 250px;"name = "content" id = "content" resize: none;>${setData[0].content}</textarea>
						
						<br/>
						<br/>
						
						<input class="upload_name" id="r_imageUrl" readonly="readonly" name = "originImageUrl"
						type = "hidden" value="${setData[0].originImageUrl}">
						
						<input type="file"class="r_image_input" id="image" name="file" accept="image/*"
						required="required"
						onchange="javascript:document.getElementById('r_imageUrl').value = this.value">

						<div>
							<button class="btn btn-primary" id="btn-update" type="submit"
							style="width: 100px; height: 30px; float: right; margin-top: 30px; margin-right: 15px;">수정</button>
							
							<a type="button" class="btn btn-primary" onclick="addSelectedGuInfo(${setData[0].areaGu.id})";
							style="width: 100px; height: 30px; float: right; margin-top: 30px; margin-right: 15px;">뒤로가기</a>
						</div>
						</form>
						</div>
						`
	
	$('#hotplaceList').append(hotplaceDataApend);

}




// =====================================end update


// ==============================================
function selectList(selectedId) { // area 선택 시

	let data = selectedId;

	$.ajax({
		type: "GET",
		url: `/oaga/api/admin/areaId/${data}`
	}).done(function(response) {
		addSelectedGuList(response);
	}).fail(function(error) {

	});


}





function addSelectedGuName(response) {
	$('#areaGuName').empty();
	var setName = response.data;
	console.log(setName[0].guname + "@@#!#!#!#!");
	var guName = `<h3 style="font-size: 40px;">${setName.guname}</h3>`;
	$('#areaGuName').append(guName);

}

function addSelectedGuList(response) {//구칸에 구이름 뿌리기
	$('#areaGu').empty();

	var test = response.data;

	var a = test.length;

	var test = response.data;
	console.log(test);
	var a = test.length;

	var select = new Array();

	for (let i = 0; i <= a - 1; i++) {
		select[i] = `
					 <div  class="li_item">
						<c:forEach var="areaGuList" items="${test}" id ="areaGuList">


								<div class ="areaGuList" style="width: 100%; height: 35px; cursor: pointer;" id ="getAreaGuList"
								onclick ="areaGuClick(${test[i].id})">${test[i].guname}</div>

						</c:forEach>				
					</div>`;


	}
	$('#areaGu').append(select);
}


// ====================================
function areaGuClick(id) { // 추가칸에 추가 할 항목에 어느 areaGu인지 보여주는 녀석

	$.ajax({
		type: "GET",
		url: `/oaga/api/admin/areaIdGu/${id}`
	}).done(function(response) {
		addSelectedGuName(response);

	}).fail(function(error) {

	});

}


function addSelectedGuName(response) {

	$('#areaGuName').empty();	
	var setName = response.data;

	var guName1 = `<input type ="hidden" value ="${setName[0].id}"  id = "areaGuId" name ="areaGuId">
					<h3 style="margin-bottom: 10px; font-size: 40px;">${setName[0].guname}</h3>`;
	$('#areaGuName').append(guName1);
}


function xSSCheck(str, level) {
	if (level == undefined || level == 0) {
		str = str.replace(/\<|\>|\"|\'|\%|\;|\(|\)|\&|\+|\-/g, "");
	} else if (level != undefined && level == 1) {
		str = str.replace(/\</g, "&lt;");
		str = str.replace(/\>/g, "&gt;");
	}
	return str;
}