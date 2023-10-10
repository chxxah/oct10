<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
<link rel="stylesheet" href="./css/menu.css">
<link href="./css/join.css" rel="stylesheet" />
<script src="./js/jquery-3.7.0.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap"
	rel="stylesheet">


<script type="text/javascript">
	$(function() {
		$("#idCheck").click(function() {
			let mid = $("#mid").val();
			if (mid.length < 5) {
				$("#mid").focus();
				$("#mid").css("background-color", "#FFCDD2");
				$("#resultMSG").text("아이디를 4글자 이상 쓰세요");
			} else {
				$.ajax({
					url : "./checkID",
					type : "post",
					data : {
						"mid" : mid
					},
					dataType : "json",

					success : function(data) {
						//alert(data.result);
						if (data.result == 1) {
							$("#mid").css("background-color", "#FFCDD2");
							$("#mid").focus();
							$("#resultMSG").text("이미 등록된 ID");
						} else {
							$("#mid").css("background-color", "white");
							$("#resultMSG").text("가능");
						}

						//$("#resultMSG").text(data.result);
					},

					error : function(error) {

						$("#resultMSG").text("er");
					}
				});

			}

		});

	});

	$(function() {
		$('.k-btn').click(function() {
			if ($('#resultMSG').text() != "가능") {
				alert("CHECK를 눌러주세요")
			} else if ($('#mid').val() == "") {
				$("#mid").css("background-color", "#FFCDD2");
				$("#mid").focus();
				alert("아이디를 입력하세요");
				return false;
			} else if ($('#mpw').val() == "" || $('#mpw2').val() == "") {
				$("#mpw").css("background-color", "#FFCDD2");
				$("#mpw").focus();
				alert("비밀번호를 입력하세요");
				return false;
			} else if ($('#mpw').val() != $('#mpw2').val()) {
				$("#mpw2").css("background-color", "#FFCDD2");
				$("#mpw2").focus();
				alert("비밀번호를 확인하세요");
				return false;
			} else if ($('#mname').val() == "") {
				$("#mname").css("background-color", "#FFCDD2");
				$("#mname").focus();
				alert("이름을 입력하세요");
				return false;
			} else if ($('#maddr').val() == "") {
				$("#maddr").css("background-color", "#FFCDD2");
				$("#maddr").focus();
				alert("주소를 입력하세요");
				return false;
			} else if ($('#mdate').val() == "") {
				$("#mdate").css("background-color", "#FFCDD2");
				$("#mdate").focus();
				alert("생년월일을 입력하세요");
			} else {
				$(".detail-content");
				$("#exampleModal").modal("show");
			}
		});
	});

	$(function() {
		$(".signup").click(function() {
			let pw = $('#mapw').val();
			if (pw.length != 4 || isNaN(pw)) {
				$("#mapw").focus();
				alert("다시입력하세요");
				return false;
			}

		});
	});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="join">
		<form action="./join" method="post">


			<div class="blank"></div>
			<div class="join-title">REGISTER</div>
			<br> <br>
			<div class="title">

				<h1 style="font-size: xx-large;">정보를 입력해주세요</h1>
				<div class="info">
					아이디
					<button id="idCheck" type="button">CHECK</button>
					<br>
					<div class="enter"></div>
					<input type="text" name="mid" id="mid"> <br> <span
						id="resultMSG" style="font-size: small; color: #E57373;"></span><br>
					비밀번호<br>
					<div class="enter"></div>
					<input type="password" name="mpw" id="mpw"> <br> <br>비밀번호
					확인<br>
					<div class="enter"></div>
					<input type="password" name="mpw2" id="mpw2"> <br> <br>
					이름<br>
					<div class="enter"></div>
					<input type="text" name="mname" id="mname"><br> <br>
					<div class="select">
						성별<br> <input style="width: 90px;" type="radio" id="select"
							name="mgender" value="남"> <label for="select">MALE</label>
						<input style="width: 90px;" type="radio" id="select2"
							name="mgender" value="여"> <label for="select2">FEMALE</label>

					</div>
					<br> 생년월일 <br>
					<div class="enter"></div>
					<input type="date" name="mbirth" id=mdate><br> <br>
					주소<br>
					<div class="enter"></div>
					<input type="text" name="maddr" id="maddr"><br> <br>
					<br>

				</div>


				<!-- 모달 여는 스크립트 만들기 -->
				<div class="nxt">
					<button type="button" class="modalOpen k-btn next">NEXT</button>
				</div>
					<div class="blank"></div>
						<div class="blank"></div>
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<!-- 제목 적기 -->
								<div class="modal-title" id="exampleModalLabel">ACCOUNT
									PASSWORD</div>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="detail-detail">

									<br>
									<div class="detail-content">
										<h2>당신의 계좌 번호</h2>
										<h3 style="text-decoration: underline;">${account }</h3>
									</div>
									<input type="hidden" name="maccount" value="${account }">

									<br> <br> <br> <br> 비밀번호를 입력해주세요<br>(숫자4자리)<br>
									<input type="password" name="mapw" id="mapw">
								</div>
								<div class="signup">
									<button class="k-btn signup">가입완료</button>
								</div>
								<br>
							</div>
						</div>
					</div>
				</div>
			</div>

		</form>

	</div>

	<!-- modal -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>


</body>
</html>