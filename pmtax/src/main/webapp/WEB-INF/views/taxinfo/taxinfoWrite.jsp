<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pmtax</title>
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
			var guide_system = document.ginsertform.guide_system.value;
			var category = document.ginsertform.category.value;
			var title = document.ginsertform.title.value;
			var thumbnail = document.ginsertform.thumbnail.value;
			var contents = document.ginsertform.contents.value;
			if (title == "") {
				alert("제목을 입력하세요.");
				document.ginsertform.title.focus;
				return;
			}
			if (thumbnail == "") {
				alert("썸네일을 업로드하세요.");
				document.ginsertform.thumbnail.focus;
				return;
			}
			//폼 submit
			document.ginsertform.action = "aginsert.do";
			$("#ginsertform").submit();
		})
	});
</script>
<style type="text/css">
#js_taxinfoWr_subcontain {
	display: table-cell;
	overflow: hidden;
	vertical-align: top;
	text-align: center;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
	border: 1px solid #d9d9d9;
	max-width: 250px;
	min-width: 250px;
	hegiht:100%;
}

@media screen and (max-width:991px) {
	#js_taxinfoWr_subcontain {
		max-width: 100%;
		min-width: 100%;
		margin-bottom: 30px;
	}
}

#js_taxinfoWr_subtitle {
	margin-top: 50px;
	font-size: 1.6rem;
	font-family: a고딕16;
}

#js_taxinfoWr_subbar {
	height: 2px;
	margin: 26px 20px 20px;
	background-color: #444444;
}

#js_taxinfoWr_submenu {
	margin-bottom: 30px;
}

#js_taxinfoWr_submenu a {
	height: 50px;
	text-decoration: none;
	color: #444444;
	font-size: 0.9rem;
	font-family: a고딕15;
	line-height: 34px;
}

#js_taxinfoWr_submenu a:hover {
	background-color: #444444;
	color: white;
}
#js_taxinfoWr_title{
	margin-top: 30px;
	font-family: a고딕16;
}
#js_taxinfoWr_form label{
	font-size: 1rem;
	font-family: a고딕15;
}
</style>
<script type="text/javascript">
	var cnt = '';
	function upfileAdd() {
		if (cnt > 4) {
			alert("첨부파일은 6개까지만 올려주십시오.");
		} else {
			eval('upfileAddArea' + cnt).innerHTML += "<input type=file id=upfile"
					+ (cnt + 1)
					+ " name=upfile"
					+ (cnt + 1)
					+ " size='60'><div id='upfileAddArea"
					+ (cnt + 1)
					+ "'></div>";
			cnt++;
		}
	}
	function upfileDelete() {
		if (cnt == 1) {
			$("#upfile1").remove();
			$("#upfileAddArea1").remove();
			cnt = '';
		} else if (cnt > 1) {
			$("#upfile" + cnt).remove();
			$("#upfileAddArea" + cnt).remove();
			cnt--;
		}
	}
</script>
</head>

<body>
	<div class="container"
		style="min-height: 960px; font-size: 0.8rem; margin-top: 50px;">
		<div class="row">
			<!-- Sidebar Widgets Column -->
			<div class="col" id="js_taxinfoWr_subcontain">
				<h5 id="js_taxinfoWr_subtitle">세무정보</h5>
				<div id="js_taxinfoWr_subbar"></div>
				<div>
					<nav class="nav flex-column" id="js_taxinfoWr_submenu">
						<a class="nav-link" href="taxinfoList.do">세무자료실</a> 
						<a class="nav-link" href="#">메뉴2</a>
						<a class="nav-link" href="#">메뉴3</a>
					</nav>
				</div>
			</div>
			<!-- Post Content Column -->
			<div class="col" id="js_taxinfoWr_form">
				<div class="row"
					style="margin: 0 auto; text-align: right; margin-bottom: 20px;">
					<div class="col">
						<h4 id="js_taxinfoWr_title">세무정보 작성</h4>
					</div>
					<div class="col">
						<span>HOME > 세무정보  > 글작성</span>
					</div>
				</div>
				<form id="binsertform" name="binsertform" method="POST"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="exampleFormControlInput1">제목</label> <input
							type="text" class="form-control" id="title" name="title"
							placeholder="제목 입력">
					</div>
					<div class="form-group" id="js_taxinfoWr_filelist">
						<label for="upfile0">첨부파일</label> &nbsp; <a
							href="javascript:upfileAdd();">추가</a>&nbsp; <a
							href='javascript:upfileDelete();'>삭제</a> <input type="file"
							class="form-control-file" id="upfile0" name="upfile0">
						<div id="upfileAddArea"></div>
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
							onclick="location.href='taxinfoList.do'">목록으로</button>
					</div>
				</form>
			</div>
		</div>
		<!-- /.row -->
	</div>
</body>
</html>