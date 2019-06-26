<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
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
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<title>회계사무소</title>

<script type="text/javascript"> 
$(function(){
	$('#sh_selectEmail').change(function(){ //이메일 입력방식 선택 
		$("#sh_selectEmail option:selected").each(function () {
			if($(this).val()== '1'){ //직접입력일 경우 
				$("#sh_email02").val(''); //값 초기화 
				$("#sh_email02").attr("readonly", false); //활성화 
			}else{ //직접입력이 아닐경우 
				$("#sh_email02").val($(this).text()); //선택값 입력 
				$("#sh_email02").attr("readonly", true); //비활성화 
			} 
		}); 
	}); 	
});
</script>

<style type="text/css">
#sh_inquiry .col-md-2 {
	background-color:#4d94ff;
	color:white;
	padding:5px;
	text-align:center;
	border-radius:5px;
}

#sh_inquiry .col-md-10 {
	padding:5px;
}

.sh_star {
	color:red;
}

#sh_inquiry input[type=text], input[type=tel] {
	width:30%;
	border:1px solid grey;
	border-radius:5px;
}

#sh_inquiry_title {
	font-size:20pt;
	color:#0066ff;
}

#sh_selectEmail {
	width:100px;
	margin-right:10px;
	border:1px solid grey;
	border-radius:5px;
}

#sh_inquiry_textarea {
	width:100%;
	resize: none;
	overflow-x:hidden;
	overflow-y:auto;
	border:1px solid grey;
	border-radius:5px;
}

#sh_agree_textarea {
	width:100%;
	resize: none;
	font-size: 12px;
	border:1px solid white;
}

#sh_submit {
	border-radius:4px;
	background-color:#0066ff;	
	padding:8px 8px;
	width:100px;
	color:white;
	border: 1px solid #0066ff;
	font-size:12pt;
}

</style>
</head>
<body>

<div class="container">
	<div class="row" id="sh_inquiry">
		<div class="col-md-12">
			<div class="row" id="sh_inquiry_title"><!-- title -->
				<div class="col-md-12">
					1:1 문의
				</div>
			</div><!-- title -->
			<hr>
			<div class="row"><!-- 이름 -->
				<div class="col-md-2 my-auto">
					<span class="sh_star">*</span>
					이름
				</div>
				<div class="col-md-10">
					<input type="text" name="name">
				</div>
			</div><!-- 이름 -->
			
			<div class="row"><!-- 이메일 -->
				<div class="col-md-2 my-auto">
					<span class="sh_star">*</span>
					이메일
				</div>
				<div class="col-md-10">
					<input type="text" id="sh_email01"> @ 
					<input type="text" id="sh_email02" readonly> 
					<select id="sh_selectEmail">
						<option value="1">직접입력</option> 
						<option value="naver.com">naver.com</option> 
						<option value="gmail.com">gmail.com</option> 
						<option value="daum.net">daum.net</option> 
						<option value="nate.com">nate.com</option> 
					</select>
					<input type="hidden" name="email">
				</div>
			</div><!-- 이메일 -->
			
			<div class="row"><!-- 휴대폰 -->
				<div class="col-md-2 my-auto">
					<span class="sh_star">*</span>
					휴대폰 
				</div>
				<div class="col-md-10">
					<input type="tel" name="phone">
				</div>
			</div><!-- 휴대폰 -->
			
			<div class="row"><!-- 전화 -->
				<div class="col-md-2 my-auto">
					전화
				</div>
				<div class="col-md-10">
					<input type="tel" name="tell">
				</div>
			</div><!-- 전화 -->
			
			<div class="row"><!-- 문의사항 -->
				<div class="col-md-2">
					문의사항
				</div>
				<div class="col-md-10">
					<textarea rows="15" cols="30" id="sh_inquiry_textarea" name="content">
					
					</textarea>
				</div>
			</div><!-- 문의사항 -->
			<br>
			<div class="row" id="sh_agree"><!-- 개인정보동의 및 제출 -->
				<div class="col-md-12">
					<textarea rows="15" cols="30" id="sh_agree_textarea" readonly>
※ 개인정보 수집 및 이용에 관한 안내 

본 사이트는 1대1문의를 이용하는 기업 및 개인을 대상으로 아래와 같이 개인정보를 수집하고 있습니다. 

1. 수집 개인정보 항목 : 이름, 이메일, 전화번호  

2. 개인정보의 수집 및 이용목적 : 문의내용에 대한 확인 및 신속하고 정확한 상담(오류해결 등), 고객불만 발생시 해결 

3. 개인정보의 이용기간 : 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기하며, 이 외의 다른 목적으로 사용되지 않습니다.
 
4. 동의를 거부할 권리가 있다는 사실과 동의 거부에 따른 불이익 내용 : 필수로 수집하는 개인정보에 대해 동의를 거부할 권리가 있으며 필수항목에 대한 동의 거부 시 서비스가 제한됩니다.
 
5. 그 밖의 사항은 개인정보취급방침을 준수합니다.  
					</textarea> 
				</div>
				<div class="col-md-12" align="center"><br>
					<div class="custom-control custom-checkbox">
					  <input type="checkbox" class="custom-control-input" id="customCheck1">
					  <label class="custom-control-label" for="customCheck1">개인정보 수집 및 이용에 대해 동의합니다.</label>
					</div>				    
				  <br>
					<div align="center">
					  <input type="button" id="sh_submit" value="등록">
					</div>
				</div>				
			</div><!-- 개인정보동의 및 제출 -->
		</div>
	</div>
</div>

</body>
</html>