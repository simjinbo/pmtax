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
					구성원 소개
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
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${member }" var="member" varStatus="status">	
					<tr>
						<td>
							<img src="${pageContext.request.contextPath }/files/introduceMember/${member.member_picture }">
						</td>
						<td><b>
							${member.member_name }
						</td>						
						<td>
							${member.qualification }
						</td>
						<td>
							${member.business_field }
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