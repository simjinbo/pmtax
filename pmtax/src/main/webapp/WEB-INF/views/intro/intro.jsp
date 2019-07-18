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
pre {
	white-space: pre-wrap;
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
		<div id="hj-sub-container">
			<h3>사무소 소개</h3>
			<ul style="border-top: 3px solid black;">
				<li style="margin-top: 10px;"><a href="intro.do"> - 인사말</a></li>
				<li><a href="service.do">업무소개</a></li>
				<li><a href="contact.do">오시는길/연락처</a></li>
			</ul>
		</div>
		</div>
	<div class="col-md-9" id="hj-intro-con">
			<div class="row" style="margin-top: 5%;">
				<h2 class="mb-4 tm-section-title">인사말</h2>
				<div class="mb-5 tm-underline" style="background: #8f8f8f">
					<div class="tm-underline-inner" style="background: #8f8f8f"></div>
				</div>
				<div class="col-lg-5">
					<img
						src="${pageContext.request.contextPath}/resources/images/${intro.intro_img}"
						alt="Image" class="img-fluid tm-intro-img" />
				</div>
				<div class="col-lg-7">
					<div class="tm-intro-text-container">
						<h2 class="tm-text-primary mb-4 tm-section-title">${intro.intro_title }</h2>
						<pre>
							${intro.contents}
						</pre>
						<div class="tm-next">
							<c:if test="${loginUser.user_id eq 'admin'}">
							<a href="moveupdateintro.do" class="tm-intro-text tm-btn-primary">편집</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>	
		</div>



		 </div><!-- row -->
	</div><!-- continer -->
	<!-- container -->
	<c:import url="../common/footer.jsp" />
</body>
</html>