<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="../inc/head2.jsp"/>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
if(id == null){
	response.sendRedirect("../member/login.jsp");
}
request.setCharacterEncoding("UTF-8");
int num =  Integer.parseInt(request.getParameter("num"));
int re_ref = Integer.parseInt(request.getParameter("re_ref"));
int re_lev = Integer.parseInt(request.getParameter("re_lev"));
int re_seq = Integer.parseInt(request.getParameter("re_seq"));
%>
<div id="page">
	<jsp:include page="../inc/slider2.jsp"/>
	<div id="content"> 
		<!-- start of header -->
		<jsp:include page="../inc/top2.jsp"/>
		<!-- end of header --> 
		<!-- start of class content -->
		<div class="content"> 
			<!-- start inner page content box background -->
		<div class="header">
		<div class="footer">
		<div class="body">
			<!-- start of body -->
		<article>
			<h1>Notice Update</h1>
		<form action="reWritePro.jsp" method="post">
			
			<%--주글에 대한 정보 전달 --%>
			<input type="hidden" name="num" value="<%=num%>">
			<input type="hidden" name="re_ref" value="<%=re_ref%>">
			<input type="hidden" name="re_lev" value="<%=re_lev%>">
			<input type="hidden" name="re_seq" value="<%=re_seq%>">
				
			<%--답글에 대한 정보 전달 --%>	
			<table id="notice">
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="passwd"></td>
				</tr>
				<tr>
					<td>글제목</td>
					<td><input type="text" name="subject" value="[답글]"></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td>
						<textarea name="content" rows="13" cols="40">
						</textarea>
					</td>
				</tr>				
			</table>
			
		<div id="table_search">
			<input type="submit" value="답글작성" class="btn">
			<input type="reset" value="다시작성" class="btn">
			<input type="button" value="글목록화면" class="btn" 
				   onclick="location.href='notice.jsp'">
		</div>
		</form>
		<div class="clear"></div>
		<div id="page_control"></div>		
		</article>
			
					<!-- end of body --> 
					</div>
				</div>
			</div>
			<!-- end inner page content box background --> 
		</div>
		<!-- end of class content -->
		<jsp:include page="../inc/bottom2.jsp"/>
	</div>
	<!-- end of ID content--> 
</div>
</body>
</html>