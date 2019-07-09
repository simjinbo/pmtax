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
				<li style="margin-top: 10px;"><a href="intro.do"> - 인사말</a></li>
				<li><a href="service.do">업무소개</a></li>
				<li><a href="contact.do">오시는길/연락처</a></li>
			</ul>
		</div>


		<div class="container" id="hj-intro-con">
			<div class="row" style="margin-top: 5%;">
				<h2 class="mb-4 tm-section-title">인사말</h2>
				<div class="mb-5 tm-underline" style="background: #8f8f8f">
					<div class="tm-underline-inner" style="background: #8f8f8f"></div>
				</div>
				<div class="col-lg-6">
					<img
						src="${pageContext.request.contextPath}/resources/images/1.jpg"
						alt="Image" class="img-fluid tm-intro-img" />
				</div>
				<div class="col-lg-6">
					<div class="tm-intro-text-container">
						<h2 class="tm-text-primary mb-4 tm-section-title">${intro.intro_title }</h2>
						<p class="mb-4 tm-intro-text">
							${intro.contents }
							
					
						</p>
					<!-- <p class="mb-5 tm-intro-text">
							<a rel="nofollow" href="#">세정소식, 생활 상식, 생활법률 등 다양한 내용의 경영정보를</a>
							제공하고자 하오니 자세히 읽어보시고 업무에 많은 협조 부탁드립니다. 저는 앞으로도 본 업무에 소임을 다할 생각이오니
							사업에 전념하셔서 금년에도좋은 결과 성취하시기를 빕니다. 지도 편달과 많은 성원 부탁드립니다. 감사합니다.
						</p> -->
						<div class="tm-next">
							<a href="#work" class="tm-intro-text tm-btn-primary">편집</a>
						</div>
					</div>
				</div>
			</div>
			<!-- row -->
		</div>




	</div>
	<!-- container -->
	<c:import url="../common/footer.jsp" />
</body>
</html>