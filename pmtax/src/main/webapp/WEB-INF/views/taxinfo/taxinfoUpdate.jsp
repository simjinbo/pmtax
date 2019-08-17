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
		elPlaceHolder : "info_contents",
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
			obj.getById["info_contents"].exec("UPDATE_CONTENTS_FIELD", []);
			var title = document.tiUpdateForm.info_title.value;
			if (title == "") {
				alert("제목을 입력하세요.");
				document.tiUpdateForm.info_title.focus;
				return;
			}
			//폼 submit
			document.tiUpdateForm.action = "tiupdate.do";
			$("#tiUpdateForm").submit();
		})
	});
</script>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<div class="container" style="min-height: 960px; font-size: 0.9rem;">
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
						<h4 id="js_taxinfoWr_title">세무정보 수정</h4>
					</div>
					<div class="col" style="margin-top: 10px;">
						<span>HOME > 세무정보 > 세무자료실 > 게시글수정</span>
					</div>
				</div>
				<form id="tiUpdateForm" name="tiUpdateForm" method="POST"
					enctype="multipart/form-data">
					<div class="form-group">
					<input type="hidden" id="nowpage" name="nowpage"
							value="${nowpage }">
						<input type="hidden" id="info_no" name="info_no"
							value="${taxinfo.info_no }"> <label
							for="exampleFormControlInput1">제목</label> <input type="text"
							class="form-control" id="info_title" name="info_title"
							value="${taxinfo.info_title}">
					</div>
					<div class="form-group" id="js_taxinfoWr_filelist">
						<label for="#upfile">첨부파일 (다중선택)</label> &nbsp;<br /> 
						<input type="file" class="form-control-file" id="upfile" name="upfile" multiple>
						<label>등록된 파일 : </label>
						<c:if test="${taxinfo.file1 == null }">
							<label>없음</label>
						</c:if>
						<c:if test="${taxinfo.file1 != null }">
							<label>${taxinfo.file1}</label>
							<input type="hidden" class="form-control" id="file1" name="file1"
								value="${taxinfo.file1}">
						</c:if>
						<c:if test="${taxinfo.file2 != null }">
							<label>/ ${taxinfo.file2}</label>
							<input type="hidden" class="form-control" id="file2" name="file2"
								value="${taxinfo.file2}">
						</c:if>
						<c:if test="${taxinfo.file3 != null }">
							<label>/ ${taxinfo.file3}</label>
							<input type="hidden" class="form-control" id="file3" name="file3"
								value="${taxinfo.file3}">
						</c:if>
						<c:if test="${taxinfo.file4 != null }">
							<label>/ ${taxinfo.file4} </label>
							<input type="hidden" class="form-control" id="file4" name="file4"
								value="${taxinfo.file4}">
						</c:if>
						<c:if test="${taxinfo.file5 != null }">
							<label>/ ${taxinfo.file5} </label>
							<input type="hidden" class="form-control" id="file5" name="file5"
								value="${taxinfo.file5}">
						</c:if>
						<c:if test="${taxinfo.file6 != null }">
							<label>/ ${taxinfo.file6} </label>
							<input type="hidden" class="form-control" id="file6" name="file6"
								value="${taxinfo.file6}">
						</c:if>
					</div>
					<div class="form-group" style="height: 100%;">
						<label for="contents">내용입력</label>
						<div style="height: 100%;">
							<textarea name="info_contents" id="info_contents"
								style="width: 100%; height: 540px">
								${taxinfo.info_contents}
							</textarea>
						</div>
					</div>
					<div class="row">
						<div class="col" style="text-align: right;">
							<input class="btn btn-primary btn-sm" type="button" value="등록"
								id="savebutton">
						</div>
						<button type="button" class="btn btn-outline-info btn-sm"
							onclick="location.href='taxinfoDetail.do?info_no=${taxinfo.info_no }&nowpage=${nowpage}'">뒤로가기</button>
					</div>
				</form>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<c:import url="../common/footer.jsp" />
</body>
</html>