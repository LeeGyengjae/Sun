<%@page import="java.sql.Timestamp"%>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../inc/head2.jsp"/>
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
		}else{ fr.submit(); }
	}
function addressopen(){
		window.open("addressCheck.jsp","","width=400,height=200");
	}
</script>

<%

	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("login.jsp");
	}
	
	request.setCharacterEncoding("UTF-8");
	MemberDAO dao = new MemberDAO();
	
	MemberBean memberBean = dao.getMember(id);
	String passwd = memberBean.getPasswd();
	String name = memberBean.getName();
	int age = memberBean.getAge();
	String gender = memberBean.getGender();
	String email = memberBean.getEmail();
	String address = memberBean.getAddress();
	String tel = memberBean.getTel();			
	String mtel = memberBean.getMtel();		

%>
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
					<h1 id="login">회원정보 수정</h1>
					<form action="modifiPro.jsp" id="join" method="post" name="fr">
				<fieldset id="loginJSP">
					<legend>Basic Info</legend>
					<label>User ID</label> <input type="text" name="id" class="id" value=<%=id %> readonly="readonly">
					<input type="button" value="ID중복체크" class="dup" onclick="winopen()"><br>
					<label>Password</label> <input type="password" name="passwd"><br>
					<label>Retype Password</label> <input type="password" name="passwd2"><br>
					<label>Name</label> <input type="text" name="name" value=<%=name %>><br>
					<label>E-Mail</label> <input type="email" name="email" value=<%=email %>><br>
				</fieldset>

				<fieldset id="loginJSP">
					<legend>Optional</legend>
					<label>Age</label> <input type="text" name="age" value=<%=age %>><br>
					<label>Gender</label> <input type="text" name="gender" value=<%=gender %>><br>
					<label>Address</label> <input type="text" name="address" value=<%=address %>>  <input type="button" value="주소찾기" onclick="addressopen()"> <br>
					<label>Number</label> <input type="text" name="tel" value=<%=tel %>><br>
					<label>Mobile Phone Number</label> <input type="text" name="mtel" value=<%=mtel %>><br>
				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					<input type="button" value="수정" class="submit" onclick="notNull()"> 
					<input type="reset" value="취소" class="cancel">
				</div>
			</form>
		</article>
							
					
				<!-- end of class content -->
				<!-- start of footer -->
				<jsp:include page="../inc/bottom2.jsp"/>
				<!-- end of footer -->
			</div>
	</div>
</body>
</html>