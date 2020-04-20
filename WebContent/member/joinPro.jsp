<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
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
	Timestamp time = new Timestamp(System.currentTimeMillis());
	
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
	memberbean.setReg_date(time);
	
	MemberDAO memberdao = new MemberDAO();
	
	memberdao.insertMember(memberbean); 
	
	response.sendRedirect("login.jsp");
	 
%>
<script>
	window.alert("회원가입 성공");
</script>