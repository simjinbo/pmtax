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
	$(document)
			.ready(
					function() {
						$
								.ajax({
									url : "serviceList.do",
									type : "post",
									success : function(data) {
										var values = "<div style='margin-top: 5%; text-align: left'>"
												+"<div style='margin:2%;'>"
												+ "<h2 class='mb-4 tm-section-title' style='float:left' >업무소개</h2>"
												+"<c:if test="${loginUser.user_id eq 'admin' }">"
												+"<button type='button' style='position:absolute; left:70%; margin-top:10px;' data-toggle='modal' data-target='#hj_IModal' class='btn btn-primary btn-xs' return false;>업무소개 추가</button>"
												+"</c:if>"
												+"</div>"
												+"<div class='mb-5 tm-underline' style='background: #8f8f8f; clear:both;' >"
												+ "<div class='tm-underline-inner' style='background: #8f8f8f;'></div></div></div>";
												
												

										var mvalues = "";
										for ( var i in data) {
											values += "<div class='row' style='margin-top: 5%;'>"
													+ "<div class='col-md-12'>"
													+ "<h4 class='text-left tm-text-primary mb-4' id='title"+data[i].service_no+"'>"
													+ data[i].service_title
													+ "</h4>"
													+ "<pre id='contents"+data[i].service_no+"'>"
													+ data[i].service_contents
													+ "</pre>"
													+"<c:if test="${loginUser.user_id eq 'admin' }">"
													+ "<button class='btn btn-default' id='hj_update_service' data-toggle='modal' data-target='#hj_UModal' onclick='clickUBtn("
													+ data[i].service_no
													+ ")'>수정</button>"
													+ "<button class='btn btn-default' id='hj_delete_service' onclick='clickDBtn("
													+ data[i].service_no
													+ ")'>삭제</button>"
													+ "</div></div>"
													+"</c:if>";
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
    
}
.jumbotron {
	background-image:
		url('${pageContext.request.contextPath}/resources/images/2.jpg');
	background-size: cover;
}

#hj-intro-con {
	min-height: 960px;
}
.col-md-3 {
	margin-top:3%;
}
#hj-sub-container {
	padding-right: 50px;
    min-width: 220px;
    height: auto;
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
	<div class="row">
		<div  class="col-md-3" >
		<div id="hj-sub-container">
			<h3>사무소 소개</h3>
			<ul style="border-top: 3px solid black;">
				<li style="margin-top: 10px;"><a href="intro.do"> 인사말</a></li>
				<li><a href="service.do"> - 업무소개</a></li>
				<li><a href="contact.do">오시는길/연락처</a></li>
			</ul>
		</div>
		</div>
	<div class="col-md-9" id="hj-intro-con">
		<div id="serviceList">


			<script type="text/javascript">
				function clickDBtn(service_no) {
					if(confirm("정말 삭제 하시겠습니까?")){
					location.href = "dservice.do?service_no=" + service_no;
					}else{
						return false;
					}
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
	</div>
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
		</div><!-- container -->
	
	<c:import url="../common/footer.jsp" />
</body>
</html>