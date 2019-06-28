<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
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
<style>
.table-hover-gray tbody tr:hover{
 background:rgb(250,250,250);
}
.table-hover-gray thead{
font-size:17px;
color:#888;
}
.card-active{
background:#bbb;
border: 1px #bbb;
color: white;
font-weight:bold;
}
.cursor-pointer{
cursor:pointer;
}
input[type=date]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    display: none;
}
</style>
</head>
<body>
<div class="modal fade" id="myModal"><div class="modal-dialog"><div class="modal-content">
     <div class="modal-header">
       <h4 class="modal-title">Modal Heading</h4> <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
     <div class="modal-body">
       삭제?
     </div>
     <div class="modal-footer">
       <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
     </div>
</div></div></div>

<div class="modal fade" id="jw_userModal"><div class="modal-dialog"><div class="modal-content">
     <div class="modal-header">
       <h4 class="modal-title">회원정보</h4> <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
     <div class="modal-body">
       ㅇㅇ
     </div>
     <div class="modal-footer">
       <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
     </div>
</div></div></div>

<div class="container">
	<div class="row justify-content-between bg-white shadow-sm border rounded-lg text-center p-3 mt-5 pl-5 pr-5">
		<div class="col-12 col-sm-3 card cursor-pointer card-active"><a href="adminuser.do"><div class="card-body">회원관리</div></a></div>
		<div class="col-12 col-sm-3 card cursor-pointer"><a href="adminque.do"><div class="card-body">1대1문의 <span class="badge badge-light">4</span></div></a></div>
		<div class="col-12 col-sm-3 card cursor-pointer"><div class="card-body">세무정보</div></div>
	</div>
	<div class="row bg-white shadow-sm border rounded-lg mt-5 p-3">
		<div class="col-12"><h4>회원관리 <span class="badge badge-secondary">24</span><button type="button" class="btn btn-light float-right">검색하기</button></h4><hr>
			<form>
				<div class="form-inline mt-4">아이디  <input type="text" class="form-control ml-2 mr-5"> 가입날짜 <input type="date" class="form-control mx-2"> ~ <input type="date" class="form-control ml-2">
				 </div>
			</form>
		</div>
	</div>
	<div class="row bg-white shadow-sm border rounded-lg mt-3">
		<div class="col-12">
			<div class="col-12 pt-2">
				<table class="table table-hover-gray text-center">
				    <thead class="table-borderless">
				      <tr>
					    <th>
					    	<span class="cursor-pointer dropdown-toggle" data-toggle="dropdown">번호</span>
							<div class="dropdown-menu">
							    <a class="dropdown-item" href="#">오름차순</a>
							    <a class="dropdown-item" href="#">내림차순</a>
							 </div>						    
					    </th>
				        <th>아이디</th>
				        <th>전화번호</th>
				        <th>
				        	<span class="cursor-pointer dropdown-toggle" data-toggle="dropdown">가입날짜</span>
							<div class="dropdown-menu">
							    <a class="dropdown-item" href="#">오름차순</a>
							    <a class="dropdown-item" href="#">내림차순</a>
							 </div>	
						</th>
				        <th>탈퇴</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr class="cursor-pointer" data-toggle="modal" data-target="#jw_userModal" data-backdrop="false">
			      		<td>22</td>
				        <td>아이디</td>
				        <td>전화번호</td>
				        <td>가입날짜</td>
				        <td><button type="button" class="btn btn-light" data-toggle="modal" data-target="#myModal" data-backdrop="false">강제탈퇴</button></td>
				      </tr>
				      <tr class="cursor-pointer" data-toggle="modal" data-target="#jw_userModal" data-backdrop="false">
			      		<td>22</td>
				        <td>아이디</td>
				        <td>전화번호</td>
				        <td>가입날짜</td>
				        <td><button type="button" class="btn btn-light" data-toggle="modal" data-target="#myModal" data-backdrop="false">강제탈퇴</button></td>
				      </tr>
				      <tr class="cursor-pointer" data-toggle="modal" data-target="#jw_userModal" data-backdrop="false">
			      		<td>22</td>
				        <td>아이디</td>
				        <td>전화번호</td>
				        <td>가입날짜</td>
				        <td><button type="button" class="btn btn-light" data-toggle="modal" data-target="#myModal" data-backdrop="false">강제탈퇴</button></td>
				      </tr>
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

</body>
</html>