<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/files/main/logo.png">
<title>가감세무법인</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/taxinfo.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<div class="container" id="js_taxinfoList">
		<div class="jumbotron jumbotron-fluid" id="js_taxinfolist_jumbo">
		</div>
		<div class="row" id="js_taxinfolist_content">
			<div class="col" id="js_taxinfolist_subcontain">
				<h5 id="js_taxinfolist_subtitle">세무정보</h5>
				<div id="js_taxinfolist_subbar"></div>
				<div>
					<nav class="nav flex-column" id="js_taxinfolist_submenu">
						<a class="nav-link" href="taxinfoList.do?nowpage=0">세무자료실</a>
					</nav>
				</div>
			</div>
			<div class="col" id="js_taxinfolist_list">
				<div id="js_taxinfolist_tb">
					<div class="row" id="js_taxinfolist_row">
						<div class="col">
							<h4 id="js_taxinfolist_title">세무자료실</h4>
						</div>
						<div class="col">
							<span>HOME > 세무정보 > 세무자료실</span>
						</div>
					</div>
					<table class="table table-sm" style="border-bottom: 1px solid #dee2e6;">
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
							<c:forEach items="${list }" var="list" varStatus="status">
								<tr>
									<th scope="row">${list.info_no }</th>
									<td><a href="taxinfoDetail.do?info_no=${list.info_no }&nowpage=${nowpage}">${list.info_title }</a></td>
									<td>${list.info_writer }</td>
									<td>${list.info_date }</td>
									<td>${list.hits }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col">
					<!-- 페이징 -->
					<nav aria-label="Page navigation example">
						<ul class="pagination pagination-sm justify-content-center" id="js_taxinfolist_page">
							<li class="page-item">
								<a class="page-link" href="taxinfoList.do?nowpage=0" aria-label="Previous" id="js_taxinfolist_a"> 
									<span aria-hidden="true">&laquo;&laquo;</span>
								</a>
							</li>
							<c:choose> 
								<c:when test="${nowpage <= 0}">
									<li class="page-item">
										<a class="page-link" href="#" aria-label="Previous"> 
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:when>
								<c:otherwise> 
									<li>
										<a class="page-link" href="taxinfoList.do?nowpage=${nowpage-1}" aria-label="Previous"> 
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li> 
								</c:otherwise>
							</c:choose>
							<c:forEach var="i" begin="0" end="${totalpage}" > 
								<li class="page-item"><a class="page-link" href="taxinfoList.do?nowpage=${i}">${i+1}</a></li>
							</c:forEach>
							<c:choose> 
								<c:when test="${nowpage >= totalpage }"> 
									<li class="page-item">
										<a class="page-link" href="#" aria-label="Previous"> 
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:when> 
								<c:otherwise> 
									<li class="page-item">
										<a class="page-link" href="taxinfoList.do?nowpage=${nowpage+1}" aria-label="Previous"> 
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li> 
								</c:otherwise> 
							</c:choose>
							<li class="page-item">
								<a class="page-link" href="taxinfoList.do?nowpage=${totalpage}" aria-label="Next"> 
									<span aria-hidden="true">&raquo;&raquo;</span>
								</a>
							</li>
						</ul>
					</nav>

				</div>
				<div class="col" align="right">
					<c:if test="${loginUser.user_no == 1 }">
						<button class="btn btn-dark btn-sm"
							onclick="location.href='taxinfoWriteView.do'">게시글작성</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp" />
</body>
</html>