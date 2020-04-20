<%@page import="gallery.GalleryDAO"%>
<%@page import="java.util.List"%>
<%@page import="gallery.GalleryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../inc/head2.jsp"/>
</head>
<body>
	<div id="page">
	<jsp:include page="../inc/slider2.jsp"/>
	<div id="content"> 
		<div class="header">
					<div class="footer">
			<!-- start of header -->
			<jsp:include page="../inc/top2.jsp"/>
			<!-- end of header --> 
			<!-- start of class content -->
					<div class="body">
	
			<div id="notice">
			<div>
				
				<ul>
			<%
			GalleryDAO galleryDAO = new GalleryDAO();  
			int count = galleryDAO.getGalleryCount();
			int pageSize = 9;
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null){
				pageNum="1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage -1 )* pageSize;
			List<GalleryBean> list = null; 
			if(count > 0){
				list = galleryDAO.getGalleryList(startRow, pageSize);
			}
		%>
		<article>
			<h2>Gallery[전체 글개수 : <%=count %>]</h2>
			<table id="notice">
      <%
            if(count > 0){
               %><tr>
               <%int f=0;
            for(int i=0;i<list.size();i++){
               GalleryBean gallerybean = list.get(i);
               f++;
            if(!(f%3==0)){ 
               %>
               <td  onclick="location.href='gcontent.jsp?num=<%=gallerybean.getNum()%>&pageNum=<%=pageNum%>'">
               <img src="../upload/<%=gallerybean.getFile() %>" width="250" height="250">
               </td>
               <%  }else{//if문 종료 %>
                     <td  onclick="location.href='gcontent.jsp?num=<%=gallerybean.getNum()%>&pageNum=<%=pageNum%>'">
                        <img src="../upload/<%=gallerybean.getFile() %>" width="250" height="250">
                     </td> 
                  </tr>
                  <tr>
               <%
               }
               }//for문 종료%><% 
            }else{
            %>
               <tr>
                  <td colspan="5">게시판 글 없음</td>   
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
						<input type="button" value="글쓰기" class="btn" onclick="location.href='gwrite.jsp'">
			</div>
				<%
					}
				%>
			<div id="table_search">
				<input type="text" name="search" class="input_box"> 
				<input type="button" value="검색" class="btn">
			</div> 
			<div class="clear"></div>
			<div id="page_control">
			
			<%
				if(count > 0){
						int pageCount = count/pageSize + (count%pageSize==0?0:1);
						int pageBlock = 3;
						int startPage = ((currentPage/pageBlock)-(currentPage%pageBlock==0?1:0)) * pageBlock + 1;
						int endPage = startPage + pageBlock - 1;
						if(endPage > pageCount){
							endPage = pageCount;
						}
						if(startPage > pageBlock){
						%>
							<a href="gallery.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
						<%
						}
						for(int i = startPage; i<=endPage; i++){
						%>
							<a href="gallery.jsp?pageNum=<%=i %>">[<%=i %>]</a>
						<%
						}
						if(endPage<pageCount){
						%>
							<a href="gallery.jsp?pageNum=<%=startPage+pageBlock %>">[다음]</a>
						<%
						}
						
						
						
				}
					
					%>
			
		
		
			</div>
		</article>
		</ul>
		</div>
		</div>
		</div>
		</div>
		<!-- 게시판 -->
		<!-- 본문들어가는 곳 -->
		<div class="clear"></div>
		
	</div>
			
			
			
			<!-- end of class content -->
			<jsp:include page="../inc/bottom2.jsp"/>
		</div>
	</div>
</body>
</html>