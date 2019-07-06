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
	//추가 : 사진 이름 표시
	$("#sh_profile").on("change", function(){
		var strFile = $("#sh_profile").val();
		var lastIndex = strFile.lastIndexOf('\\');
		var strFileName = strFile.substring(lastIndex + 1, strFile.length);
		$("#sh_profile_name").val(strFileName);
	});
	
	//구성원 수정
	$(".sh_update").each(function(i){
		$("#sh_update"+i).on("click", function(){
			var member = new Object();
			member.member_no = $("#sh_member_no"+i).val();
			member.member_name = $("#sh_member_name"+i).val();
			member.qualification = $("#sh_qualification"+i).val();
			member.business_field = $("#sh_business_field"+i).val();
			member.member_grade = $("#sh_member_grade"+i).val();
			
			$.ajax({
				url: "memberUpdate.do",
				type: "post",
				data: JSON.stringify(member),
				contentType: "application/json; charset=utf-8",
				success: function(result){
					if(result == 1){
						alert("수정되었습니다.");
					}
				}
			});
		});
	});	
	//구성원 삭제
	$(".sh_delete").each(function(i){
		$("#sh_delete"+i).on("click", function(){
			var message = confirm("정말 삭제하시겠습니까?");
			if(message == true){
				var member = new Object();
				member.member_no = $("#sh_member_no"+i).val();
				
				$.ajax({
					url: "memberDelete.do",
					type: "post",
					data: JSON.stringify(member),
					contentType: "application/json; charset=utf-8",
					success: function(result){
						if(result == 1){
							alert("삭제되었습니다.");
							$("#sh_tableline"+i).css("display", "none");
						}
					}
				});
			}
		});
	});
	
	$("#sh_insertbtn").on("click", function(){
		if($('input[name=member_name]').val() == ""){
			alert("이름을 입력하세요");
			$('input[name=member_name]').focus();
		}
		else if($('input[name=qualification]').val() == ""){
			alert("자격을 입력하세요");
			$('input[name=qualification]').focus();
		}
		
		else if($('input[name=business_field]').val() == ""){
			alert("업무분야를 입력하세요");
			$('input[name=business_field]').focus();
		}
		
		else if($('input[name=member_grade]').val() == ""){
			alert("등급을 입력하세요");
			$('input[name=member_grade]').focus();
		}
		
		else{
			$("#sh_updatemember_form").submit();
		}
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

#sh_table input[type=text], #sh_table input[type=number]{
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

#sh_modal_table input[type=text], #sh_modal_table input[type=number]{
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
					<form id="sh_updatemember_form" action="memberInsert.do" method="post" enctype="multipart/form-data">
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
							  				<input type="file" id="sh_profile" name="sh_profile" accept="image/*" style="display:none">
							  				<input type="text" id="sh_profile_name">
										</div>	
										<table class="table" id="sh_modal_table">
											<thead>
												<tr>
													<th>이름</th>
													<th>자격</th>
													<th>업무분야</th>
													<th>등급[낮을수록 상위에 위치]</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><b>
														<input type="text" name="member_name">
													</td>						
													<td>
														<input type="text" name="qualification">
													</td>
													<td>
														<input type="text" name="business_field">
													</td>
													<td>
														<input type="number" name="member_grade">
													</td>
												</tr>
											</tbody>
										</table>																			
									</div>

									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="button" id="sh_insertbtn" class="btn btn-secondary">추가</button>
									</div>
								</div>
							</div>
						</div>
					</form>
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
						<th width="10%;">등급</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${member }" var="member" varStatus="status">	
				<c:set var="index" value="${status.index }" />
				<input type="hidden" id="sh_member_no${index }" value="${member.member_no }">
					<tr id="sh_tableline${index }">
						<td>
							<img src="${pageContext.request.contextPath }/files/introduceMember/${member.member_picture }">
						</td>
						<td><b>
							<input type="text" id="sh_member_name${index }" value="${member.member_name }"></b>
						</td>						
						<td>
							<input type="text" id="sh_qualification${index }" value="${member.qualification }">
						</td>
						<td>
							<input type="text" id="sh_business_field${index }" value="${member.business_field }">
						</td>
						<td>
							<input type="number" id="sh_member_grade${index }" value="${member.member_grade }">
						</td>						
						<td id="sh_buttonline" class="sh_buttonline">
							<button class="sh_update" id="sh_update${index }">수정</button> 
							<button class="sh_delete" id="sh_delete${index }">삭제</button>
						</td>							
					</tr>
				</c:forEach>
				</tbody>				
			</table>
		</div>
	</div>
</div>
<br><br><br><br>
<c:import url="../common/footer.jsp" />
</body>
</html>