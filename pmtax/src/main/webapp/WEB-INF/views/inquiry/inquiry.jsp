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
	//이메일
	$("#sh_email02").attr("readonly", false);
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
	
	//휴대폰
    $("#sh_phone").on('keydown', function(e){
       // 숫자만 입력받기
        var trans_num = $(this).val().replace(/-/gi,'');
		var k = e.keyCode;
				
		if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) )){
  	    e.preventDefault();
		}
    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
        if($(this).val() == '') return;

        // 기존 번호에서 - 를 삭제합니다.
        var trans_num = $(this).val().replace(/-/gi,'');
      
        // 입력값이 있을때만 실행합니다.
        if(trans_num != null && trans_num != ''){
            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
            if(trans_num.length==11 || trans_num.length==10){   
                // 유효성 체크
                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
                if(regExp_ctn.test(trans_num)){
                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
                    $(this).val(trans_num);
                }else{
        			$("#sh_required").css("display", "block");
        			$('#sh_required_text').text("유효하지 않은 전화번호입니다.");
        			
        			var offset = $('#sh_inquiry_title').offset();
        			$("html, body").animate({scrollTop:offset.top},500);
                    $(this).val("");
                    $(this).focus();
                }
            }else{
    			$("#sh_required").css("display", "block");
    			$('#sh_required_text').text("유효하지 않은 전화번호입니다.");
    			
    			var offset = $('#sh_inquiry_title').offset();
    			$("html, body").animate({scrollTop:offset.top},500);
                $(this).val("");
                $(this).focus();
            }
      	}
  }); 
	
	//전화
    $("#sh_tell").on('keydown', function(e){
       // 숫자만 입력받기
        var trans_num = $(this).val().replace(/-/gi,'');
		var k = e.keyCode;
				
		if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) )){
  	    e.preventDefault();
		}
    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
        if($(this).val() == '') return;

        // 기존 번호에서 - 를 삭제합니다.
        var trans_num = $(this).val().replace(/-/gi,'');
      
        // 입력값이 있을때만 실행합니다.
        if(trans_num != null && trans_num != ''){
            // 총 핸드폰 자리수는 11 ~ 9자여야 합니다.
            if(trans_num.length==11 || trans_num.length==10 || trans_num.length==9){   
                // 유효성 체크
                var regExp_ctn = /^([0-9]{2,3})([0-9]{3,4})([0-9]{4})$/;
                if(regExp_ctn.test(trans_num)){
                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
                    trans_num = trans_num.replace(/^([0-9]{2,3})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
                    $(this).val(trans_num);
                }else{
        			$("#sh_required").css("display", "block");
        			$('#sh_required_text').text("유효하지 않은 전화번호입니다.");
        			
        			var offset = $('#sh_inquiry_title').offset();
        			$("html, body").animate({scrollTop:offset.top},500);
                    $(this).val("");
                    $(this).focus();
                }
            }else{
    			$("#sh_required").css("display", "block");
    			$('#sh_required_text').text("유효하지 않은 전화번호입니다.");
    			
    			var offset = $('#sh_inquiry_title').offset();
    			$("html, body").animate({scrollTop:offset.top},500);
                $(this).val("");
                $(this).focus();
            }
      	}
  });  	
	
	//required
	//close
	$("#sh_required_close").click(function(){
		$("#sh_required").css("display", "none");
	});
	
	$(document).on("keypress keydown keyup", function(){
		$("#sh_required").css("display", "none");
	});
	
	$("#sh_submit").on("click", function(){
		console.log("click");
		//이름
		if($('#sh_name').val() == ""){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("이름을 입력하셔야합니다.");
			
			var offset = $('#sh_inquiry_title').offset();
			$("html, body").animate({scrollTop:offset.top},500);
			$("#sh_name").focus();
		}
		
		//이메일
		else if($('#sh_email01').val() == ""){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("이메일 형식에 맞게 입력해주세요.");
			
			var offset = $('#sh_inquiry_title').offset();
			$("html, body").animate({scrollTop:offset.top},500);
			$("#sh_email01").focus();
			
		}
		
		else if($('#sh_email02').val() == ""){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("이메일 형식에 맞게 입력해주세요.");
			
			var offset = $('#sh_inquiry_title').offset();
			$("html, body").animate({scrollTop:offset.top},500);
			$("#sh_email02").focus();
			
		}	
		
		//휴대폰
		else if($('input[name=phone]').val() == ""){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("휴대폰 번호를 입력하셔야합니다.");
			
			var offset = $('#sh_inquiry_title').offset();
			$("html, body").animate({scrollTop:offset.top},500);
			$("input[name=phone]").focus();
		}
		
		//checkbox
		else if($("#customCheck1").is(":checked") == false){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("개인정보 수집 및 이용에 대해 동의하셔야만 등록이 가능합니다.");
		}
		
		else {
			//이메일 합치기
			var email1 = $("#sh_email01").val();
			var email2 = $("#sh_email02").val();
			$("input[name=email]").val(email1 + "@" + email2);
			
 			//상세설명 <br>로 변환
			var str = $("#sh_inquiry_textarea").val();
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			$("#sh_inquiry_textarea").val(str);
			
			$("#sh_inquiry_form").submit();
			alert("1:1문의 등록에 성공하였습니다.");
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

#sh_required {
	display: none;
	position: fixed;
	z-index: 3;
	color: white;
	background-color: black;
	border-color: #bee5eb;
	border-radius: 5px;
	margin-left: 55%;
    margin-right: 3%;
    padding: 15px;
}

#sh_required_close {
	float: right;
	cursor: pointer;
}

#sh_inquiry .col-md-2 {
	background-color:white;
	color:black;
	border:1px solid black;
	padding:5px;
	text-align:center;
	border-radius:5px;
	font-size:10pt;
	font-family: 'NotoSerifKR';
}

