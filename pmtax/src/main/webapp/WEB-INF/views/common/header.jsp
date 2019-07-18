<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
#js_pheader_body {
	font-family: a고딕11;
}

#js_pheader_tab1 a {
	margin-top: 2.5px;
	color: #343a40;
	font-family: a고딕15;
	font-size: 16px;
}

#js_pheader_tab2 a {
	margin-top: 2.5px;
	color: #343a40;
	font-family: a고딕15;
	font-size: 16px;
}

#js_pheader_tab1 a:hover {
	color: #4cb5b4;
}

#js_pheader_tab2 a:hover {
	color: #ff9198;
}

#js_pheader_logo a {
	margin-left: 10px;
	margin-right: 0px;
	color: #ffb6b9;
	font-family: a고딕18;
	font-size: 24px;
}

#js_pheader_logo span {
	color: #343a40;
}

@media ( max-width : 993px) {
p.indent { padding-left: 0em }
p.indent2 { padding-left: 0em }
}


@media ( min-width : 992px) {
	.navbar-expand-lg .navbar-nav .dropdown-menu {
		position: absolute;
		top: 65px;
	}
	p.indent { padding-left: 5.3em }
	p.indent2 { padding-left: 3.5em }
}

#js_pheader_dropdown a {
	padding-top: 12px;
	padding-bottom: 12px;
}

#navbarSupportedContent a {
	color: #6c757d;
}

.navBtn {
    display: inline-block;
    font-weight: 400;
    color: #212529;
    text-align: center;
    vertical-align: middle;  
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .25rem;
}

.navBtn:link {
	color: #000000;
	text-decoration: none;
}

.navBtn:hover {
	cursor: pointer;
}
</style>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light"
		style="min-height: 100px; border-bottom: 1px solid lightgray;background-color:#fff;">
		<div class="row">
		    <p class="indent"></p>
			<a href="main.do">
			<div class="col" id="js_pheader_logo">
			<img src="${pageContext.request.contextPath}/files/main/mainlogo.png" style="width:330px;height:50px;">
			</div>
			</a>		
		</div>	
        <button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<hr class="clearfix w-100 d-md-none">
			<ul class="navbar-nav mr-auto"
				style="margin: 0 auto; margin-right: 0 !important;">
				<li class="nav-item"><div class="dropdown">				 
				<a class="navBtn" id="dropdownMenuButton" data-toggle="dropdown">
					회사소개 
				</a>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					 <a class="dropdown-item" href="intro.do">인사말</a>
					 <a class="dropdown-item" href="service.do">업무소개</a>
					 <a class="dropdown-item" href="introduceMember.do">구성원소개</a>
					  <a class="dropdown-item" href="contact.do">오시는길</a>
				</div>
		</div></li> <p class="indent2"></p>
				<li class="nav-item"><div class="dropdown">				 
				<a class="navBtn" id="dropdownMenuButton" data-toggle="dropdown">
					세무자료실 
				</a>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					 <a class="dropdown-item" href="taxinfoList.do">세무뉴스 & 정보</a>					
				</div>
		</div></li> <p class="indent2"></p>
				<li class="nav-item"><div class="dropdown">				 
				<a class="navBtn" id="dropdownMenuButton" data-toggle="dropdown">
					고객지원
				</a>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					 <a class="dropdown-item" href="inquiry.do">1:1문의</a>					
				</div>
		</div></li> <p class="indent2"></p>
				<c:if test="${empty loginUser }">
				<li class="nav-item">
				<a class="navBtn" href="login.do" style="">
					로그인
				</a>
				</li>
				</c:if>
				<c:if test="${!empty loginUser }">
				<li class="nav-item"><div class="dropdown">
				<a class="navBtn" href="logout.do"  data-toggle="dropdown">
				${	loginUser.user_name} 님
				</a>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					 <a class="dropdown-item" href="logout.do">로그아웃</a>					
				</div>
				</div>
				</li>
				</c:if>
			</ul>
			 <p class="indent"></p>
		</div>		
	</nav>
</body>
</html>