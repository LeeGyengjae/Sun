<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<link href="css/style.css" rel="stylesheet" type="text/css">
	
<%
	//각 상단 메뉴에서 공통적으로 사용된 소스
	//세션영역에 저장된 값 얻기
	String id = (String)session.getAttribute("id");
	
	if(id==null){//세션값이 존재 하지 않을때..
%>
	<div id="Toplogin">
		<a href="member/login.jsp">Login</a> <a href="member/join.jsp">Sign Up</a>
	</div>
<%	
	}else{//세션값이 존재 할때..
%>
	<div id="Toplogin">
		<%=id %> is Signing in
	<a href="member/logout.jsp">Logout</a>  <a href="member/modifi.jsp">Edit Information</a>
	</div>
<%						
}	
%>