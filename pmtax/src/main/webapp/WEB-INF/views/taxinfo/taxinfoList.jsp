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
<style type="text/css">
#js_taxinfolist_tb {
	min-height: 600px;
	max-height: 600px;
	text-align: center;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow-x: auto;
}

#js_taxinfolist_thead th {
	padding: .6rem;
	background: #dee2e63b;
	border-top: 1px solid black;
}

#js_taxinfolist_subcontain {
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
}

@media screen and (max-width:767px) {
	#js_taxinfolist_subcontain {
		max-width: 100%;
		min-width: 100%;
		margin-bottom: 30px;
	}
}

#js_taxinfolist_subtitle {
	margin-top: 50px;
	font-size: 1.6rem;
	font-family: a고딕16;
}

#js_taxinfolist_subbar {
	height: 2px;
	margin: 26px 20px 20px;
	background-color: #444444;
}

#js_taxinfolist_title {
	margin-top: 30px;
	font-family: a고딕16;
}

#js_taxinfolist_submenu {
	margin-bottom: 30px;
}

#js_taxinfolist_submenu a {
	height: 50px;
	text-decoration: none;
	color: #444444;
	font-size: 1rem;
	font-family: a고딕15;
	line-height: 34px;
}

#js_taxinfolist_submenu a:hover{
	background-color: #444444;
	color: white;
}

.page-item a{
	color: #444444;
}

#js_taxinfolist_tb tr:hover{
	background-color: #f8f9fa;
}

#js_taxinfolist_tb a{
	color: #444444;
	text-decoration: none;
}
</style>
</head>
<body>

	<div class="container"
		style="min-height: 960px; font-size: 0.9rem; margin-top: 50px;">
		<div class="row">
			<div class="col" id="js_taxinfolist_subcontain">
				<h5 id="js_taxinfolist_subtitle">세무정보</h5>
				<div id="js_taxinfolist_subbar"></div>
				<div>
					<nav class="nav flex-column" id="js_taxinfolist_submenu">
						<a class="nav-link" href="taxinfoList.do">세무자료실</a> 
						<a class="nav-link" href="#">메뉴2</a>
						<a class="nav-link" href="#">메뉴3</a>
					</nav>
				</div>
			</div>
			<div class="col">
				<div id="js_taxinfolist_tb">
					<div class="row"
						style="margin: 0 auto; text-align: right; margin-bottom: 20px;">
						<div class="col">
							<h4 id="js_taxinfolist_title">세무자료실</h4>
						</div>
						<div class="col">
							<span>HOME > 세무정보 </span>
						</div>
					</div>
					<table class="table table-sm"
						style="border-bottom: 1px solid #dee2e6;">
						<thead id="js_taxinfolist_thead">
							<tr>
								<th scope="col">번호</th>
								<th scope="col" width="500px;">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">등록일</th>
								<th scope="col">조회</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td><a href="taxinfoDetail.do">글의 제목입니다.1</a></td>
								<td>운영진</td>
								<td>2019-06-18</td>
								<td>0</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td><a href="#">글의 제목입니다.2</a></td>
								<td>운영진</td>
								<td>2019-06-18</td>
								<td>0</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td><a href="#">글의 제목입니다.3</a></td>
								<td>운영진</td>
								<td>2019-06-18</td>
								<td>0</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col">
					<!-- 페이징 -->
					<nav aria-label="Page navigation example">
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item">
								<a class="page-link" href="#"aria-label="Previous"> 
									<span aria-hidden="true">&laquo;&laquo;</span>
								</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#"aria-label="Previous"> 
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item">
								<a class="page-link" href="#"aria-label="Previous"> 
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Next">
									<span aria-hidden="true">&raquo;&raquo;</span>
								</a>
							</li>
						</ul>
					</nav>

				</div>
				<div class="col" align="right">
					<button class="btn btn-dark btn-sm"
						onclick="location.href='taxinfoWrite.do'">게시글작성</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>