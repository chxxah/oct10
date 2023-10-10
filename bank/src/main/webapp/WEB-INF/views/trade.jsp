<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trade</title>
<link rel="stylesheet" href="./css/trade.css">
<link rel="stylesheet" href="./css/menu.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function() {
	let msg = document.getElementById("trademsg");
	let moneymsg = document.getElementById("moneymsg");
	let pwmsg = document.getElementById("pwmsg");
	let text = "";
	$(".pw-btn").click(function() {
		let mapw = $(".mapw").val();
		$.ajax({
			url: "./mapw",
			type: "post",
			data: {mapw:mapw},
			dataType: "json",
			success: function(data) {
				if (data.result == 1) {
					text = "확인되었습니다.";
					pwmsg.innerHTML = text;
				} else {
					text = "다시 입력하세요.";
					pwmsg.innerHTML = text;
				}
			},
			error: function(drror) {
				alert("에러입니다.");
			}
		});
	});
	$("#checkaccount").click(function() {
		let account = $(".tipaccount").val();
		$.ajax({
			url: "./checkaccount",
			type: "post",
			data: {account:account},
			dataType: "json",
			success: function(data) {
				if (data.result == 1) {
					text = "이체 가능한 계좌입니다.";
					msg.innerHTML = text;
				} else {
					text = "이체 불가능한 계좌입니다. 다시 입력하세요.";
					msg.innerHTML = text;
				}
			},
			error: function(drror) {
				alert("에러입니다.");
			}
		});
	});	
	$(".trade-btn").click(function(){
		if (pwmsg.innerHTML == "다시 입력하세요." || $(".mapw").val().length == 0){
			alert("계좌비밀번호를 확인하세요.");
			$(".mapw").focus();
			return false;
		}
		if ($(".tmoney").val().length == 0){
			alert("이체 금액을 입력하세요.");
			$(".tmoney").focus();
			return false;
		}
		if (msg.innerHTML == "이체 가능한 계좌입니다.") {
			if ($(".tmoney").val() > ${list[0].mmoney }) {
				text = "출금가능금액이 부족합니다.";
				moneymsg.innerHTML = text;
				$(".tmoney").focus();
				return false;
			} else if ($(".tmoney").val() < 0) {
				text = "출금가능금액은 마이너스가 될 수 없습니다.";
				moneymsg.innerHTML = text;
				$(".tmoney").focus();
				return false;
			} else {
				$("#tradeForm").submit();
			}
		} else {
			text = "계좌번호를 확인하세요.";
			msg.innerHTML = text;
			alert(text);
			$(".tipaccount").focus();
			return false;
		}		
	});
});
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
	<div class="tradeList">
	<form action="./trade" method="post" id="tradeForm">
		<div class="withdraw">
		<h1>출금계좌정보</h1>
		<table>
			<tr>
				<td class="t1">출금계좌번호</td>
				<td class="t2"><input type="text" name="toaccount" value="${list[0].maccount }" style="border:none;"></td>				
			</tr>
			<tr>
				<td class="t1">잔액</td>
				<td class="t2"><input type="text" class="mmoney" name="mmoney" value="${list[0].mmoney }" style="border:none; width: 70px;"><small>(원)</small></td>
			</tr>
			<tr>
				<td class="t1">계좌비밀번호<small>(숫자 4자리)</small></td>
				<td class="t2"><input type="password" class="mapw" name="mapw"><button type="button" class="pw-btn">확인</button><div><span id="pwmsg"></span></div></td>
			</tr>
			<tr>
				<td class="t1">이체금액</td>
				<td class="t2"><input type="text" class="tmoney" name="tmoney"><small>(원)</small><span id="moneymsg"></span></td>
			</tr>
		</table>
		</div>
		<div class="deposit">
		<h1>입금계좌정보</h1>
		<table>
			<tr>
				<td class="t1">입금계좌번호</td>
				<td class="t2"><input type="text" class="tipaccount" name="tipaccount"><button type="button" id="checkaccount">확인</button><div><span id="trademsg"></span></div></td>
			</tr>
		</table>
		</div>
		<button type="submit" class="trade-btn">이체하기</button>
		</form>
	</div>
</body>
</html>