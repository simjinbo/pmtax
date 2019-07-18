<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>introduction</title>
<link rel="stylesheet" href="resources/css/templatemo-style.css" />
<link rel="stylesheet" href="resources/slick/slick.css">
<link rel="stylesheet" href="resources/slick/slick-theme.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
.jumbotron {
	background-image:
		url('${pageContext.request.contextPath}/resources/images/2.jpg');
	background-size: cover;
}

#hj-intro-con {
	min-height: 980px;
	height: auto;
}


#hj-sub-container {
	    padding-right: 50px;
    min-width: 220px;
    height: auto;
}

.col-md-3 {
	margin-top:3%;
}

li {
	list-style: none;
	padding: 5px 0px 5px 5px;
	margin-bottom: 5px;
	border-bottom: 1px solid #efefef;
}

ul {
	padding: 0;
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp" />

	<div class="container-fluid">
		<div class="jumbotron text-center">
			<h1>ABOUT</h1>
		</div>
	</div>
	<div class="container">
	<div class="row">
		<div class="col-md-3">
			<div  id="hj-sub-container">
			<h3>사무소 소개</h3>
			<ul style="border-top: 3px solid black;">
				<li style="margin-top: 10px;"><a href="intro.do"> 인사말</a></li>
				<li><a href="service.do"> 업무소개</a></li>
				<li><a href="contact.do"> - 오시는길/연락처</a></li>
			</ul>
		</div>
</div>

		<div class="col-md-9" id="hj-intro-con">
			<div class="row" style="margin-top: 5%;">
				<div class="col-12" style="padding-left: 0;">
					<h2 class="mb-4 tm-section-title">오시는길 / 연락처</h2>
					<div class="mb-5 tm-underline" style="background: #8f8f8f">
						<div class="tm-underline-inner" style="background: #8f8f8f"></div>
					</div>
					<p class="mb-5">- ${intro.address } </p>
				</div>

				<div
					class="col-sm-12 col-md-6 d-flex align-items-center tm-contact-item">
					<a href="tel:${intro.phone }"> <i class="fas fa-3x fa-phone mr-4"></i>
						<span class="mb-0">${intro.phone }</span>
					</a>
				</div>
				<div
					class="col-sm-12 col-md-6 d-flex align-items-center tm-contact-item">
					<a href="mailto:${intro.email }"> <i
						class="fas fa-3x fa-envelope mr-4"></i> <span class="mb-0">${intro.email }</span>
					</a>
				</div>
				<div id="map" style="width: 100%; height: 350px;"></div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55d7db7b289215b9986b37fed37910b7&libraries=services"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption);

					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();

					// 주소로 좌표를 검색합니다
					geocoder
							.addressSearch(
									'${intro.address}',
									function(result, status) {

										// 정상적으로 검색이 완료됐으면 
										if (status === kakao.maps.services.Status.OK) {

											var coords = new kakao.maps.LatLng(
													result[0].y, result[0].x);

											// 결과값으로 받은 위치를 마커로 표시합니다
											var marker = new kakao.maps.Marker(
													{
														map : map,
														position : coords
													});

											// 인포윈도우로 장소에 대한 설명을 표시합니다
											var infowindow = new kakao.maps.InfoWindow(
													{
														content : '<div style="width:150px;text-align:center;padding:6px 0;">가감세무법인</div>'
													});
											infowindow.open(map, marker);

											// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
											map.setCenter(coords);
										}
									});
				</script>
			</div>
			<!-- row  -->


		</div>

		</div>
	</div><!-- container -->
	<c:import url="../common/footer.jsp" />
</html>