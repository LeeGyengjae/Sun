<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<div class="content"> 
			<!-- start inner page content box background -->
			<div class="header">
				<div class="footer">
					<div class="body">
					<!-- start of body -->
	<%
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("../member/login.jsp");
	}
	request.setCharacterEncoding("UTF-8");
	int num =  Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDAO dao = new BoardDAO();
	BoardBean boardBean = dao.getBoard(num);
	int DBnum = boardBean.getNum();
	int DBReadcount = boardBean.getReadcount();
	String DBName = boardBean.getName(); 
	Timestamp DBDate = boardBean.getDatetime();
	String DBSubject = boardBean.getSubject();
	String DBContent = "";
	if(boardBean.getContent() != null){
		DBContent = boardBean.getContent().replace("<br>", "\r\n");
	}
%>
<article>
			<h1>Notice Update</h1>
		<form action="updatePro.jsp?pageNum=<%=pageNum%>" method="post">
			<input type="hidden" name="num" value="<%=num%>">
			<table id="notice">
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%=DBName%>"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="passwd"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" value="<%=DBSubject %>"></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td>
						<textarea name="content" rows="14" cols="40"><%=DBContent %></textarea>
					</td>
				</tr>
			</table>
			
		<div id="table_search">
			<input type="submit" value="글수정" class="btn">
			<input type="reset" value="다시작성" class="btn">
			<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'">
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