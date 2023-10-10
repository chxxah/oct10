<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join info</title>
<link rel="stylesheet" href="./css/menu.css">
<link href="./css/joininfo.css" rel="stylesheet"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&display=swap" rel="stylesheet">
</head>
<body>
<%@ include file="menu.jsp" %>
<div class="blank"></div>
<div class="title">
<div class="kakao">KAKAO</div>
<br><br>
</div>
<div class="content">
 <div><br><h2>가입을 시작합니다!</h2> <br><br> 카카오 계정 하나로<br> 다양한 서비스를 편리하게 이용해보세요. <br><br> 카카오 계정으로 사용할 이메일이 있나요?
  </div>
<div class="blank"></div>
<button class="k-btn"  onclick="location.href='./join'"> 회원가입 시작</button>
<br><br>
<button class="k-btn" style="background-color:#E0E0E0" onclick="location.href='./index'"> 취소</button>
<div>
<div class="blank"></div>
<br><br>

	사용 중인 아이디가 있다면 로그인하세요<br> <a href="./login">로그인하러 가기</a>
</div>
<div class="blank"></div>
</div>


</body>
</html>