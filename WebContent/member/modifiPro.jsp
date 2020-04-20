<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id"); 
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String tel = request.getParameter("tel");
	String mtel = request.getParameter("mtel");
	String gender = request.getParameter("gender");
	int age = Integer.parseInt(request.getParameter("age"));
	
	MemberBean memberbean = new MemberBean();
	memberbean.setId(id);
	memberbean.setPasswd(passwd);
	memberbean.setName(name);
	memberbean.setEmail(email);
	memberbean.setAddress(address);
	memberbean.setGender(gender);
	memberbean.setAge(age);
	memberbean.setTel(tel);
	memberbean.setMtel(mtel);
	
	MemberDAO memberdao = new MemberDAO();

	int check = memberdao.updateMember(memberbean);
	
	if(check==1){
%>
		<script>
		window.alert("회원수정 성공");
		</script>
<%	
		response.sendRedirect("../index.jsp");
	
	}else{
%>
	<script>
	window.alert("비밀번호가 일치하지 않습니다.");
	history.back();
	</script>
<%		
	}
	
	
	
	 
	
	%>

