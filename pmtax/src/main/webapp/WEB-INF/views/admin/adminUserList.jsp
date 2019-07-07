<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	
	/* 날짜검사 */
	 var kdate = new Date(Date.now()- (new Date().getTimezoneOffset() * 60000)).toISOString().slice(0,10);
	 
	$("#jw_endDate").change(function(){
		if($("#jw_startDate").val() > $("#jw_endDate").val()){
			$("#jw_startDate").val("");
		}
		if($("#jw_endDate").val() == ""){
			$("#jw_startDate").attr("max",kdate);
		}else{
			$("#jw_startDate").attr("max",$("#jw_endDate").val());
		}
	});
	$("#jw_startDate").attr("max",kdate);
	$("#jw_endDate").attr("max",kdate);
	
	/* 드랍 명칭바꾸기 */
	$("input[name=userstatus]").change(function(){
		if($("#jw_statusOn").prop("checked")){
			$("#jw_statusHeader").html("이용중");
			
			if(${page.userstatus eq '이용중'}){
				$("#jw_totalcount").show();
			}else{
				$("#jw_totalcount").hide();
			}
		}else{
			$("#jw_statusHeader").html("탈퇴");
			
			if(${page.userstatus eq '탈퇴'}){
				$("#jw_totalcount").show();
			}else{
				$("#jw_totalcount").hide();
			}
		}
	});
	
	/* 회원상태수정 */
	<c:forEach var="list" items="${list}">
	$("#jw_userupBtn${list.user_no}").click(function(){
		$("#jw_userupform${list.user_no}").submit();
	});
	</c:forEach>
});
</script>
<style>
.table-hover-gray tbody tr:hover td{
 background:rgb(250,250,250);
}
.table-hover-gray thead{
font-size:17px;
color:#888;
}
.jw_card-active{
background:#bbb;
border: 1px #bbb;
border-radius: 5px;
color: white;
font-weight:bold;
}
.cursor-pointer{
cursor:pointer;
}
.jw_bg-info{
  background-image: linear-gradient(to right, white, #5bc0de, #5bc0de, #5bc0de , white);
}
.jw_card:hover{
background:#bbb;
border: 1px #bbb;
}
.jw_card:hover div{
font-weight:bold;
color:white;
}
input[name=userstatus]:checked + label{
background:#17a2b8;
color:white;
font-weight:bold;
}
input[name=userstatus]:hover + label{
background:#17a2b8;
color:white;
font-weight:bold;
cursor:pointer;
}
.jw_pd{
padding: 5px;
}
.fa-size{
font-size:17px;
}
th, td{
 white-space: nowrap;
}
input[type=date]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    display: none;
}
input[type=number]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    display: none;
}
</style>
</head>
<body>

<c:import url="../common/header.jsp" />

<!-- 탈퇴 모달 -->
<c:forEach var="list" items="${list}">
<form id="jw_userupform${list.user_no }" action="adminuserupdate.do" method="post">
<div class="modal fade" id="jw_userdelAlert${list.user_no }"><div class="modal-dialog pt-5"><div class="modal-content shadow-lg">
     <div class="modal-header border-0">
       <h4 class="modal-title">회원탈퇴</h4> <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
       강제 탈퇴하시겠습니까?
       <input type="hidden" name="user_no" value="${list.user_no }">
     </div>
     <div class="modal-footer border-0">
     	<button type="submit" id="jw_userupBtn${list.user_no }" class="btn btn-info w-50" data-dismiss="modal">확인</button>
       	<button type="button" class="btn btn-secondary w-50" data-dismiss="modal">취소</button>
     </div>
</div></div></div>
</form>
</c:forEach>

<!-- 상세 모달 -->
<c:forEach var="list" items="${list}">
<div class="modal fade" id="jw_userModal${list.user_no }"><div class="modal-dialog modal-lg"><div class="modal-content shadow-lg">
     <div class="modal-header">
       <h4 class="modal-title pl-1">회원정보 조회</h4> <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
     <div class="modal-body"><div class="row px-4">
     	<div class="col-12 text-right p-1 my-1"><b>가입일</b> : ${list.join_date }</div>
     	<div class="col-12 col-md-3 col-lg-2 alert alert-info text-center p-1"><strong>아이디</strong></div>
     	<div class="col-12 col-md-9 col-lg-4 text-center text-sm-left p-1 px-3">${list.user_id }</div>
     	<div class="col-12 col-md-3 col-lg-2 alert alert-info text-center p-1"><strong>이름</strong></div>
     	<div class="col-12 col-md-9 col-lg-4 text-center text-sm-left p-1 px-3">${list.user_name }</div>
     	<div class="col-12 col-md-3 col-lg-2 alert alert-info text-center p-1"><strong>생년월일</strong></div>
     	<div class="col-12 col-md-9 col-lg-4 text-center text-sm-left p-1 px-3">${list.birth }</div>
     	<div class="col-12 col-md-3 col-lg-2 alert alert-info text-center p-1"><strong>성별</strong></div>
     	<div class="col-12 col-md-9 col-lg-4 text-center text-sm-left p-1 px-3">${list.gender }</div>
     	<div class="col-12 col-md-3 col-lg-2 alert alert-info text-center p-1"><strong>이메일</strong></div>
     	<div class="col-12 col-md-9 col-lg-10 text-center text-sm-left p-1 px-3">${list.user_email }</div>
     	<div class="col-12 col-md-3 col-lg-2 alert alert-info text-center p-1"><strong>전화번호</strong></div>
     	<div class="col-12 col-md-9 col-lg-4 text-center text-sm-left p-1 px-3">${list.phone }</div>
     	<div class="col-12 col-md-3 col-lg-2 alert alert-info text-center p-1"><strong>휴대폰</strong></div>
     	<div class="col-12 col-md-9 col-lg-4 text-center text-sm-left p-1 px-3">${list.cellphone }</div>
     	<div class="col-12 col-md-3 col-lg-2 alert alert-info text-center p-1"><strong>주소</strong></div>
     	<div class="col-12 col-md-9 col-lg-10 text-center text-sm-left p-1 px-3">${list.address } ${list.address_datail }</div>
     </div></div>
