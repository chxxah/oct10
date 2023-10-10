<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>tradeList</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/tradeList.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	function linkPage(pageNo){
		location.href = "./tradeList?pageNo="+pageNo;
	}	
</script>

</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<%@ include file="menu.jsp" %>

<div class="full">	
	<div class="head rounded">
	<h1 style="display:inline">거래내역</h1> &nbsp; &nbsp;<img src="./img/money.png" height="90">
	</div>
	<div class="row border-bottom border-secondary">
	<div class="col-md-6"><h3>사용 계좌</h3>${list2[0].maccount }</div>
	<div class="col-md-6 money"><h3>잔액</h3>${list2[0].mmoney } 원 </div>
	</div>
	<h3>최근 거래 내역</h3>
	<div class="tt" >
	<c:forEach items="${list }" var="b" end="4">
	<div class="new border border-warning rounded">	
		<div class="time"><fmt:formatDate pattern="MM-dd" value="${b.ttime}"/></div>
		<div class="tag ">
		<c:choose>
		<c:when test="${list2[0].maccount eq b.tipaccount}">
			<h4 style="display:inline">${b.tname }</h4>
		</c:when>
		<c:otherwise>
			<h4 style="display:inline">${b.tipname}</h4>
		</c:otherwise>
		</c:choose>
		</div>
		<div class="mon">
		<c:choose >
		<c:when test="${b.toaccount eq list2[0].maccount}" >
		<div class="m1">- ${b.tmoney }원</div>
		</c:when>
		<c:otherwise>
		<div class="m2">+ ${b.tmoney }원</div>
		</c:otherwise>
		</c:choose> 
		</div>
	</div>	
	</c:forEach>
	</div>
	
	<div class="table table-hover" >
	<h2>상세 조회</h2>
	
	<table bordercolor= "#FFF176">
            <thead>
                <tr>
                    <td>거래시간</td>
                    <td>출금계좌번호</td>
                    <td>입금계좌번호</td>
                    <td>출금회원</td>
                    <td>입금회원</td>
                    <td>거래금액</td>
                </tr>
                <tbody>
					<c:forEach items="${list }" var="i">
						<tr>
							<td class="a"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${i.ttime}"/> </td>
							<td class="a">${i.toaccount }</td>
							<td class="a">${i.tipaccount}</td>
							<td class="a">${i.tname}</td>
							<td class="a">${i.tipname}</td> 
							<td class="a">
							<c:choose >
							<c:when test="${i.toaccount eq list2[0].maccount}" >
							<div class="m1">- ${i.tmoney }</div>
							</c:when>
							<c:otherwise>
							<div class="m2">+ ${i.tmoney }</div>
							</c:otherwise>
							</c:choose> 
						</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
	<ui:pagination paginationInfo = "${paginationInfo}"
	type="image"
	jsFunction="linkPage"/>
		
</div>	
</div>
</body>
</html>