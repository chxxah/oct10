<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/mypage.css">

</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class=background>
	<img src="./img/ch.png" class="chunsik1">
	<img src="./img/ch2.png" class="chunsik2">
		<div class="coms">
		<h2 style="margin-left: 41%;">내정보</h2>
			<div class="com">
				<div class="comHead">ID</div>
				<div class="comBody">${list[0].mid}</div>
			</div>
			<div class="com">
				<div class="comHead">이름</div>
				<div class="comBody">${list[0].mname}</div>
			</div>
			<div class="com">
				<div class="comHead">계좌번호</div>
				<div class="comBody">${list[0].maccount}</div>
			</div>
			<div class="com">
				<div class="comHead">생년월일</div>
				<div class="comBody">${list[0].mbirth}</div>
			</div>
			<div class="com">
				<div class="comHead">주소</div>
				<div class="comBody">${list[0].maddr}</div>
			</div>
			<div class="com">
				<div class="comHead">성별</div>
				<div class="comBody">${list[0].mgender}</div>
			</div>
	   </div>
	</div>







</body>
</html>