</div></div></div>
</c:forEach>

<div class="container mb-5">
	<div class="bg-white shadow-sm border rounded-lg text-center p-3 mt-5 pl-5 pr-5">
		<h4 class="text-left">가감세무법인 관리자</h4><hr>
		<div class="row justify-content-between">
			<div class="col-12 col-lg-2 col-md-5 jw_card jw_card-active cursor-pointer my-1"><a class="text-decoration-none text-white" href="adminuser.do"><div class="card-body">회원관리</div></a></div>
			<div class="col-12 col-lg-2 col-md-5 jw_card card cursor-pointer my-1"><a class="text-decoration-none text-dark" href="adminque.do"><div class="card-body">1대1문의</div></a></div>
			<div class="col-12 col-lg-2 col-md-5 jw_card card cursor-pointer my-1"><a class="text-decoration-none text-dark" href="adminIntroduceMember.do"><div class="card-body">구성원</div></a></div>
			<div class="col-12 col-lg-2 col-md-5 jw_card card cursor-pointer my-1"><a class="text-decoration-none text-dark" href="taxinfoList.do"><div class="card-body">세무정보</div></a></div>
		</div>
	</div>
	<form>
	<div class="row bg-white shadow-sm border rounded-lg mt-5 px-1 px-sm-3 py-3">
		<div class="col-12"><h4><a class="text-decoration-none text-dark" href="adminuser.do">회원관리</a> 
			<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
				<b id="jw_statusHeader"><c:if test="${page.userstatus eq '이용중'}">이용중</c:if><c:if test="${page.userstatus eq '탈퇴'}">탈퇴</c:if></b> <span id="jw_totalcount" class="badge badge-light ml-1">${count }</span></button>
			<div class="dropdown-menu">
				<input type="radio" id="jw_statusOn" name="userstatus" value="이용중" style="display:none;" <c:if test="${page.userstatus eq '이용중'}">checked</c:if>><label for="jw_statusOn" class="dropdown-item">이용중</label>
				<input type="radio" id="jw_statusOff" name="userstatus" value="탈퇴" style="display:none;" <c:if test="${page.userstatus eq '탈퇴'}">checked</c:if>><label for="jw_statusOff" class="dropdown-item">탈퇴</label>
			</div>
			<button type="reset" class="btn btn-outline-info float-right ml-2">Reset</button><button type="sumbit" class="btn btn-outline-secondary float-right">Search</button></h4><hr>
			<div class="form-inline">
				<div class="mt-3">아이디  <input type="text" name="searchid" class="form-control ml-2 mr-5"></div>
				<div class="mt-3"> 휴대폰  <input type="number" name="searchphone" class="form-control ml-2 mr-5"></div>
				<div class="mt-3 form-inline">가입날짜 <span class="input-group"><input type="date" name="startdate" id="jw_startDate" class="form-control mx-2"> ~ <input type="date" name="enddate" id="jw_endDate" class="form-control ml-2"></span></div>
				<input type="hidden" name="page" value="2">
			</div>
		</div>
	</div>
	</form>
	<div class="row bg-white shadow-sm border rounded-lg mt-3">
		<div class="col-12">
			<div class="col-12 table-responsive-lg pt-2">
				<table class="table table-hover-gray text-center" >
				    <thead class="table-borderless">
				      <tr>
					    <th style="width:15%;">번호</th>
				        <th style="width:20%;">아이디</th>
				        <th style="width:20%;">휴대폰</th>
				        <th style="width:20%;">가입날짜</th>
				        <th style="width:10%;">상세</th>
				        <th style="width:15%;">탈퇴</th>
				      </tr>
				    </thead>
				    <tbody>
				    <c:if test="${empty list}">
				    <tr>
				      	<th colspan="7" class="text-center py-5"><h4>회원 목록이 없습니다</h4></th>
				    </tr>
				    </c:if>
				     <c:forEach var="list" items="${list}">
				      <tr>
			      		<td>${list.user_no }</td>
				        <td>${list.user_id }</td>
				        <td>${list.cellphone} </td>
				        <td>${list.join_date} </td>
				        <td><button type="button" class="badge badge-pill btn btn-secondary jw_pd" data-toggle="modal" data-target="#jw_userModal${list.user_no }" data-backdrop="false"><i class="far fa-list-alt fa-size"></i></button></td>
				        <td>
				        	<c:if test="${list.user_status eq '이용중'}"><button type="button" id="jw_userdel1" class="badge btn btn-secondary p-2" data-toggle="modal" data-target="#jw_userdelAlert${list.user_no }" data-backdrop="false">강제탈퇴</button></c:if>
				        	<c:if test="${list.user_status eq '탈퇴'}"><span class="badge badge-light p-2">탈퇴회원</span></c:if>
				        </td>
				      </tr>
				      </c:forEach>
				    </tbody>
				  </table>
			</div>
			<div class="col-12 my-4 d-flex justify-content-end">
				<button type="button" class="btn btn-outline-secondary mr-2" disabled>이전</button>
				<button type="button" class="btn btn-outline-secondary mr-2 active">1</button>
				<button type="button" class="btn btn-outline-secondary mr-2">2</button>
				<button type="button" class="btn btn-outline-secondary">다음</button>
			</div>
		</div>
	</div>
</div>

<c:import url="../common/footer.jsp" />

</body>
</html>