<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<script type="text/javascript">
		function result() {
			opener.document.fr.id.value = document.nfr.userid.value;
			window.close();
		}
	</script>

</head>
<body>
	<%
		String id = request.getParameter("userid");
		
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.idCheck(id); 
		if(check == 1){
			out.println("사용중인 ID입니다.");
		}else{
			out.println("사용가능한 ID입니다.");
	%>		
			<input type="button" value="사용함" onclick="result();" />
	<%	
		}								  
	%>
	<form action="join_IDCheck.jsp" method="post" name="nfr">
		아이디 : <input type="text" name="userid" value="<%=id%>">
		<input type="submit" value="중복확인">
	</form>

</body>
</html>