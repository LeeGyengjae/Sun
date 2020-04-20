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
	<script type="text/javascript">
	
	function Check(f) {
		var cnt = f.elements.length;
		var filecnt = 1;	
		for(i=0; i<cnt; i++){
			if(f.elements[i].type == "file"){
				if(f.elements[i].value == ""){
					var msg = filecnt + "번쨰 파일정보가 누락되었습니다.\n 올바른 선택을 해주세요";
					alert(msg);
					f.elements[i].focus();
					return;
				}			
				filecnt++;		
			}	
		}
		f.submit();
	}//Check함수끝
	
		</script>
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
	if(id==null){
		response.sendRedirect("../member/login.jsp");
	}

	%>		
<article>
	<h1>Notice Write</h1>
	<form action="writePro.jsp" method="post" name="f" enctype="multipart/form-data">
		<table id="notice">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=id %>" readonly="readonly"> </td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="passwd"> </td>
		</tr>
		<tr>
			<td>글제목</td>
			<td><input type="text" name="subject"> </td>
		</tr>
		<tr>
		<td>첨부파일</td> 
		<td><input type="file" name="file"></td> 
		</tr>
		<tr>
			<td>글내용</td>
			<td><textarea rows="13" cols="40" name="content"></textarea></td>
		</tr>
		</table>
	<div id="table_search">
		<input type="submit" value="글쓰기" class="btn">
		<input type="reset" value="다시작성" class="btn">
		<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp'">
	</div>	
	</form>
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