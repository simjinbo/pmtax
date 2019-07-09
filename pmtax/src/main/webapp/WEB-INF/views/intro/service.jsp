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
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$
								.ajax({
									url : "serviceList.do",
									type : "post",
									success : function(data) {
										var values = "<div class='row' style='margin-top: 5%; text-align: center'>"
												+ "<h2 class='mb-4 tm-section-title'>업무소개</h2>"
												+"<div class='mb-5 tm-underline' style='background: #8f8f8f'>"
												+ "<div class='tm-underline-inner' style='background: #8f8f8f'></div></div></div>"
												+ "<button type='button' data-toggle='modal' data-target='#hj_IModal' class='btn btn-primary btn-xs' return false;>업무소개 추가</button>";

										var mvalues = "";
										for ( var i in data) {
											values += "<div class='row' style='margin-top: 5%; text-align: left'>"
													+ "<div class='col-lg-12'>"
													//+"<i class='fas fa-4x fa-bus text-center tm-icon'></i>"
													+ "<h4 class='text-left tm-text-primary mb-4' id='title"+data[i].service_no+"'>"
													+ data[i].service_title
													+ "</h4>"
													+ "<pre id='contents"+data[i].service_no+"'>"
													+ data[i].service_contents
													+ "</pre>"
													+ "<button class='btn btn-default' id='hj_delete_service' onclick='clickDBtn("
													+ data[i].service_no
													+ ")'>삭제</button>"
													+ "<button class='btn btn-default' id='hj_update_service' data-toggle='modal' data-target='#hj_UModal' onclick='clickUBtn("
													+ data[i].service_no
													+ ")'>수정</button>"
													+ "</div></div>";
										} //foreach
										values += "</div>"

										$("#serviceList").html(
												$("#serviceList").html()
														+ values);
									},
									error : function(jqXHR, textstatus,
											errorthrown) {
										console.log("error : " + jqXHR + ", "
												+ textstatus + ", "
												+ errorthrown);
									}
								}); //ajax

					}); //ready
</script>
<style type="text/css">
.btn-xs {
    width: 150px;
    height: 5%;
/*     position:relative;
   	left:58%;
    top: 20px; */
    
}
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

.row {
	margin-left: 500px;
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
				<li style="margin-top: 10px;"><a href="intro.do"> 인사말</a></li>
				<li><a href="service.do"> - 업무소개</a></li>
				<li><a href="contact.do">오시는길/연락처</a></li>
			</ul>
		</div>
	</div>
	<div class="container" id="hj-intro-con">
		<div id="serviceList" style="padding-left: 30%;">


			<script type="text/javascript">
				function clickDBtn(service_no) {

					console.log(service_no);
					location.href = "dservice.do?service_no=" + service_no;
				}

				function clickIBtn() {
					
					document.insertform.action = "${pageContext.request.contextPath}/iservice.do";
					document.insertform.submit();
				} 

				function clickUBtn(service_no) {
					var titleno = 'title';
					titleno += service_no;
					var contentsno = 'contents';
					contentsno += service_no;
					
					
					var title = $('#'+titleno).text();
					var contents = $('#'+ contentsno).text();
					
					$('#hj_service_no_u').val(service_no);
					$('#hj_service_title_u').val(title);
					$('#hj_service_contents_u').val(contents);
					
					$('#hj_update_btn').click(function(){
						document.updateform.action = "${pageContext.request.contextPath}/uservice.do";
						document.updateform.submit();	
					});
				}
			</script>


		</div>

		<div class="row" style="padding-left: 9%; padding-top: 5%;">
			<div class="modal fade" id="hj_IModal" role="dialog">
				<div class="modal-dialog modal-lg">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">업무소개 추가</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" name="insertform" role="form" method="post"
								action="iservice.do">
								<div class="form-group">
									<label for="name" class="col-sm-2 control-label">제목</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="hj_service_title"
											name="service_title" placeholder="제목" value="">
									</div>
								</div>
								<div class="form-group">
									<label for="message" class="col-sm-2 control-label">내용</label>
									<div class="col-sm-10">
										<textarea class="form-control" rows="4" name="service_contents"></textarea>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" onclick="clickIBtn()">작성</button>
							<button type="button" class="btn btn-default"data-dismiss="modal">취소</button>
						</div>
					</div>

				</div>
			</div>
			<!-- 추가있떤자리임 -->
		</div>
		
		
		<div class="row" style="padding-left: 9%; padding-top: 5%;">
			<div class="modal fade" id="hj_UModal" role="dialog">
				<div class="modal-dialog modal-lg">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">업무소개 수정</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" name="updateform" role="form" method="post"
								action="uservice.do">
								<div class="form-group" style="display:none;">
									<input type="number" id="hj_service_no_u" name="service_no" />
								</div>
								<div class="form-group">
									<label for="name" class="col-sm-2 control-label">제목</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="hj_service_title_u"
											name="service_title" placeholder="제목" value="">
									</div>
									
								</div>
								<div class="form-group">
									<label for="message" class="col-sm-2 control-label">내용</label>
									<div class="col-sm-10">
										<textarea class="form-control" rows="4"  id="hj_service_contents_u" name="service_contents"></textarea>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" id="hj_update_btn">수정</button>
							<button type="button" class="btn btn-default"data-dismiss="modal">취소</button>
						</div>
					</div>

				</div>
			</div>
			<!-- 추가있떤자리임 -->
		</div>
		

	</div>
	<!-- container -->
	<c:import url="../common/footer.jsp" />
</body>
</html>