#sh_inquiry .col-md-10 {
	padding:5px;
}

.sh_star {
	color:red;
}


#sh_name, #sh_email01, #sh_phone, #sh_tell {
	width:100%;
	border:1px solid #f2f2f2;
	border-radius:5px;
}

#sh_email02 {
	width:100px;
	border:1px solid #f2f2f2;
	border-radius:5px;
}

#sh_selectEmail {
	width:100px;
	border:1px solid #f2f2f2;
	border-radius:5px;
}

@media screen and (min-width: 800px) {
	#sh_name, #sh_email01, #sh_email02, #sh_phone, #sh_tell {
	width:30%;
	}
}

#sh_inquiry_title {
	font-size:20pt;
	font-family:NotoSerifKR;
}


#sh_inquiry_textarea {
	width:100%;
	resize: none;
	overflow-x:hidden;
	overflow-y:auto;
	border:1px solid #f2f2f2;
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
	background-color:black;	
	padding:8px 8px;
	width:100px;
	color:white;
	border: 1px solid black;
	font-size:12pt;
}

</style>
</head>
<body>
<c:import url="../common/header.jsp" />
<br><br>
<div class="container" style="width:80%;">
 	<div id="sh_required"><!-- required alert -->
   		<strong>필수!</strong> <span id="sh_required_text"></span>&nbsp;&nbsp;&nbsp;
   		<span id="sh_required_close"><i class="fas fa-times"></i></span>
	</div><!-- required alert -->

	<form id="sh_inquiry_form" action="inquiryinsert.do" method="post">
	<%-- <input type="hidden" name="user_no" value="${loginUser.user_no}"> --%>
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
					<input type="text" id="sh_name" name="name">
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
					<input type="text" id="sh_phone" name="phone">
				</div>
			</div><!-- 휴대폰 -->
			
			<div class="row"><!-- 전화 -->
				<div class="col-md-2 my-auto">
					전화
				</div>
				<div class="col-md-10">
					<input type="text" id="sh_tell" name="tell">
				</div>
			</div><!-- 전화 -->
			
			<div class="row"><!-- 문의사항 -->
				<div class="col-md-2" style="margin: 3.4px 0px;">
					문의사항
				</div>
				<div class="col-md-10">
					<textarea rows="15" cols="30" id="sh_inquiry_textarea" name="content"></textarea>
				</div>
			</div><!-- 문의사항 -->
			<br>
			<div class="row" id="sh_agree"><!-- 개인정보동의 및 제출 -->
				<div class="col-md-12">
					<textarea rows="17" cols="30" id="sh_agree_textarea" readonly>
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
	</form>
</div>

<br><br><br><br>
<c:import url="../common/footer.jsp" />
</body>
</html>