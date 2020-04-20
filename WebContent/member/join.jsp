<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
 	function winopen(){
 		if(document.fr.id.value == ""){
 			alert("아이디를 입력하세요.");
 			document.fr.id.focus();
 			return;
 		}
 		var fid = document.fr.id.value;
 		window.open("join_IDCheck.jsp?userid="+fid,"","width=400,height=200");
 	}
 	
 	function notNull(){
 		if(document.fr.id.value == ""){
 			alert("아이디를 입력하세요.");
 			document.fr.id.focus();
 			return;
 		}else if(document.fr.passwd.value == ""){
 			alert("비밀번호를 입력하세요.");
 			document.fr.passwd.focus();
 			return;
 		}else if(document.fr.passwd.value != document.fr.passwd2.value){
 			alert("비밀번호와 비밀번호확인의 값이 다릅니다.");
 			document.fr.passwd.focus();
 			return;
 		}else if(document.fr.name.value == ""){
 			alert("이름을 입력하세요.");
 			document.fr.name.focus();
 			return;
 		}else if(document.fr.email.value == ""){
 			alert("이메일을 입력하세요.");
 			document.fr.email.focus();
 			return;
 		}else if(document.fr.email.value != document.fr.email2.value){
 			alert("이메일과 이메일확인의 값이 다릅니다.");
 			document.fr.email.focus();
 			return;
 		}else{ fr.submit(); }
 	}
 	function addressopen(){
 		window.open("addressCheck.jsp","","width=400,height=200");
 	}
</script>
	<jsp:include page="../inc/head2.jsp"/>
</head>
<body>
	<div id="page">
	<jsp:include page="../inc/slider2.jsp"/>
	<div id="content"> 
			<!-- start of header -->
			<jsp:include page="../inc/top2.jsp"/>
			<!-- end of header --> 
			<!-- start of class content -->
			<article>
			<h1 id="login">Join Us</h1>
			<!-- DB에 새로 추가할 회원 내용을 입력하고.. 회원가입 전송 버튼 클릭시..
				 입력한 모든 내용을 request내장객체 메모리영역에 저장하여 유지 된 상태로
				 joinPro.jsp를 요청 함.
			 -->
			<form action="joinPro.jsp" id="join" method="post" name="fr">
				<fieldset id="loginJSP">
					<legend>Basic Info</legend>
					<label>User ID</label> <input type="text" name="id" class="id" readonly="readonly">
					<input type="button" value="ID입력" class="dup" onclick="winopen()"><br>
					<label>Password</label> <input type="password" name="passwd"><br>
					<label>Retype Password</label> <input type="password" name="passwd2"><br>
					<label>Name</label> <input type="text" name="name"><br>
					<label>E-Mail</label> <input type="email" name="email"><br>
					<label>Retype E-Mail</label> <input type="email" name="email2"><br>
				</fieldset>

				<fieldset id="loginJSP">
					<legend>Optional</legend>
					<label>Age</label> <input type="text" name="age"><br>
					<label>Gender</label> <input type="text" name="gender"><br>
					<label>Address</label> <input type="text" name="address"> <input type="button" value="주소찾기" onclick="addressopen()"> <br>
					<label>Number</label> <input type="text" name="tel"><br>
					<label>Mobile Phone Number</label> <input type="text" name="mtel"><br>
				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					<input type="button" value="회원가입" class="submit" onclick="notNull()"> 
					<input type="reset" value="취소" class="cancel">
				</div>
			</form>
		</article>
			
			<!-- end of class content -->
			<jsp:include page="../inc/bottom2.jsp"/>
		</div>
	</div>
</body>
</html>