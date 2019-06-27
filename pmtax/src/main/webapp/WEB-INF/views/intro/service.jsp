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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
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
    min-height: 960px;
	
}
#hj-sub-container {
	float: left;
	margin-right: 1%;
	padding-right: 5%;
	height: 500px;
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
		<div class="sub-container" id="hj-sub-container" style="float: left;">
			<h3>사무소 소개</h3>
			<ul style="border-top: 3px solid black;">
				<li style="margin-top: 10px;"><a href="intro.do"> 인사말</a></li>
				<li><a href="service.do"> - 업무소개</a></li>
				<li><a href="contact.do">오시는길/연락처</a></li>
			</ul>
		</div>


		<div class="container" id="hj-intro-con">
			<div class="row" style="margin-top: 5%;     text-align: center" >
			<h2 class="mb-4 tm-section-title">업무소개</h2>
					<div class="mb-5 tm-underline" style="background: #8f8f8f">
						<div class="tm-underline-inner" style="background: #8f8f8f"></div>
					</div>
				<div class="col-lg-4">
					<i class="fas fa-4x fa-bus text-center tm-icon"></i>
					<h4 class="text-center tm-text-primary mb-4">기장대리 </h4>
					<p>기장은 각종 재무보고의기초가 될뿐 아니라 소득세와 법인세 및 부가가치세 
신고의 근거가 됩니다.</p>
				</div>

				<div class="col-lg-4 mt-5 mt-lg-0">
					<i class="fas fa-4x fa-bicycle text-center tm-icon"></i>
					<h4 class="text-center tm-text-primary mb-4">세무조정</h4>
					<p>세무조정을 세무사가 직접 참가함으로써 잘못된 세무조정으로 인한세금 및 
인력낭비를 원천적으로 봉쇄하고 있습니다.</p>
				</div>
				<div class="col-lg-4 mt-5 mt-lg-0">
					<i class="fas fa-4x fa-city text-center tm-icon"></i>
					<h4 class="text-center tm-text-primary mb-4">벤처기업</h4>
					<p>벤처기업육성에 관한 특별조치법에 따라 각종의 혜택을 받기 위한 벤처기업 
확인서비스를 제공합니다.</p>
				</div>
			</div>
			<!-- row -->
		</div>


	</div>
	<!-- container -->
	<c:import url="../common/footer.jsp" />
</body>
</html>