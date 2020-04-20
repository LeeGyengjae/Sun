
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
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="bBean" class="board.BoardBean" />
	<jsp:setProperty property="*" name="bBean"/>
	<%
		bBean.setIp(request.getRemoteAddr());
		BoardDAO bdao = new BoardDAO();
		bdao.reInsertBoard(bBean);   
		response.sendRedirect("notice.jsp");
	%>
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