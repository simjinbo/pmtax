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
						<h4 id="js_taxinfoWr_title">세무정보 수정</h4>
					</div>
					<div class="col">
						<span>HOME > 세무정보  > 글수정</span>
					</div>
				</div>
				<form id="binsertform" name="binsertform" method="POST"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="exampleFormControlInput1">제목</label> <input
							type="text" class="form-control" id="title" name="title"
							value="">
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
								style="width: 100%; height: 540px">
								<div class="se_component se_image default" style=" max-width:50%; margin-top: 30px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea se_align-center" style="position: relative; width: 886px; margin: 0px auto; text-align: center; max-width: none; font-size: 0px;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea" style="position: relative; margin-right: auto; margin-left: auto; max-width: 740px;"><a href="https://blog.naver.com/PostView.nhn?blogId=gngclub&amp;logNo=221360459758&amp;from=search&amp;redirect=Log&amp;widgetTypeCall=true&amp;topReferer=https%3A%2F%2Fsearch.naver.com%2Fsearch.naver%3Fsm%3Dtab_hty.top%26where%3Dpost%26query%3D%25EC%2584%25B8%25EB%25AC%25B4%2B%25EC%2583%2581%25EB%258B%25B4%26oquery%3D%25EC%2584%25B8%25EB%25AC%25B4%25ED%259A%258C%25EA%25B3%2584%2B%25EC%2583%2581%25EB%258B%25B4%26tqi%3DUecVowp0JywssgwC97CssssstqK-493779&amp;directAccess=false#" class="se_mediaArea __se_image_link __se_link" data-linktype="img" data-linkdata="{&quot;imgId&quot; : &quot;SEDOC-1537147332891--531886759_image_0_img&quot;, &quot;src&quot; : &quot;https://postfiles.pstatic.net/MjAxODA5MTdfMTg4/MDAxNTM3MTQ3MDk2OTgy.w4QNSAYGB0mmBRYAggOK_rk7QWl_ECaPMnosaIyHmBkg.qeT3qpJSz6COqQlyDeN8AeSnY5gPy1k6mGg5iWYZ7EIg.PNG.gngclub/1.png&quot;, &quot;linkUse&quot; : &quot;false&quot;, &quot;link&quot; : &quot;&quot;}" style="color: rgb(0, 0, 0); text-decoration-line: none; position: relative; display: block;"><img id="SEDOC-1537147332891--531886759_image_0_img" class="se_mediaImage __se_img_el" src="https://postfiles.pstatic.net/MjAxODA5MTdfMTg4/MDAxNTM3MTQ3MDk2OTgy.w4QNSAYGB0mmBRYAggOK_rk7QWl_ECaPMnosaIyHmBkg.qeT3qpJSz6COqQlyDeN8AeSnY5gPy1k6mGg5iWYZ7EIg.PNG.gngclub/1.png?type=w966" data-lazy-src="" data-width="740" data-height="740" width="740" height="740" data-attachment-id="If18oxuTGWj1aHNRZyxuB9iUGkgQ" alt="" style="border: 0px; vertical-align: top; height: auto; width: 740px; max-width: 100%;"></a></div></div></div></div><div class="se_component se_paragraph default" style="margin-top: 30px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; word-break: normal; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea" style="position: relative; width: 886px; margin: 0px auto; max-width: none;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea se_ff_nanumgothic se_fs_T3 se_align-left" style="position: relative; font-family: 나눔고딕, nanumgothic, se_NanumGothic, AppleSDGothicNeo, sans-serif, simhei; font-size: 16px; overflow-wrap: break-word; line-height: 1.9;"><div class="se_editView" style="position: relative;"><div class="se_textView"><p class="se_textarea" style="width: 886px; height: 300px; outline: 0px; border: none; background: 0px 0px; font-family: inherit; font-size: inherit; font-weight: inherit; line-height: inherit; color: inherit; text-align: inherit; font-style: inherit; text-decoration: inherit; resize: none; overflow-wrap: break-word; word-break: break-all;">우리나라 직업의 수는<span lang="EN-US" style="background-color: inherit;">&nbsp;1</span>만개가 넘을 정도로 많은 사람들이 각기 다른 다양한 분야에서 일을 하고 있습니다<span lang="EN-US" style="background-color: inherit;">.&nbsp;</span>이렇게 사회 활동을 통해 일을 해서 경제적 소득이 생기게 되면 소득에 비례한 만큼의 일정 세금을 납부해야 하는데요<span lang="EN-US" style="background-color: inherit;">.&nbsp;</span>회사에 소속돼서 근무를 하고 있는 직장인들의 경우 간편하게 연말정산을 하면 되지만 일반사업자들의 경우 자신이 직접 해야만 합니다<span lang="EN-US" style="background-color: inherit;">.</span><br><span lang="EN-US" style="background-color: inherit;">&nbsp;</span><br>하지만 전문 분야가 아닌 만큼 혼자서 진행하게 되면&nbsp;<span style="background-color: inherit;">꼼꼼한 장부작성을 하지 못해 불성실 신고 가산세를 내야 하거나 예상하지 못한 세금 폭탄</span>을 맞게 되는 상황에 처하게 됩니다<span lang="EN-US" style="background-color: inherit;">.&nbsp;</span>그래서 이러한 손해를 줄이고자 세무상담을 통해 전문가의 기장을 맡기는 사업자 분들이 늘어나고 있는 추세입니다<span style="background-color: inherit;"><span lang="EN-US" style="background-color: inherit;">.</span><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;"></span></p></div></div></div></div></div></div><div class="se_component se_image default" style="margin-top: 30px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea se_align-center" style="position: relative; width: 886px; margin: 0px auto; text-align: center; max-width: none; font-size: 0px;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea" style="position: relative; margin-right: auto; margin-left: auto; max-width: 740px;"><a href="https://blog.naver.com/PostView.nhn?blogId=gngclub&amp;logNo=221360459758&amp;from=search&amp;redirect=Log&amp;widgetTypeCall=true&amp;topReferer=https%3A%2F%2Fsearch.naver.com%2Fsearch.naver%3Fsm%3Dtab_hty.top%26where%3Dpost%26query%3D%25EC%2584%25B8%25EB%25AC%25B4%2B%25EC%2583%2581%25EB%258B%25B4%26oquery%3D%25EC%2584%25B8%25EB%25AC%25B4%25ED%259A%258C%25EA%25B3%2584%2B%25EC%2583%2581%25EB%258B%25B4%26tqi%3DUecVowp0JywssgwC97CssssstqK-493779&amp;directAccess=false#" class="se_mediaArea __se_image_link __se_link" data-linktype="img" data-linkdata="{&quot;imgId&quot; : &quot;SEDOC-1537147332891--531886759_image_1_img&quot;, &quot;src&quot; : &quot;https://postfiles.pstatic.net/MjAxODA5MTdfMjYx/MDAxNTM3MTQ3MDk4NDQ3.NkvplvPI0CxHyrkihJZNonfcy_w9sOev2_-fMK0h84Ug.C7g9Jgq7bY0E0Mbu6K3cQaocVO03HcZvvQwCL6_b1Wcg.PNG.gngclub/2.png&quot;, &quot;linkUse&quot; : &quot;false&quot;, &quot;link&quot; : &quot;&quot;}" style="color: rgb(0, 0, 0); text-decoration-line: none; position: relative; display: block;"><img id="SEDOC-1537147332891--531886759_image_1_img" class="se_mediaImage __se_img_el" src="https://postfiles.pstatic.net/MjAxODA5MTdfMjYx/MDAxNTM3MTQ3MDk4NDQ3.NkvplvPI0CxHyrkihJZNonfcy_w9sOev2_-fMK0h84Ug.C7g9Jgq7bY0E0Mbu6K3cQaocVO03HcZvvQwCL6_b1Wcg.PNG.gngclub/2.png?type=w966" data-lazy-src="" data-width="740" data-height="740" width="740" height="740" data-attachment-id="ICJ-nEccQci1nxYiKZiDyTBhtu0U" alt="" style="border: 0px; vertical-align: top; height: auto; width: 740px; max-width: 100%;"></a></div></div></div></div><div class="se_component se_paragraph default" style="margin-top: 30px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; word-break: normal; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea" style="position: relative; width: 886px; margin: 0px auto; max-width: none;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea se_ff_nanumgothic se_fs_T3 se_align-left" style="position: relative; font-family: 나눔고딕, nanumgothic, se_NanumGothic, AppleSDGothicNeo, sans-serif, simhei; font-size: 16px; overflow-wrap: break-word; line-height: 1.9;"><div class="se_editView" style="position: relative;"><div class="se_textView"><p class="se_textarea" style="width: 886px; height: 210px; outline: 0px; border: none; background: 0px 0px; font-family: inherit; font-size: inherit; font-weight: inherit; line-height: inherit; color: inherit; text-align: inherit; font-style: inherit; text-decoration: inherit; resize: none; overflow-wrap: break-word; word-break: break-all;">금전적인 손해를 보지 않기 위해 수많은 사업자들이 세<span lang="EN-US" style="background-color: inherit;">.</span>무<span lang="EN-US" style="background-color: inherit;">.</span>사의 도움을 받고자 자신의 회사와 가까운 곳에서 세무상담을 받은 뒤 기장을 맡기게 됩니다<span lang="EN-US" style="background-color: inherit;">.&nbsp;</span>물론 처음에는 이것저것 챙겨주며 자신이 직접 세금신고를 할 때와는 다르게 절세를 한다고 생각하게 되는데요<span lang="EN-US" style="background-color: inherit;">.&nbsp;</span>하지만 시간이 갈수록 제대로 하고 있는게 맞는지 의문을 갖게 되고<span lang="EN-US" style="background-color: inherit;">,&nbsp;</span>자연스럽게 세<span lang="EN-US" style="background-color: inherit;">.</span>무<span lang="EN-US" style="background-color: inherit;">.</span>사를 교체해야 하는 건 아닌지 하는 생각을 갖게 됩니다<span style="background-color: inherit;"><span lang="EN-US" style="background-color: inherit;">.</span><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;"></span></p></div></div></div></div></div></div><div class="se_component se_image default" style="margin-top: 30px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea se_align-center" style="position: relative; width: 886px; margin: 0px auto; text-align: center; max-width: none; font-size: 0px;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea" style="position: relative; margin-right: auto; margin-left: auto; max-width: 740px;"><a href="https://blog.naver.com/PostView.nhn?blogId=gngclub&amp;logNo=221360459758&amp;from=search&amp;redirect=Log&amp;widgetTypeCall=true&amp;topReferer=https%3A%2F%2Fsearch.naver.com%2Fsearch.naver%3Fsm%3Dtab_hty.top%26where%3Dpost%26query%3D%25EC%2584%25B8%25EB%25AC%25B4%2B%25EC%2583%2581%25EB%258B%25B4%26oquery%3D%25EC%2584%25B8%25EB%25AC%25B4%25ED%259A%258C%25EA%25B3%2584%2B%25EC%2583%2581%25EB%258B%25B4%26tqi%3DUecVowp0JywssgwC97CssssstqK-493779&amp;directAccess=false#" class="se_mediaArea __se_image_link __se_link" data-linktype="img" data-linkdata="{&quot;imgId&quot; : &quot;SEDOC-1537147332891--531886759_image_2_img&quot;, &quot;src&quot; : &quot;https://postfiles.pstatic.net/MjAxODA5MTdfMyAg/MDAxNTM3MTQ3MDk2OTgy.8i6zT5JjE5sAXt3_103HJzVHk5oKJJVx1xto6J4bV5Ug.c0CawlxLjJmjp8GaJbptMBS2pkwQ7VNP8DWENARvrKQg.PNG.gngclub/3.png&quot;, &quot;linkUse&quot; : &quot;false&quot;, &quot;link&quot; : &quot;&quot;}" style="color: rgb(0, 0, 0); text-decoration-line: none; position: relative; display: block;"><img id="SEDOC-1537147332891--531886759_image_2_img" class="se_mediaImage __se_img_el" src="https://postfiles.pstatic.net/MjAxODA5MTdfMyAg/MDAxNTM3MTQ3MDk2OTgy.8i6zT5JjE5sAXt3_103HJzVHk5oKJJVx1xto6J4bV5Ug.c0CawlxLjJmjp8GaJbptMBS2pkwQ7VNP8DWENARvrKQg.PNG.gngclub/3.png?type=w966" data-lazy-src="" data-width="740" data-height="534" width="740" height="534" data-attachment-id="IBw21_rdDAWXk6k-oGECTV1pbopk" alt="" style="border: 0px; vertical-align: top; height: auto; width: 740px; max-width: 100%;"></a></div></div></div></div><div class="se_component se_paragraph default" style="margin-top: 30px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; word-break: normal; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea" style="position: relative; width: 886px; margin: 0px auto; max-width: none;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea se_ff_nanumgothic se_fs_T3 se_align-left" style="position: relative; font-family: 나눔고딕, nanumgothic, se_NanumGothic, AppleSDGothicNeo, sans-serif, simhei; font-size: 16px; overflow-wrap: break-word; line-height: 1.9;"><div class="se_editView" style="position: relative;"><div class="se_textView"><p class="se_textarea" style="width: 886px; height: 150px; outline: 0px; border: none; background: 0px 0px; font-family: inherit; font-size: inherit; font-weight: inherit; line-height: inherit; color: inherit; text-align: inherit; font-style: inherit; text-decoration: inherit; resize: none; overflow-wrap: break-word; word-break: break-all;">위에서 이야기한 사례 이외에도 지불하고 있는 기장료에 맞는 절세를 하고 있는지<span lang="EN-US" style="background-color: inherit;">,&nbsp;</span>자신의 회사 업종을 이해하고 어떻게 하면 더 많은 항목에 대한 공제를 받을 수 있게 도와주는지 등 확실한 케어를 받지 못한다고 느끼게 되면 세<span lang="EN-US" style="background-color: inherit;">.</span>무<span lang="EN-US" style="background-color: inherit;">.</span>사 교체를 희망하게 되는 것입니다<span style="background-color: inherit;"><span lang="EN-US" style="background-color: inherit;">.</span><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;"></span></p></div></div></div></div></div></div><div class="se_component se_image default" style="margin-top: 30px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea se_align-center" style="position: relative; width: 886px; margin: 0px auto; text-align: center; max-width: none; font-size: 0px;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea" style="position: relative; margin-right: auto; margin-left: auto; max-width: 740px;"><a href="https://blog.naver.com/PostView.nhn?blogId=gngclub&amp;logNo=221360459758&amp;from=search&amp;redirect=Log&amp;widgetTypeCall=true&amp;topReferer=https%3A%2F%2Fsearch.naver.com%2Fsearch.naver%3Fsm%3Dtab_hty.top%26where%3Dpost%26query%3D%25EC%2584%25B8%25EB%25AC%25B4%2B%25EC%2583%2581%25EB%258B%25B4%26oquery%3D%25EC%2584%25B8%25EB%25AC%25B4%25ED%259A%258C%25EA%25B3%2584%2B%25EC%2583%2581%25EB%258B%25B4%26tqi%3DUecVowp0JywssgwC97CssssstqK-493779&amp;directAccess=false#" class="se_mediaArea __se_image_link __se_link" data-linktype="img" data-linkdata="{&quot;imgId&quot; : &quot;SEDOC-1537147332891--531886759_image_3_img&quot;, &quot;src&quot; : &quot;https://postfiles.pstatic.net/MjAxODA5MTdfMSAg/MDAxNTM3MTQ3MDk2NTMx.AtcSyv8ZcjY9XS6K46UHK6JWdApE4aoqRhb7Qjza8NAg.ftgsTlWwMyeG_InLYSXM6KsCPZma5ARjEGZUAVaWZfIg.PNG.gngclub/4.png&quot;, &quot;linkUse&quot; : &quot;false&quot;, &quot;link&quot; : &quot;&quot;}" style="color: rgb(0, 0, 0); text-decoration-line: none; position: relative; display: block;"><img id="SEDOC-1537147332891--531886759_image_3_img" class="se_mediaImage __se_img_el" src="https://postfiles.pstatic.net/MjAxODA5MTdfMSAg/MDAxNTM3MTQ3MDk2NTMx.AtcSyv8ZcjY9XS6K46UHK6JWdApE4aoqRhb7Qjza8NAg.ftgsTlWwMyeG_InLYSXM6KsCPZma5ARjEGZUAVaWZfIg.PNG.gngclub/4.png?type=w966" data-lazy-src="" data-width="740" data-height="727" width="740" height="727" data-attachment-id="Id0Stz-Tbx_zEA7FLr0t_oO0tbRQ" alt="" style="border: 0px; vertical-align: top; height: auto; width: 740px; max-width: 100%;"></a></div></div></div></div><div class="se_component se_paragraph default" style="margin-top: 30px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; word-break: normal; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea" style="position: relative; width: 886px; margin: 0px auto; max-width: none;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea se_ff_nanumgothic se_fs_T3 se_align-left" style="position: relative; font-family: 나눔고딕, nanumgothic, se_NanumGothic, AppleSDGothicNeo, sans-serif, simhei; font-size: 16px; overflow-wrap: break-word; line-height: 1.9;"><div class="se_editView" style="position: relative;"><div class="se_textView"><p class="se_textarea" style="width: 886px; height: 450px; outline: 0px; border: none; background: 0px 0px; font-family: inherit; font-size: inherit; font-weight: inherit; line-height: inherit; color: inherit; text-align: inherit; font-style: inherit; text-decoration: inherit; resize: none; overflow-wrap: break-word; word-break: break-all;">이런 상황에서 한번쯤은 꼭 세금관리를 위해 세무상담을 받은 다음 기장을 맡겨야 할까 라는 의문이 들게 마련입니다<span lang="EN-US" style="background-color: inherit;">.&nbsp;</span>정답일수도 있고 아닐 수도 있지만 이왕이면 하는 것이 좋습니다<span lang="EN-US" style="background-color: inherit;">.&nbsp;</span>자신의 일이나 사업의 장기적인 측면을 봤을 때 유리하게 작용하기 때문인데 크게<span lang="EN-US" style="background-color: inherit;">3</span>가지로 나누어볼 수 있습니다<span lang="EN-US" style="background-color: inherit;">.</span><br><span lang="EN-US" style="background-color: inherit;">&nbsp;</span><br>우선 첫 번째는&nbsp;<span style="font-weight: 600; background-color: inherit;">사업 결손 시<span lang="EN-US" style="background-color: inherit;">,&nbsp;</span>이월공제가 적용</span>된다는 것인데<span lang="EN-US" style="background-color: inherit;">,&nbsp;</span>장부를 작성하게 되면 실제 수입에서 필요경비를 차감해서 계산을 하게 되는데 혹시라도 적자가 발생하게 되면 이 금액을<span lang="EN-US" style="background-color: inherit;">&nbsp;10</span>년간 이월이 가능합니다<span lang="EN-US" style="background-color: inherit;">.</span><br>두 번째는&nbsp;<span style="font-weight: 600; background-color: inherit;">무기장 가산세 및 기<span lang="EN-US" style="background-color: inherit;">.</span>장 세액공제</span>로 굳이 꼼꼼하게 장부를 작성하지 않아도 되는 간편장부대상자가 복식부기로 기<span lang="EN-US" style="background-color: inherit;">.</span>장을 하게 되면 최대<span lang="EN-US" style="background-color: inherit;">&nbsp;40%</span>의 절세효과를 볼 수 있습니다<span lang="EN-US" style="background-color: inherit;">.</span><br>세 번째는&nbsp;<span style="font-weight: 600; background-color: inherit;">각종 충당금 공제</span>&nbsp;받을 수 있는데 감가상각비와 대손상가비 등이 필요경비로 계산되어 세금부담을 최소화하여 지출을 줄여나가는데 큰 도움이 됩니다<span lang="EN-US" style="background-color: inherit;">.</span><br><span lang="EN-US" style="background-color: inherit;">&nbsp;</span><br>이러한 다양한 혜택이 있어서 비용을 지불하면서까지 맡기고 싶은 마음이 없음에도 맡기게 됩니다<span style="background-color: inherit;"><span lang="EN-US" style="background-color: inherit;">.</span><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;"></span></p></div></div></div></div></div></div><div class="se_component se_image default" style="margin-top: 30px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea se_align-center" style="position: relative; width: 886px; margin: 0px auto; text-align: center; max-width: none; font-size: 0px;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea" style="position: relative; margin-right: auto; margin-left: auto; max-width: 740px;"><a href="https://blog.naver.com/PostView.nhn?blogId=gngclub&amp;logNo=221360459758&amp;from=search&amp;redirect=Log&amp;widgetTypeCall=true&amp;topReferer=https%3A%2F%2Fsearch.naver.com%2Fsearch.naver%3Fsm%3Dtab_hty.top%26where%3Dpost%26query%3D%25EC%2584%25B8%25EB%25AC%25B4%2B%25EC%2583%2581%25EB%258B%25B4%26oquery%3D%25EC%2584%25B8%25EB%25AC%25B4%25ED%259A%258C%25EA%25B3%2584%2B%25EC%2583%2581%25EB%258B%25B4%26tqi%3DUecVowp0JywssgwC97CssssstqK-493779&amp;directAccess=false#" class="se_mediaArea __se_image_link __se_link" data-linktype="img" data-linkdata="{&quot;imgId&quot; : &quot;SEDOC-1537147332891--531886759_image_4_img&quot;, &quot;src&quot; : &quot;https://postfiles.pstatic.net/MjAxODA5MTdfMTA0/MDAxNTM3MTQ3MDk3NTg4.BfYwww0U7HpZLe6qOoi8GPLB2BA9dQmpgTAcRWbfGqsg.G-wYvARaQhlzya0t5c8_BKDxMt4tTwOktDl2Glv9Vikg.PNG.gngclub/5.png&quot;, &quot;linkUse&quot; : &quot;false&quot;, &quot;link&quot; : &quot;&quot;}" style="color: rgb(0, 0, 0); text-decoration-line: none; position: relative; display: block;"><img id="SEDOC-1537147332891--531886759_image_4_img" class="se_mediaImage __se_img_el" src="https://postfiles.pstatic.net/MjAxODA5MTdfMTA0/MDAxNTM3MTQ3MDk3NTg4.BfYwww0U7HpZLe6qOoi8GPLB2BA9dQmpgTAcRWbfGqsg.G-wYvARaQhlzya0t5c8_BKDxMt4tTwOktDl2Glv9Vikg.PNG.gngclub/5.png?type=w966" data-lazy-src="" data-width="740" data-height="740" width="740" height="740" data-attachment-id="IxZiHVJeqjbPqmVZ7sDffs0gSPjw" alt="" style="border: 0px; vertical-align: top; height: auto; width: 740px; max-width: 100%;"></a></div></div></div></div><div class="se_component se_paragraph default" style="margin-top: 30px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; word-break: normal; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea" style="position: relative; width: 886px; margin: 0px auto; max-width: none;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea se_ff_nanumgothic se_fs_T3 se_align-left" style="position: relative; font-family: 나눔고딕, nanumgothic, se_NanumGothic, AppleSDGothicNeo, sans-serif, simhei; font-size: 16px; overflow-wrap: break-word; line-height: 1.9;"><div class="se_editView" style="position: relative;"><div class="se_textView"><p class="se_textarea" style="width: 886px; height: 390px; outline: 0px; border: none; background: 0px 0px; font-family: inherit; font-size: inherit; font-weight: inherit; line-height: inherit; color: inherit; text-align: inherit; font-style: inherit; text-decoration: inherit; resize: none; overflow-wrap: break-word; word-break: break-all;">교체를 하고 싶어도 번거롭고<span lang="EN-US" style="background-color: inherit;">,&nbsp;</span>이것저것 까다로운 사항들이 있을봐 쉽게 바꾸지 못하고 울며 겨자 먹기 식으로 기장대리를 맡기는 사업자분들이 많은데 방법으로는 전산자료의 경우<span lang="EN-US" style="background-color: inherit;">&nbsp;E-mail</span>을 통해 보내면 되고<span lang="EN-US" style="background-color: inherit;">,&nbsp;</span>서면자료의 경우 택배만 부치면 간단하게 해결이 됩니다<br><span lang="EN-US" style="background-color: inherit;">&nbsp;</span><br>하지만 중요한건 같은 실수를 되풀이하고 싶지 않은 마음이 있다는 것인데요<span lang="EN-US" style="background-color: inherit;">.&nbsp;</span>이러지도 저러지도 못하고 결정하지 못하는 분들에게 고민을 해결해줄 시원한 방법이 있습니다<span lang="EN-US" style="background-color: inherit;">.&nbsp;</span>바로 세무비교견적어플 찾아줘세무사를 이용하는 것입니다<span lang="EN-US" style="background-color: inherit;">.&nbsp;</span>바쁜 업무 중에 번거롭게 방문해서 상담을 받지 않고도 가지고 있는 개인 스마트폰을 통해 견적을 요청할 수 있기 때문인데요<span lang="EN-US" style="background-color: inherit;">.&nbsp;</span>특히 이러한 비교견적을 어떠한 비용도 받지 않고 제공해주고 있어 세금관리의 필요성을 느끼고 있는 프리랜서와 사업자분들에게 커다란 관심을 받고 있습니다<span lang="EN-US" style="background-color: inherit;">.</span><br><span lang="EN-US" style="background-color: inherit;">&nbsp;</span><br>뿐만 아니라 상<span lang="EN-US" style="background-color: inherit;">.</span>담을 하는 것만으로도 비용을 요구하는 곳도 있고<span lang="EN-US" style="background-color: inherit;">,&nbsp;</span>가는 곳마다 전부 다른 기장료 때문에 이런 금액을 지불하는게 합당한가에 대한 확신을 갖기 어려워 상<span lang="EN-US" style="background-color: inherit;">!</span>담을 받고도 결정하지 못하고 전문가의 도움 없이 혼자서 진행하시는 분들이 의외로 많습니다<span style="background-color: inherit;"><span lang="EN-US" style="background-color: inherit;">.</span><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;"></span></p></div></div></div></div></div></div><div class="se_component se_image default" style="margin-top: 30px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea se_align-center" style="position: relative; width: 886px; margin: 0px auto; text-align: center; max-width: none; font-size: 0px;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea" style="position: relative; margin-right: auto; margin-left: auto; max-width: 740px;"><a href="https://blog.naver.com/PostView.nhn?blogId=gngclub&amp;logNo=221360459758&amp;from=search&amp;redirect=Log&amp;widgetTypeCall=true&amp;topReferer=https%3A%2F%2Fsearch.naver.com%2Fsearch.naver%3Fsm%3Dtab_hty.top%26where%3Dpost%26query%3D%25EC%2584%25B8%25EB%25AC%25B4%2B%25EC%2583%2581%25EB%258B%25B4%26oquery%3D%25EC%2584%25B8%25EB%25AC%25B4%25ED%259A%258C%25EA%25B3%2584%2B%25EC%2583%2581%25EB%258B%25B4%26tqi%3DUecVowp0JywssgwC97CssssstqK-493779&amp;directAccess=false#" class="se_mediaArea __se_image_link __se_link" data-linktype="img" data-linkdata="{&quot;imgId&quot; : &quot;SEDOC-1537147332891--531886759_image_5_img&quot;, &quot;src&quot; : &quot;https://postfiles.pstatic.net/MjAxODA5MTdfMjI3/MDAxNTM3MTQ3MDk4NjM3.Fc_3xok2lcSw6OmdU2N25AJV5y-CSCA5B4GxpT-P6wkg.EUxetklqOWaetwpqdvwK4X08yp0FaSwas87DHnMaz4Eg.PNG.gngclub/6.png&quot;, &quot;linkUse&quot; : &quot;false&quot;, &quot;link&quot; : &quot;&quot;}" style="color: rgb(0, 0, 0); text-decoration-line: none; position: relative; display: block;"><img id="SEDOC-1537147332891--531886759_image_5_img" class="se_mediaImage __se_img_el" src="https://postfiles.pstatic.net/MjAxODA5MTdfMjI3/MDAxNTM3MTQ3MDk4NjM3.Fc_3xok2lcSw6OmdU2N25AJV5y-CSCA5B4GxpT-P6wkg.EUxetklqOWaetwpqdvwK4X08yp0FaSwas87DHnMaz4Eg.PNG.gngclub/6.png?type=w966" data-lazy-src="" data-width="740" data-height="576" width="740" height="576" data-attachment-id="I3gK6FCYyfbQs-_JLjmk8_oMhIb4" alt="" style="border: 0px; vertical-align: top; height: auto; width: 740px; max-width: 100%;"></a></div></div></div></div><div class="se_component se_image default" style="margin-top: 5px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea se_align-center" style="position: relative; width: 886px; margin: 0px auto; text-align: center; max-width: none; font-size: 0px;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea" style="position: relative; margin-right: auto; margin-left: auto; max-width: 740px;"><a href="https://blog.naver.com/PostView.nhn?blogId=gngclub&amp;logNo=221360459758&amp;from=search&amp;redirect=Log&amp;widgetTypeCall=true&amp;topReferer=https%3A%2F%2Fsearch.naver.com%2Fsearch.naver%3Fsm%3Dtab_hty.top%26where%3Dpost%26query%3D%25EC%2584%25B8%25EB%25AC%25B4%2B%25EC%2583%2581%25EB%258B%25B4%26oquery%3D%25EC%2584%25B8%25EB%25AC%25B4%25ED%259A%258C%25EA%25B3%2584%2B%25EC%2583%2581%25EB%258B%25B4%26tqi%3DUecVowp0JywssgwC97CssssstqK-493779&amp;directAccess=false#" class="se_mediaArea __se_image_link __se_link" data-linktype="img" data-linkdata="{&quot;imgId&quot; : &quot;SEDOC-1537147332891--531886759_image_6_img&quot;, &quot;src&quot; : &quot;https://postfiles.pstatic.net/MjAxODA5MTdfMjQw/MDAxNTM3MTQ3MDk5MjU5.OPJn4DkcK0yGBLzIbYhEzt586jeI73bCakHMTBfQubYg.sBKSyWScpSfNGEmAC2VrA2nhBw4bBxOgJV5AK0WOvyYg.PNG.gngclub/7.png&quot;, &quot;linkUse&quot; : &quot;false&quot;, &quot;link&quot; : &quot;&quot;}" style="color: rgb(0, 0, 0); text-decoration-line: none; position: relative; display: block;"><img id="SEDOC-1537147332891--531886759_image_6_img" class="se_mediaImage __se_img_el" src="https://postfiles.pstatic.net/MjAxODA5MTdfMjQw/MDAxNTM3MTQ3MDk5MjU5.OPJn4DkcK0yGBLzIbYhEzt586jeI73bCakHMTBfQubYg.sBKSyWScpSfNGEmAC2VrA2nhBw4bBxOgJV5AK0WOvyYg.PNG.gngclub/7.png?type=w966" data-lazy-src="" data-width="740" data-height="576" width="740" height="576" data-attachment-id="I-HvO7mpml1OwWXi2WnhBnCnfl9k" alt="" style="border: 0px; vertical-align: top; height: auto; width: 740px; max-width: 100%;"></a></div></div></div></div><div class="se_component se_image default" style="margin-top: 5px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea se_align-center" style="position: relative; width: 886px; margin: 0px auto; text-align: center; max-width: none; font-size: 0px;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea" style="position: relative; margin-right: auto; margin-left: auto; max-width: 740px;"><a href="https://blog.naver.com/PostView.nhn?blogId=gngclub&amp;logNo=221360459758&amp;from=search&amp;redirect=Log&amp;widgetTypeCall=true&amp;topReferer=https%3A%2F%2Fsearch.naver.com%2Fsearch.naver%3Fsm%3Dtab_hty.top%26where%3Dpost%26query%3D%25EC%2584%25B8%25EB%25AC%25B4%2B%25EC%2583%2581%25EB%258B%25B4%26oquery%3D%25EC%2584%25B8%25EB%25AC%25B4%25ED%259A%258C%25EA%25B3%2584%2B%25EC%2583%2581%25EB%258B%25B4%26tqi%3DUecVowp0JywssgwC97CssssstqK-493779&amp;directAccess=false#" class="se_mediaArea __se_image_link __se_link" data-linktype="img" data-linkdata="{&quot;imgId&quot; : &quot;SEDOC-1537147332891--531886759_image_7_img&quot;, &quot;src&quot; : &quot;https://postfiles.pstatic.net/MjAxODA5MTdfMTA0/MDAxNTM3MTQ3MDk5MjUx.aBkass65X6DR5eNZOsRVjok6xii3KQYOpZMV0YLW_08g._wKGh5Dzi_VM__XbhaOWWbN1goeLs9OAfAC7I1-pzUEg.PNG.gngclub/8.png&quot;, &quot;linkUse&quot; : &quot;false&quot;, &quot;link&quot; : &quot;&quot;}" style="color: rgb(0, 0, 0); text-decoration-line: none; position: relative; display: block;"><img id="SEDOC-1537147332891--531886759_image_7_img" class="se_mediaImage __se_img_el" src="https://postfiles.pstatic.net/MjAxODA5MTdfMTA0/MDAxNTM3MTQ3MDk5MjUx.aBkass65X6DR5eNZOsRVjok6xii3KQYOpZMV0YLW_08g._wKGh5Dzi_VM__XbhaOWWbN1goeLs9OAfAC7I1-pzUEg.PNG.gngclub/8.png?type=w966" data-lazy-src="" data-width="740" data-height="576" width="740" height="576" data-attachment-id="IN0EXTyjWjOIAtb1odu0Uzji9T8U" alt="" style="border: 0px; vertical-align: top; height: auto; width: 740px; max-width: 100%;"></a></div></div></div></div><div class="se_component se_image default" style="margin-top: 5px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea se_align-center" style="position: relative; width: 886px; margin: 0px auto; text-align: center; max-width: none; font-size: 0px;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea" style="position: relative; margin-right: auto; margin-left: auto; max-width: 740px;"><a href="https://blog.naver.com/PostView.nhn?blogId=gngclub&amp;logNo=221360459758&amp;from=search&amp;redirect=Log&amp;widgetTypeCall=true&amp;topReferer=https%3A%2F%2Fsearch.naver.com%2Fsearch.naver%3Fsm%3Dtab_hty.top%26where%3Dpost%26query%3D%25EC%2584%25B8%25EB%25AC%25B4%2B%25EC%2583%2581%25EB%258B%25B4%26oquery%3D%25EC%2584%25B8%25EB%25AC%25B4%25ED%259A%258C%25EA%25B3%2584%2B%25EC%2583%2581%25EB%258B%25B4%26tqi%3DUecVowp0JywssgwC97CssssstqK-493779&amp;directAccess=false#" class="se_mediaArea __se_image_link __se_link" data-linktype="img" data-linkdata="{&quot;imgId&quot; : &quot;SEDOC-1537147332891--531886759_image_8_img&quot;, &quot;src&quot; : &quot;https://postfiles.pstatic.net/MjAxODA5MTdfNDAg/MDAxNTM3MTQ3MTAxMTMz.HUcQpOmKMXtmkwIm7hKWOpAXlCL3cGiUGUVNhzfsTW0g.YYFoKfeN4d1alCLjH0inF20Qilv6X1WRCy3SYSWcR8cg.PNG.gngclub/9.png&quot;, &quot;linkUse&quot; : &quot;false&quot;, &quot;link&quot; : &quot;&quot;}" style="color: rgb(0, 0, 0); text-decoration-line: none; position: relative; display: block;"><img id="SEDOC-1537147332891--531886759_image_8_img" class="se_mediaImage __se_img_el" src="https://postfiles.pstatic.net/MjAxODA5MTdfNDAg/MDAxNTM3MTQ3MTAxMTMz.HUcQpOmKMXtmkwIm7hKWOpAXlCL3cGiUGUVNhzfsTW0g.YYFoKfeN4d1alCLjH0inF20Qilv6X1WRCy3SYSWcR8cg.PNG.gngclub/9.png?type=w966" data-lazy-src="" data-width="740" data-height="576" width="740" height="576" data-attachment-id="IzAjIWOrqFujqi7WGMLoH3_0tHz4" alt="" style="border: 0px; vertical-align: top; height: auto; width: 740px; max-width: 100%;"></a></div></div></div></div><div class="se_component se_image default" style="margin-top: 5px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea se_align-center" style="position: relative; width: 886px; margin: 0px auto; text-align: center; max-width: none; font-size: 0px;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea" style="position: relative; margin-right: auto; margin-left: auto; max-width: 740px;"><a href="https://blog.naver.com/PostView.nhn?blogId=gngclub&amp;logNo=221360459758&amp;from=search&amp;redirect=Log&amp;widgetTypeCall=true&amp;topReferer=https%3A%2F%2Fsearch.naver.com%2Fsearch.naver%3Fsm%3Dtab_hty.top%26where%3Dpost%26query%3D%25EC%2584%25B8%25EB%25AC%25B4%2B%25EC%2583%2581%25EB%258B%25B4%26oquery%3D%25EC%2584%25B8%25EB%25AC%25B4%25ED%259A%258C%25EA%25B3%2584%2B%25EC%2583%2581%25EB%258B%25B4%26tqi%3DUecVowp0JywssgwC97CssssstqK-493779&amp;directAccess=false#" class="se_mediaArea __se_image_link __se_link" data-linktype="img" data-linkdata="{&quot;imgId&quot; : &quot;SEDOC-1537147332891--531886759_image_9_img&quot;, &quot;src&quot; : &quot;https://postfiles.pstatic.net/MjAxODA5MTdfMjEy/MDAxNTM3MTQ3MTAxMDY2.5M61PCfcpXeqCMAQ2Q6JPewsHQv7AQUxqxCk7iEb2PQg.u3O1-nfeh6Gm8TnJeB2jMhDqP43Tod4MLWiPvM-8VMgg.PNG.gngclub/10.png&quot;, &quot;linkUse&quot; : &quot;false&quot;, &quot;link&quot; : &quot;&quot;}" style="color: rgb(0, 0, 0); text-decoration-line: none; position: relative; display: block;"><img id="SEDOC-1537147332891--531886759_image_9_img" class="se_mediaImage __se_img_el" src="https://postfiles.pstatic.net/MjAxODA5MTdfMjEy/MDAxNTM3MTQ3MTAxMDY2.5M61PCfcpXeqCMAQ2Q6JPewsHQv7AQUxqxCk7iEb2PQg.u3O1-nfeh6Gm8TnJeB2jMhDqP43Tod4MLWiPvM-8VMgg.PNG.gngclub/10.png?type=w966" data-lazy-src="" data-width="740" data-height="576" width="740" height="576" data-attachment-id="ImWbx5EPp4rNyKxPOPyM6AairjNQ" alt="" style="border: 0px; vertical-align: top; height: auto; width: 740px; max-width: 100%;"></a></div></div></div></div><div class="se_component se_image default" style="margin-top: 5px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea se_align-center" style="position: relative; width: 886px; margin: 0px auto; text-align: center; max-width: none; font-size: 0px;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea" style="position: relative; margin-right: auto; margin-left: auto; max-width: 740px;"><a href="https://blog.naver.com/PostView.nhn?blogId=gngclub&amp;logNo=221360459758&amp;from=search&amp;redirect=Log&amp;widgetTypeCall=true&amp;topReferer=https%3A%2F%2Fsearch.naver.com%2Fsearch.naver%3Fsm%3Dtab_hty.top%26where%3Dpost%26query%3D%25EC%2584%25B8%25EB%25AC%25B4%2B%25EC%2583%2581%25EB%258B%25B4%26oquery%3D%25EC%2584%25B8%25EB%25AC%25B4%25ED%259A%258C%25EA%25B3%2584%2B%25EC%2583%2581%25EB%258B%25B4%26tqi%3DUecVowp0JywssgwC97CssssstqK-493779&amp;directAccess=false#" class="se_mediaArea __se_image_link __se_link" data-linktype="img" data-linkdata="{&quot;imgId&quot; : &quot;SEDOC-1537147332891--531886759_image_10_img&quot;, &quot;src&quot; : &quot;https://postfiles.pstatic.net/MjAxODA5MTdfMjMg/MDAxNTM3MTQ3MTAxOTM3.iv821DVrGJUrthdPCJ8CllscbtUDSsKv95gn9fXYzXAg.-nj_yTKQeAEmsg8y6RXJIenKnfyWH_YCPXN6hqyG9ZQg.PNG.gngclub/11.png&quot;, &quot;linkUse&quot; : &quot;false&quot;, &quot;link&quot; : &quot;&quot;}" style="color: rgb(0, 0, 0); text-decoration-line: none; position: relative; display: block;"><img id="SEDOC-1537147332891--531886759_image_10_img" class="se_mediaImage __se_img_el" src="https://postfiles.pstatic.net/MjAxODA5MTdfMjMg/MDAxNTM3MTQ3MTAxOTM3.iv821DVrGJUrthdPCJ8CllscbtUDSsKv95gn9fXYzXAg.-nj_yTKQeAEmsg8y6RXJIenKnfyWH_YCPXN6hqyG9ZQg.PNG.gngclub/11.png?type=w966" data-lazy-src="" data-width="740" data-height="576" width="740" height="576" data-attachment-id="IXmkN3rBmB28vpDhxYTPOjvNAzss" alt="" style="border: 0px; vertical-align: top; height: auto; width: 740px; max-width: 100%;"></a></div></div></div></div><div class="se_component se_paragraph default" style="margin-top: 30px; font-family: 나눔고딕, nanumgothic, se_NanumGothic, sans-serif, simhei; -webkit-font-smoothing: antialiased; word-break: normal; margin-left: 40px; margin-right: 40px; color: rgb(50, 85, 81); "><div class="se_sectionArea" style="position: relative; width: 886px; margin: 0px auto; max-width: none;"><div class="se_editArea" style="position: relative;"><div class="se_viewArea se_ff_nanumgothic se_fs_T3 se_align-left" style="position: relative; font-family: 나눔고딕, nanumgothic, se_NanumGothic, AppleSDGothicNeo, sans-serif, simhei; font-size: 16px; overflow-wrap: break-word; line-height: 1.9;"><div class="se_editView" style="position: relative;"><div class="se_textView"><p class="se_textarea" style="width: 886px; height: 400px; outline: 0px; border: none; background: 0px 0px; font-family: inherit; font-size: inherit; font-weight: inherit; line-height: inherit; color: inherit; text-align: inherit; font-style: inherit; text-decoration: inherit; resize: none; overflow-wrap: break-word; word-break: break-all;">찾아줘세무사를 이용하는 방법은 다음과 같습니다<span lang="EN-US" style="background-color: inherit;">.&nbsp;</span>우선 어플을 다운 받은 후 실행시켜 비용 없이 제공하고 있는 비교견적 요청하기를 클릭합니다<span lang="EN-US" style="background-color: inherit;">.</span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;">다음 단계는 희망하는 견적 서비스를 선택하고 간단한 질문에 답변을 하시면 됩니다<span lang="EN-US" style="background-color: inherit;">.&nbsp;</span>이후 견적을 빠르게 받아볼 수 있도록 이름 및 연락처 인증하시면 됩니다<span lang="EN-US" style="background-color: inherit;">.</span><span lang="EN-US" style="background-color: inherit;"></span><br></span><span style="background-color: inherit;"><br></span><span style="background-color: inherit;">그렇게 견<span lang="EN-US" style="background-color: inherit;">.</span>적을 제<span lang="EN-US" style="background-color: inherit;">.</span>출하고 나면 정상적으로 신청되었는지 현황보기를 통해 확인을 합니다<span lang="EN-US" style="background-color: inherit;">.&nbsp;</span>그때부터 세<span lang="EN-US" style="background-color: inherit;">.</span>무<span lang="EN-US" style="background-color: inherit;">.</span>사들의 입찰이 시작되는데 상세 정보와 견적비용을 직접 비교해보고 장부작성을 맡길 분을 선택하면 됩니다<span lang="EN-US" style="background-color: inherit;">.</span><br><span lang="EN-US" style="background-color: inherit;">&nbsp;</span><br>원활한 사업 운영을 위해 세<span lang="EN-US" style="background-color: inherit;">.</span>무<span lang="EN-US" style="background-color: inherit;">.</span>사에게 세무상담을 받은 후 기<span lang="EN-US" style="background-color: inherit;">.</span>장을 맡겨 세금신고를 해왔지만 제대로 관리되지 못해 원하는 수준의 절세를 하지 못하는 분들이 계실 겁니다<span lang="EN-US" style="background-color: inherit;">.&nbsp;</span>그럴 때에는 찾아줘세무사로 부터 합리적인 기장료와 더불어 꼼꼼한 장부작성을 통해 조금씩 세어 나가는 지출을 잡아 현명한 사업가로 거듭나셨으면 합니다<span lang="EN-US" style="background-color: inherit;">.</span></span></p><div class="autosourcing-stub-extra" style="zoom: 1; opacity: 1;"><p style="margin-top: 11px; margin-bottom: 7px; font-size: 12px; font-family: Dotum;"><span style="font-weight: 600; padding: 0px 7px 0px 0px;">[출처]</span>&nbsp;<a href="https://blog.naver.com/gngclub/221360459758" target="_blank" style="color: rgb(96, 140, 186) !important;">세무상담 어렵게 느껴졌다면</a><span style="background-color: inherit; padding: 0px 7px 0px 5px;">|</span><span style="font-weight: 600; padding: 0px 7px 0px 0px;">작성자</span>&nbsp;<a href="https://blog.naver.com/gngclub" target="_blank" style="color: rgb(96, 140, 186) !important;">쑤기</a></p></div><p></p></div></div></div></div></div></div>
								</textarea>
						</div>
					</div>
					<div class="row">
						<div class="col" style="text-align: right;">
							<input class="btn btn-primary btn-sm" type="button" value="등록"
								id="savebutton">
						</div>
						<button type="button" class="btn btn-outline-info btn-sm"
							onclick="history.go(-1);">뒤로가기</button>
					</div>
				</form>
			</div>
		</div>
		<!-- /.row -->
	</div>
</body>
</html>