<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/files/main/logo.png">
<title>가감세무법인</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/taxinfo.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var file1 = "${taxinfo.file1 }";
		if (file1 != null) {
			$("#js_taxinfoDe_filec").click(function() {
				if ($("#js_taxinfoDe_filelist").is(":visible") == true) {
					$("#js_taxinfoDe_filelist").hide('1000');
				} else {
					$("#js_taxinfoDe_filelist").show('1000'); //천천히 보이기
				}
			});
		}
		var count = 0;
		if (file1 != "") {
			for (var i = 1; i < 7; i++) {
				var file = $("#js_taxinfoDe_file" + i).text();
				if (file == null || file == "" || file == "null") {
					
				}else{
					count++;
				}
			}
			$("#js_taxinfoDe_filec").text(count);

		} else {
			$("#js_taxinfoDe_filec").html("0");
		}
	});
</script>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<div class="container" style="min-height: 960px; font-size: 0.9rem;">
		<div class="row">
			<!-- Sidebar Widgets Column -->
			<div class="col" id="js_taxinfoDe_subcontain">
				<h5 id="js_taxinfoDe_subtitle">세무정보</h5>
				<div id="js_taxinfoDe_subbar"></div>
				<div>
					<nav class="nav flex-column" id="js_taxinfoDe_submenu">
						<a class="nav-link" href="taxinfoList.do?nowpage=0">세무자료실</a>
					</nav>
				</div>
			</div>
			<!-- Post Content Column -->
			<div class="col" id="js_taxinfoDe_contents">
				<div class="row" id="js_taxinfoDe_row">
					<div class="col">
						<span>HOME > 세무정보 > 세무자료실 > 게시글상세</span>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<!-- Title -->
						<h4 class="mt-4">${taxinfo.info_title}</h4>
					</div>
					<div class="col-4" align="right" style="padding-top: 25px;">
						<c:if test="${loginUser.user_no == 1 }">
							<!-- 관리자 -->
							<button class="btn btn-success btn-sm"
								onclick="location.href='taxinfoUpdateView.do?info_no=${taxinfo.info_no}&nowpage=${nowpage }'">수정</button>
							<button type="button" class="btn btn-danger btn-sm"
								data-toggle="modal" data-target="#exampleModal">삭제</button>
						</c:if>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col">${taxinfo.info_writer }</div>
					<div class="col">${taxinfo.info_date }</div>
					<div class="col-6" style="text-align: right;">
						<c:if test="${taxinfo.file1 == null }">
							첨부파일 <span id="js_taxinfoDe_filec"> </span>개
						</c:if>
						<c:if test="${taxinfo.file1 != null }">
							첨부파일 <a href="#" onclick="" id="js_taxinfoDe_filec"> </a>개
						</c:if>
					</div>
				</div>
				<hr>
				<c:if test="${taxinfo.file1 != null }">
					<div id="js_taxinfoDe_filelist">
						<table style="margin: 0 auto; width: 100%;">

							<tr>
								<td id="js_taxinfoDe_file1"><a href='tiFileDown.do?file=${taxinfo.file1 }'>${taxinfo.file1 }</a></td>
								<td id="js_taxinfoDe_file2"><a href='tiFileDown.do?file=${taxinfo.file2 }'>${taxinfo.file2 }</a></td>
								<td id="js_taxinfoDe_file3"><a href='tiFileDown.do?file=${taxinfo.file3 }'>${taxinfo.file3 }</a></td>
							</tr>
							<c:if test="${taxinfo.file4 != null }">
								<tr>
									<td id="js_taxinfoDe_file4"><a href='tiFileDown.do?file=${taxinfo.file4 }'>${taxinfo.file4 }</a></td>
									<td id="js_taxinfoDe_file5"><a href='tiFileDown.do?file=${taxinfo.file5 }'>${taxinfo.file5 }</a></td>
									<td id="js_taxinfoDe_file6"><a href='tiFileDown.do?file=${taxinfo.file5 }'>${taxinfo.file6 }</a></td>
								</tr>
							</c:if>
						</table>
						<hr>
					</div>
					<script type="text/javascript">
					for(var i =1; i > 7; i++){
						var value=$("js_taxinfoDe_file"+i).val();
						if(value == null || value == ""){
							$("js_taxinfoDe_file"+i).val("");
						}
					}
					</script>
				</c:if>
				<div style="min-height: 600px;">
					<p id="js_taxinfoDe_cont">${taxinfo.info_contents}</p>
				</div>
				<div class="col" align="right" style=" padding-top: 50px; margin-bottom: 50px;">
					<button class="btn btn-secondary btn-sm"
						onclick="location.href='javascript:scroll(0,0);'">위로가기</button>
					&nbsp;&nbsp;
					<button class="btn btn-dark btn-sm"
						onclick="location.href='taxinfoList.do?nowpage=${nowpage}'">목록으로</button>
				</div>
			</div>
		</div>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">삭제 안내메세지</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">해당 게시물을 정말 삭제하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" onclick="location.href='tidelete.do?info_no=${taxinfo.info_no }'">삭제</button>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<c:import url="../common/footer.jsp" />
</body>
</html>