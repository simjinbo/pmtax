<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
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
</head>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);



.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
  
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: auto;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}

.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #3496d8;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #266d9c;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #3496d8;
  text-decoration: none;
}
.form .register-form {
  display: none;
}


body {
  background: #3496d8; 
  background: -webkit-linear-gradient(right, #3496d8, #3496d8);
  background: -moz-linear-gradient(right, #3496d8, #3496d8);
  background: -o-linear-gradient(right, #3496d8, #3496d8);
  background: linear-gradient(to left, #3496d8, #3496d8);
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;    
  
  
  text-align: center;
 margin: 0 auto;  
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>


<body>

<div class="container">
<div class="login-page" >
  <div class="form">
    <form class="register-form">
      <input type="text" placeholder="아이디"/>
      <input type="text" placeholder="이름"/>
      <input type="password" placeholder="비밀번호"/>
      <input type="password" placeholder="비밀번호 확인"/>
      <input type="email" placeholder="이메일"/>
      <button>회원가입</button>
      <p class="message">로그인 페이지로 <a href="#">돌아가기</a></p>
    </form>
    <form class="login-form">
      <input type="text" placeholder="아이디"/>
      <input type="password" placeholder="비밀번호"/>
      <button>로그인</button>
      <p class="message">계정이 없나요? <a href="#">회원가입 하기</a></p>
    </form>
  </div>
</div>
</div>
<script type="text/javascript">
$(".message a").click(function() {
	  $("form").animate({ height: "toggle", opacity: "toggle" }, "slow");
	});
</script>

</body>
</html>