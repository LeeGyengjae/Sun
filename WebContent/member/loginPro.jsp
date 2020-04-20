<%@page import="member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	MemberDAO memberdao = new MemberDAO();
	int check = memberdao.userCheck(id,passwd);  
		if(check == 1){
		session.setAttribute("id", id);
		response.sendRedirect("../index.jsp");
	}else if(check == 0){
%>		
		<script>
			alert("비밀번호 틀림");
			history.go(-1);  
		</script>
<%		
	}else{ 
%>	
		<script>
			alert("아이디 없음");
			history.back();
		</script>
<%	
	}
%>




