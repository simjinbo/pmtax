<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<title>가감세무법인</title>

<script type="text/javascript"> 
$(function(){
	$("#sh_profile").on("change", function(){
		var strFile = $("#sh_profile").val();
		var lastIndex = strFile.lastIndexOf('\\');
		var strFileName = strFile.substring(lastIndex + 1, strFile.length);
		$("#sh_profile_name").val(strFileName);
	});
	
});

</script>

<style type="text/css">
/* 본명조 */
@font-face { 
font-family: 'NotoSerifKR';
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NotoSerifKR.woff') format('woff'); 
font-weight: normal; 
font-style: normal; 
}

#sh_introduceMember_title {
	font-size:20pt;
	font-family:NotoSerifKR;
}

#sh_add {
	cursor:pointer;
	font-size:10pt;
	font-family:none;	
	border-radius:4px;
	background-color:black;	
	padding:8px 8px;
	width:100px;
	color:white;
	border: 1px solid black;
}

#sh_table th {
	text-align:center;
}

#sh_table td {
	vertical-align:middle;
	text-align:center;
	font-family: 'NotoSerifKR';
}

#sh_table img {
	width:100%;
	height:auto;
	float:left;
}

#sh_table input[type=text]{
	width:100%;
}

.sh_update {
	font-family:none;	
	border-radius:4px;
	background-color:black;	
	color:white;
	border: 1px solid black;
}

.sh_delete {
	font-family:none;	
	border-radius:4px;
	background-color:red;	
	color:white;
	border: 1px solid red;
}

#sh_modal_table {
	font-size:10pt;
	text-align:center;
}

#sh_modal_table input[type=text]{
	width:100%;
}

#sh_addModal .modal-body label{
	font-size:12pt;
	font-family:none;
	padding: 8px;
	background-color:black;	
	color:white;
	border: 1px solid black;	
}
</style>
</head>
<body>
<c:import url="../common/header.jsp" />
<br><br>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="row" id="sh_introduceMember_title"><!-- title -->
				<div class="col-md-12">
					구성원 소개 &nbsp;
					<a data-toggle="modal" data-target="#sh_addModal" id="sh_add">추가하기</a>
						<!-- The Modal -->
						<div class="modal fade" id="sh_addModal">
							<div class="modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">구성원 추가하기</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>

									<!-- Modal body -->
									<div class="modal-body">
										<div class="custom-file">
							  				<label for="sh_profile">사진 추가<i class="far fa-copy"></i></label>
							  				<input type="file" id="sh_profile" accept="image/*" style="display:none">
							  				<input type="text" id="sh_profile_name">
										</div>	
										<table class="table" id="sh_modal_table">
											<thead>
												<tr>
													<th>이름</th>
													<th>자격</th>
													<th>업무분야</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><b>
														<input type="text" value="김가감">
													</td>						
													<td>
														<input type="text" value="세무사">
													</td>
													<td>
														<input type="text" value="세무조사 및 조세쟁송">
													</td>
												</tr>
											</tbody>
										</table>																			
									</div>

									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="button" id="sh_rrinsert_btn" class="btn btn-secondary" data-dismiss="modal">추가</button>
									</div>
								</div>
							</div>
						</div>
				</div>
			</div><!-- title -->
			<br>		
			<table class="table" id="sh_table">
				<thead>
					<tr>
						<th width="15%;"></th>
						<th>이름</th>
						<th>자격</th>
						<th>업무분야</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<img src="${pageContext.request.contextPath }/files/introduceMember/sample.jpg">
						</td>
						<td><b>
							<input type="text" value="김가감">
						</td>						
						<td>
							<input type="text" value="세무사">
						</td>
						<td>
							<input type="text" value="세무조사 및 조세쟁송">
						</td>
						<td id="sh_buttonline">
							<button class="sh_update">수정</button> 
							<button class="sh_delete">삭제</button>
						</td>						
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<br><br><br><br>
<c:import url="../common/footer.jsp" />
</body>
</html>