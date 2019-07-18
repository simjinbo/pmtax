<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/files/main/logo.png">	
<title>가감세무법인</title>
<style type="text/css">

.link a:link {
	color: #888888;
	text-decoration: none;
	cursor: pointer;
}

.link a:visited {
	color: #888888;
	text-decoration: none;
}

.link a:active {
	color: #888888;
	text-decoration: none;
}

.link a:hover {
	color: #888888;
	text-decoration: none;
}

.mainimage{
width:90%;
height:520px;
}

.news{
width:90%;border:solid 1px #e6e5de;background-color:#fafafa;
}

.link {
width:94%;
}

.linkdiv {
width: 85%;
height:150px;
background-color:#fafafa;
}

.linkdiv2 {
width:96%;
height:150px;
background-color:#fafafa;
}


@media screen and ( max-width : 993px) {

.mainimage{
width:100%;
}

.news{
width:100%;border:solid 1px #e6e5de;background-color:#fafafa;
}

.link {
width:100%;
}

.linkdiv {
margin-top:10px;
width: 100%;
height:150px;
background-color:#fafafa;
}

.linkdiv2 {
margin-top:20px;
width: 100%;
height:150px;
background-color:#fafafa;
}

} 

</style>
</head>
<body>
<c:import url="header.jsp" />
<script type="text/javascript">

</script>
<div class="container-fluid" align="center">
	<div class="row">
		<div class="col-md-12 mb-4">
		<img class="mainimage" src="${pageContext.request.contextPath }/files/main/main1.jpeg">
		</div>
	</div>
	<div class="row news">
	    <div class="col-md-3 mt-4" style="height:60px;background-color:#fafafa;">
	    	<h4>세무 뉴스 & 정보</h4>
	    </div>
		<div class="col-md-9 mt-4" style="height:60px;background-color:#fafafa;">
		<div class="carousel slide" id="carousel-682031">
				
				<div class="carousel-inner">
					<div class="carousel-item active">
							<h4>
								1번째 글
							</h4>							
					</div>
					<div class="carousel-item">
							<h4>
								2번째 글
							</h4>							
					</div>
					<div class="carousel-item">
						    <h4>
								3번째 글
							</h4>							
					</div>
					<div class="carousel-item">
						    <h4>
								4번째 글
							</h4>							
					</div>
					<div class="carousel-item">
						    <h4>
								5번째 글
							</h4>							
					</div>
					<div class="carousel-item">
						    <h4>
								6번째 글
							</h4>							
					</div>
					<div class="carousel-item">
						    <h4>
								7번째 글
							</h4>							
					</div>
					<div class="carousel-item">
						    <h4>
								8번째 글
							</h4>							
					</div>
						<div class="carousel-item">
						    <h4>
								9번째 글
							</h4>							
					</div>
						<div class="carousel-item">
						    <h4>
								10번째 글
							</h4>							
					</div>
				</div> 
				<a class="carousel-control-prev" href="#carousel-682031" data-slide="prev"><span style="font-size:25px;color:black;">◀</span><span class="sr-only">Previous</span></a> 
				<a class="carousel-control-next" href="#carousel-682031" data-slide="next"><span style="font-size:25px;color:black;">▶</span><span class="sr-only">Next</span></a>
			</div>  
		</div>
	</div>		
		<div class="row mt-3 mb-3 link">
			<div class="col col-md-2">
			   <a href="intro.do">
			   <div class="linkdiv">			
			    <i class="far fa-address-card" style="font-size: 70px;margin-top:12px;"></i><br><br>
			    	<span style="font-size: 20px;">인사말</span>			   
			   </div>
			   </a>
			</div>
			<div class="col col-md-2">
			 <a href="service.do">
			  <div class="linkdiv">				
				<i class="far fa-file-alt" style="font-size: 70px;margin-top:12px;"></i><br><br>
				<span style="font-size: 20px;">업무소개</span>
			  </div>
			  </a>
			</div>
			<div class="col col-md-2">
			 <a href="contact.do">
			  <div class="linkdiv">				
				<i class="fas fa-map-marker-alt" style="font-size: 70px;margin-top:12px;"></i><br><br>
				<span style="font-size: 20px;">오시는길</span>
			  </div>
			  </a>
			</div>
			<div class="col-md-6">
			 <a href="inquiry.do">
			 <div class="linkdiv2">
				<h3>무엇이든 물어보세요</h3>
			 </div>
			 <a>
			</div>
		</div>

	</div>
<c:import url="footer.jsp" />
</body>
</html>