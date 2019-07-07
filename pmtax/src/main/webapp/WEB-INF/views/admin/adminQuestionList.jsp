<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	/* 체크박스 모두 선택 */
	$("#jw_allCheck").click(function(){
		if($("#jw_allCheck").prop("checked")){
            $("input[name=delCheck]").prop("checked",true);
        }else{
            $("input[name=delCheck]").prop("checked",false);
        }
	});
	
	/* 1대1문의 선택 삭제 */
	$("#jw_quedelBtn").click(function(){
		if( $("input[name=delCheck]").is(":checked") == true){
			$("#jw_quedelform").submit();
		}
	});
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
.custom-checkbox .custom-control-input:checked ~ .custom-control-label::before {
  background-color: #5bc0de !important;
}
.custom-checkbox .custom-control-input:checked:focus ~ .custom-control-label::before {
  box-shadow: 0 0 0 1px #fff, 0 0 0 0.2rem #5bc0de
}
.custom-checkbox .custom-control-input:focus ~ .custom-control-label::before {
  box-shadow: 0 0 0 1px #fff, 0 0 0 0.2rem #5bc0de
}
.jw_card:hover{
background:#bbb;
border: 1px #bbb;
}
.jw_card:hover div{
font-weight:bold;
color:white;
}
.jw_content{
word-break:break-all;
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

<!-- 삭제 모달 -->
<div class="modal fade" id="jw_quedelAlert"><div class="modal-dialog pt-5"><div class="modal-content shadow-lg">
     <div class="modal-header border-0">
       <h4 class="modal-title">1대1문의 삭제</h4> <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
     <div class="modal-body">
       1대1문의 게시글을 삭제하시겠습니까?
     </div>
     <div class="modal-footer border-0">
     	<button type="button" id="jw_quedelBtn" class="btn btn-info w-50" data-dismiss="modal">확인</button>
       	<button type="button" class="btn btn-secondary w-50" data-dismiss="modal">취소</button>
     </div>
</div></div></div>

<!-- 상세 모달 -->
<c:forEach var="list" items="${list}">
<div class="modal fade" id="jw_queModal${list.inquiry_no }"><div class="modal-dialog modal-lg"><div class="modal-content shadow-lg">
     <div class="modal-header">
       <h4 class="modal-title pl-1">1대1문의 조회</h4> <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
     <div class="modal-body"><div class="row px-4">
       <div class="col-12 text-right p-1 my-1"><b>문의날짜</b> : ${list.inquiry_date}</div>
     	<div class="col-12 col-md-3 col-lg-2 alert alert-info text-center p-1"><strong>이름</strong></div>
     	<div class="col-12 col-md-9 col-lg-10 text-center text-sm-left p-1 px-3">${list.name}</div>
     	<div class="col-12 col-md-3 col-lg-2 alert alert-info text-center p-1"><strong>이메일</strong></div>
     	<div class="col-12 col-md-9 col-lg-10 text-center text-sm-left p-1 px-3">${list.email}</div>
     	<div class="col-12 col-md-3 col-lg-2 alert alert-info text-center p-1"><strong>전화번호</strong></div>
     	<div class="col-12 col-md-9 col-lg-4 text-center text-sm-left p-1 px-3">${list.tell}</div>
     	<div class="col-12 col-md-3 col-lg-2 alert alert-info text-center p-1"><strong>휴대폰</strong></div>
     	<div class="col-12 col-md-9 col-lg-4 text-center text-sm-left p-1 px-3">${list.phone}</div>
     	<div class="col-12 col-md-3 col-lg-2 alert alert-info text-center p-1"><strong>문의내용</strong></div>
     	<div class="col-12 col-md-9 col-lg-10 jw_content text-center text-sm-left p-1 px-3">${list.content}</div>
     </div></div>
</div></div></div>
</c:forEach>

<div class="container mb-5">
	<div class="bg-white shadow-sm border rounded-lg text-center p-3 mt-5 pl-5 pr-5">
		<h4 class="text-left">가감세무법인 관리자</h4><hr>
		<div class="row justify-content-between">
			<div class="col-12 col-lg-2 col-md-5 jw_card card cursor-pointer my-1"><a class="text-decoration-none text-dark" href="adminuser.do"><div class="card-body">회원관리</div></a></div>
			<div class="col-12 col-lg-2 col-md-5 jw_card jw_card-active cursor-pointer my-1"><a class="text-decoration-none text-white" href="adminque.do"><div class="card-body">1대1문의</div></a></div>
			<div class="col-12 col-lg-2 col-md-5 jw_card card cursor-pointer my-1"><a class="text-decoration-none text-dark" href="adminIntroduceMember.do"><div class="card-body">구성원</div></a></div>
			<div class="col-12 col-lg-2 col-md-5 jw_card card cursor-pointer my-1"><a class="text-decoration-none text-dark" href="taxinfoList.do"><div class="card-body">세무정보</div></a></div>
		</div>
	</div>
<!-- 필터 -->	
	<form action="adminque.do" method="get">
	<div class="row bg-white shadow-sm border rounded-lg mt-5 px-1 px-sm-3 py-3">
		<div class="col-12"><h4><a class="text-decoration-none text-dark" href="adminque.do">1대1문의</a> <span class="badge badge-info">${count }</span><button type="reset" class="btn btn-outline-info float-right ml-2">Reset</button><button type="sumbit" class="btn btn-outline-secondary float-right">Search</button></h4><hr>
			<div class="form-inline">
				<div class="mt-3">이름  <input type="text" name="searchname" class="form-control ml-2 mr-5"></div>
				<div class="mt-3"> 휴대폰  <input type="number" name="searchphone" class="form-control ml-2 mr-5"></div>
				<div class="mt-3 form-inline">작성일 <div class="input-group"><input type="date" name="startdate" id="jw_startDate" class="form-control mx-2"> ~ <input type="date" name="enddate" id="jw_endDate" class="form-control ml-2"></div></div>
				<input type="hidden" name="page" value="">
			</div>
		</div>
	</div>
	</form>
	<div class="row bg-white shadow-sm border rounded-lg mt-3">
		<div class="col-12">
			<div class="col-12 pt-3">
				<button type="button" class="btn btn-outline-secondary float-right mr-1 mr-sm-3" data-toggle="modal" data-target="#jw_quedelAlert" data-backdrop="false">Delete</button><br><br>
			</div>
			<div class="col-12 table-responsive-lg pt-2">
				<table class="table table-hover-gray text-center">
				    <thead class="table-borderless">
				      <tr>
				      	<th style="width:5%;">
							<div class="custom-control custom-checkbox">
							    <input type="checkbox" class="custom-control-input" id="jw_allCheck">
							    <label class="custom-control-label cursor-pointer" for="jw_allCheck"></label>
							 </div>
				      	</th>
					    <th style="width:10%;">번호</th>
				        <th style="width:15%;">이름</th>
				        <th style="width:15%;">휴대폰</th>
				        <th>내용</th>
				        <th style="width:15%;">작성일</th>
				        <th style="width:10%;">상세</th>
				      </tr>
				    </thead>
				    <tbody>
				    <c:if test="${empty list}">
				    <tr>
				      	<th colspan="7" class="text-center py-5"><h4>1대1문의 목록이 없습니다</h4></th>
				    </tr>
				    </c:if>
				    <form id="jw_quedelform" action="adminquedel.do" method="post">
				    <c:forEach var="list" items="${list}">
				      <tr>
				      	<td>
							<div class="custom-control custom-checkbox">
							    <input type="checkbox" class="custom-control-input" id="jw_checkdel${list.inquiry_no }" name="delCheck" value="${list.inquiry_no }">
							    <label class="custom-control-label cursor-pointer" for="jw_checkdel${list.inquiry_no }"></label>
							 </div>
				      	</td>
			      		<td>${list.inquiry_no }</td>
				        <td>${list.name }</td>
				        <td>${list.phone }</td>
				        <td><c:out value="${fn:substring(list.content.replace('<br>',''),0,25)}"/><c:if test="${fn:length(list.content) ge 25 }">...</c:if></td>
				        <td>${list.inquiry_date }</td>
				        <td><button type="button" class="badge badge-pill btn btn-secondary jw_pd" data-toggle="modal" data-target="#jw_queModal${list.inquiry_no }" data-backdrop="false"><i class="far fa-list-alt fa-size"></i></button></td>
				      </tr>
				      </c:forEach>
				      </form>
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