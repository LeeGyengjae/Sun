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
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");				
%>
		<!-- 게시판 -->
		<article>
			<h1>Notice DELETE</h1>
		<form action="deletePro.jsp?pageNum=<%=pageNum%>" method="post">
			<input type="hidden" name="num" value="<%=num%>">
			<table id="notice">
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="passwd"></td>
				</tr>					
			</table>	
			<div id="table_search">
				<input type="submit" value="글삭제" class="btn"> 
				<input type="reset" value="다시작성" class="btn">
				<input type="button" value="글목록" class="btn" 
					   onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'">
			</div>
		</form>	
			<div class="clear"></div>		
		</article>
		<!-- 게시판 -->
		<!-- 본문들어가는 곳 -->
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp"/>
		<!-- 푸터들어가는 곳 -->
	</div>
			
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