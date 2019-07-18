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
		<script type="text/javascript">
function fileCheck() {
	var fileExt = document.getElementById('hj_file').value;
	console.log(fileExt);
	fileExt = fileExt.slice(fileExt.indexOf(".") + 1).toLowerCase();
	
	if(fileExt != "jpg" && fileExt != "png" && fileExt != "") {
		alert('jpg 파일과 png 파일만 등록 가능합니다');
		return false;
	}
}
</script>


<style type="text/css">
.jumbotron {
	background-image:
		url('${pageContext.request.contextPath}/resources/images/2.jpg');
	background-size: cover;
}

#hj-intro-con {
	height:980px;
	width:auto;
}

form{
	width:100%;
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
		<div class="sub-container" id="hj-sub-container" style="float: left;">
			<h3>사무소 소개</h3>
			<ul style="border-top: 3px solid black;">
				<li style="margin-top: 10px;"><a href="intro.do"> - 인사말</a></li>
				<li><a href="service.do">업무소개</a></li>
				<li><a href="contact.do">오시는길/연락처</a></li>
			</ul>
		</div>
	</div>


		<div class="container" id="hj-intro-con">
			<div class="row" style="margin-top: 5%;">
			<form name="upLoad" action="updateintro.do" method="post" enctype="multipart/form-data" onsubmit="return fileCheck();">
			<!-- <input type="hidden" name="ofile" value=""> -->
			<div class="form-group row">
				<label for="title" class="col-sm-2 col-form-label">제목</label>
				<div class="col-sm-10">
					<input name="intro_title" type="text" value=${intro.intro_title } style="width:100%">
				</div>
			</div>		
			<div class="form-group row">
				<label for="contents" class="col-sm-2 col-form-label">내용</label>
				<div class="col-sm-10">
					<pre>
					<textarea class="form-control" name="contents" rows="15" onkeydown="if(event.keyCode===9){var v=this.value,s=this.selectionStart,e=this.selectionEnd;this.value=v.substring(0, s)+'\t'+v.substring(e);this.selectionStart=this.selectionEnd=s+1;return false;}">${intro.contents}</textarea>
					</pre>
				</div>
			</div>
			<div class="form-group row">
				<label for="intro_imgs" class="col-sm-2 col-form-label"  id="files">이미지변경</label> 
				<div class="col-sm-10" >
					<input type="file" id="hj_file" name="intro_imgs" value="파일" >
				</div>
			</div>	
		
			<div class="form-group row">
				<div class="col-sm-10"></div>
				<div class="col-sm-2" align="right">
					<button type="submit" class="btn btn-secondary btn-sm">수정</button>
					<button type="button" class="btn btn-secondary btn-sm" >목록</button>
				</div>
			</div>
		
		</form>
		

		</div>
	</div>
	<!-- container -->
	<c:import url="../common/footer.jsp" />
</body>
</html>