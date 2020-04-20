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
	<%
		request.setCharacterEncoding("utf-8");
		String search=request.getParameter("search");
		BoardDAO boardDAO = new BoardDAO();
		int count=boardDAO.getCount(search);
		int pageSize = 15;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
		    pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize;
		List<BoardBean> list = null;
		if(count > 0){
		    list = boardDAO.getBoardList(startRow, pageSize,search);
		}
	%>
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
		<article>
			<h1>Notice[전체 글개수 : <%=count %>]</h1>
			<table id="notice">
				<tr>
					<th class="tno">No.</th>
					<th class="ttitle">Title</th>
					<th class="twrite">Writer</th>
					<th class="tdate">Date</th>
					<th class="tread">Read</th>
				</tr>
		<%
			if(count > 0){
				for(int i=0;  i<list.size(); i++){
					BoardBean bean = list.get(i);
		%>			
				<tr onclick="location.href='content.jsp?num=<%=bean.getNum()%>&pageNum=<%=pageNum%>'">
					<td><%=bean.getNum()%></td>
					<td class="left">
					<%
						int wid = 0;
						if(bean.getRe_lev() > 0){
							wid = bean.getRe_lev()*10;
					%>
					<img src="../images/level.gif" width="<%=wid%>" height="15">
					<img src="../images/re.gif">
					<%}%>
						<%=bean.getSubject() %>
					</td> 
					<td><%=bean.getName() %></td>
					<td><%= new SimpleDateFormat("yyyy/MM/dd").format(bean.getDatetime())%></td>
					<td><%=bean.getReadcount() %></td>
				</tr>	
		<%						
				}
			}else{
		%>		
				<tr>
					<td colspan="5" align="center">게시판 글 없음</td>	
				</tr>
		<%		
			}
		%>
			</table>
		<%
				String id = (String)session.getAttribute("id");
				if(id != null){
		%>		
					<div id="table_search"> 
						<input type="button" value="글쓰기" class="btn" onclick="location.href='write.jsp'">
					</div>		
		<%	
				}
		%>
					<div id="table_search">
						<form action="noticeSearch.jsp">
							<input type="text" name="search" class="input_box">
							<input type="submit" value="검색" class="btn">
						</form>
					</div>
			<div class="clear"></div>
			<div id="page_control">
		<%
				if(count>0){
					int pageCount = count/pageSize + (count%pageSize==0?0:1);
					int pageBlock = 5;
					int startPage = ((currentPage/pageBlock)-(currentPage%pageBlock==0?1:0))*pageBlock+1;
					int endPage = startPage+pageBlock-1;
					if(endPage> pageCount){
						endPage = pageCount;
					}
					if(startPage > pageBlock){
						%>
							<a href="noticeSearch.jsp?pageNum=<%=startPage-pageBlock%>&search=<%=search %>">[이전]</a>
						<%
					}
					for(int i=startPage;i<=endPage;i++){
						%>
							<a href="noticeSearch.jsp?pageNum=<%=i%>&search=<%=search%>">[<%=i %>]</a>
						<%
					} 
					if(endPage < pageCount){
						%>
							<a href="noticeSearch.jsp?pageNum=<%=startPage+pageBlock%>&search=<%=search%>">[다음]</a>
						<%
					}
				}
				%>
				
			</div>
		</article>
</div>
					<!-- end of body --> 
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