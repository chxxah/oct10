<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/admin.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".edit").click(function () {
			if (confirm("수정하시겠습니까?")) {
			} else {
				return false;
			}
		});
	}); 
</script>
</head>

<body>
<%@ include file="menu.jsp" %>
<div class="admin_back">
	<div class="admin_header">
		관리자 페이지
		<hr style="border: 2px solid #FFF176">
	</div>
		<table id="memberList">
		
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>성별</th>
				<th>생일</th>
				<th>주소</th>
				<th>계좌번호</th>
				<th>계좌 비밀번호</th>
				<th>잔액</th>
				<th>등급</th>
				<th>수정</th>
			</tr>
			
			<c:forEach items="${memberList }" var="list">
			<tr>
			<form action="./admin" method="post">
				<td>${list.mno }</td>
				<td>${list.mid }</td>
				<td>${list.mpw }</td>
				<td>${list.mname }</td>
				<td>${list.mgender }</td>
				<td>${list.mbirth }</td>
				<td>${list.maddr }</td>
				<td>${list.maccount }</td>
				<td>${list.mapw }</td>
				<td>${list.mmoney }</td>
				<input type="hidden" name="mid" value="${list.mid }">
				<td>
					<select class="mgrade" name="mgrade">
						<option value="1" <c:if test="${list.mgrade eq 1 }">selected="selected"</c:if>>[1] 관리자</option>
						<option value="2" <c:if test="${list.mgrade eq 2 }">selected="selected"</c:if>>[2] 일반고객</option>
						<option value="3" <c:if test="${list.mgrade eq 3 }">selected="selected"</c:if>>[3] 탈퇴회원</option>
					</select>
				</td>
				<td>
					<button class="edit">수정</button>
				</td>			
			</form>
			</tr>
			</c:forEach>
		</table>
</div>

</body>
</html>