<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/files/main/logo.png">
<title>가감세무법인</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/taxinfo.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/editor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript">
$(function() {
	//전역변수
	var obj = [];
	//스마트에디터 프레임생성
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : obj,
		elPlaceHolder : "contents",
		sSkinURI : "<%=request.getContextPath()%>/resources/editor/SmartEditor2Skin.html",
					htParams : {
						// 툴바 사용 여부
						bUseToolbar : true,
						// 입력창 크기 조절바 사용 여부
						bUseVerticalResizer : true,
						// 모드 탭(Editor | HTML | TEXT) 사용 여부
						bUseModeChanger : true,
					}
				});
		//전송버튼
		$("#savebutton").click(function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
			obj.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
			var title = document.tiInsertForm.title.value;
			if (title == "") {
				alert("제목을 입력하세요.");
				document.tiInsertForm.title.focus;
				return;
			}
			//폼 submit
			document.tiInsertForm.action = "tiinsert.do";
			$("#tiInsertForm").submit();
		})
	});
</script>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<div class="container"
		style="min-height: 960px; font-size: 0.8rem;">
		<div class="row">
			<!-- Sidebar Widgets Column -->
			<div class="col" id="js_taxinfoWr_subcontain">
				<h5 id="js_taxinfoWr_subtitle">세무정보</h5>
				<div id="js_taxinfoWr_subbar"></div>
				<div>
					<nav class="nav flex-column" id="js_taxinfoWr_submenu">
						<a class="nav-link" href="taxinfoList.do?nowpage=0">세무자료실</a>
					</nav>
				</div>
			</div>
			<!-- Post Content Column -->
			<div class="col" id="js_taxinfoWr_form">
				<div class="row" id="js_taxinfoWr_row">
					<div class="col">
						<h4 id="js_taxinfoWr_title">세무정보 작성</h4>
					</div>
					<div class="col" style="margin-top: 10px;">
						<span>HOME > 세무정보  > 글작성</span>
					</div>
				</div>
				<form id="tiInsertForm" name="tiInsertForm" method="POST" enctype="multipart/form-data">
					<div class="form-group">
						<label for="exampleFormControlInput1">제목</label> <input
							type="text" class="form-control" id="title" name="title"
							placeholder="제목 입력">
					</div>
					<div class="form-group" id="js_taxinfoWr_filelist">
						<label for="#upfile">첨부파일 (다중선택 6개까지)</label> &nbsp;
						<input type="file" class="form-control-file" id="upfile" name="upfile" multiple>
					</div>
					<div class="form-group" style="height: 100%;">
						<label for="contents">내용입력</label>
						<div style="height: 100%;">
							<textarea name="contents" id="contents"
								style="width: 100%; height: 540px"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="col" style="text-align: right;">
							<input class="btn btn-primary btn-sm" type="button" value="등록"
								id="savebutton">
						</div>
						<button type="button" class="btn btn-outline-info btn-sm"
							onclick="location.href='taxinfoList.do?nowpage=0'">목록으로</button>
					</div>
				</form>
			</div>
		</div>
		<!-- /.row -->
	</div>
</body>
</html>