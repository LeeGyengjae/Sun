<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
			<div class="loginJSP"> 
				<h1 id="login">로그인</h1>
			<form action="loginPro.jsp" id="join" method="post">
				<fieldset>
					<legend id="loginJSP">Login Info</legend>
					<label id="loginJSP">User ID</label> <input type="text" name="id"><br>
					<label id="loginJSP">Password</label> <input type="password" name="passwd"><br>
				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					<input type="submit" value="로그인" class="submit"> 
					<input type="reset" value="다시입력" class="cancel">
				</div>
			</form>
				
			</div>
			<!-- end of class content -->
			<jsp:include page="../inc/bottom2.jsp"/>
		</div>
	</div>
</body>
</html>