<%@page import="comment.CommentBean"%>
<%@page import="java.util.List"%>
<%@page import="comment.CommentDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="../inc/head2.jsp"/>
	<%
	request.setCharacterEncoding("UTF-8");
	int num =  Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum"); 
	BoardDAO dao = new BoardDAO();
	dao.updateReadCount(num); 
	BoardBean boardBean = dao.getBoard(num);
	int DBnum = boardBean.getNum(); 
	int DBReadcount = boardBean.getReadcount(); 
	String DBName = boardBean.getName();
	Timestamp DBDate = boardBean.getDatetime(); 
	String DBSubject = boardBean.getSubject();
	String DBContent = "";
	
	String DBFile;
	String DBRealFile;
	if(boardBean.getFile()==null){
		DBFile = "";
		DBRealFile = "";
	}else{
		DBFile = boardBean.getFile();
		DBRealFile = boardBean.getRealfile();
	}
	
	if(boardBean.getContent() != null){
		DBContent = boardBean.getContent().replace("\r\n", "<br>");
	}
	int DBRe_ref = boardBean.getRe_ref();
	int DBRe_lev = boardBean.getRe_lev();
	int DBRe_seq = boardBean.getRe_seq();
	
	CommentDAO commentDAO = new CommentDAO(); 
	int count = commentDAO.getCommentCount(num); // 몇번째 댓글?
	int currentPage = Integer.parseInt(pageNum);
	
	
	List<CommentBean> list = null;  
	if(count > 0){ 
		list = commentDAO.getCommentList(DBnum);
	} 
%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function writeCmt(){
	var _content = $("#comment_content").val();
	var _id = $("#comment_id").val();
	var _board_num = $("#comment_board").val();
	if(_id == "null"){
		alert("로그인이 필요합니다.");
		return;
	}
	if(_content == ''){
		alert("댓글을 입력하세요.");
		return;
	}
	$.ajax({
		type:"post",
		async:false,
		url:"http://localhost:8090/Sun/AddComment",
		dataType:"xml",
		data:{id:_id,content:_content,board_num:_board_num},
		success:function(data,textStatus){
			location.href = location.href;
		}
	}); //ajax끝
}

function deleteCmt(_dbnum){
	if(_id == "null"){
		alert("로그인이 필요합니다.");
		return;
	}
	var _dbid = $("#comment_id").val();
	var _num = _dbnum;
	var _id = _dbid;
	
	
	$.ajax({
		type:"post",
		async:false,
		url:"http://localhost:8090/Sun/DeleteComment",
		dataType:"text",
		data:{id:_id,num:_num},
		success:function(data,textStatus){
			location.href = location.href;
			if(data == 'good'){
			}else{
				alert("댓글 쓴 본인만 지울 수 있습니다.");
			}
			
		}
	}); //ajax끝
	
	
	
}

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
			<article>
			<h1>Notice Content</h1>
			<table id="notice">
				<tr>
					<td>글번호</td>
					<td><a name="num"><%=DBnum%></a></td>
					<td>조회수</td>
					<td><%=DBReadcount%></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%=DBName%></td>
					<td>작성일</td>
					<td><%=new SimpleDateFormat("yyyy.MM.dd").format(DBDate)%></td>
				</tr>		
				<tr>
					<td>글제목</td>
					<td colspan="3"><%=DBSubject%></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td colspan="3"><a name="file" href="download.jsp?path=upload&name=<%=DBRealFile%>"><%=DBFile%></a> </td>
				</tr>	
				<tr>
					<td>글내용</td>
					<td colspan="3" height="300"><%=DBContent%></td>
				</tr>				
			</table> 
		<div id="table_search">
		<%
			String id = (String)session.getAttribute("id");
		%>
	<!-- 댓글 부분 -->
	<div id="comment">
		<h4>Comment[전체 댓글개수 : <%=count %>]</h4>
        <table id="commentDB">
        <tr>
			<th class="tno">작성자</th>
			<th class="ttitle" colspan="2">내용</th>
			<th class="twrite">작성날짜</th>
		</tr>
        <%
			if(count > 0){
				for(int i=0;  i<list.size(); i++){
					CommentBean bean = list.get(i);
		%>
            <tr>
	                <td id="notice">
	                    <div id="DBcomment_id"><%=bean.getId()%></div>
	                </td>
	                <td width="600" id="DBcomment_content_td">
	                    <div id="DBcomment_content"><%=bean.getContent() %></div>
	                </td>
	                <td>
	                	<div>
	                		<p id="deletebtn"><a onclick="deleteCmt(<%=bean.getNum()%>)">삭제</a></p>
	                	</div>
	                </td>
	                <td>
	                	<%=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a").format(bean.getDate()) %>
	                </td>
            </tr>
          <%			 			
				}
			}else{
		%>		
				<tr>
					<td colspan="5" align="center">댓글 없음</td>	
				</tr>
		<%		
			}
		%>
        </table>
    </div>
    <div id="comment">
        <table>
            <tr bgcolor="#F5F5F5">
            <input type="hidden" id="comment_board" value=<%=DBnum%>>
            <input type="hidden" id="comment_id" value=<%=id %>>
				
                <td id="notice">
                    <div>
                        <%=id %>
                    </div>
                </td>
                <!-- 본문 작성-->
                <td width="550">
                    <div>
                        <textarea id="comment_content" name="comment_content" rows="4" cols="70" ></textarea>
                    </div>
                </td>
                <!-- 댓글 등록 버튼 -->
                <td width="100">
                    <div id="btn" style="text-align:center;">
                        <p><a onclick="writeCmt()">[등록]</a></p>    
                    </div>
                </td>
            </tr>
        </table>
    </div>
			<input type="button" value="글수정" class="btn" 
			onclick="location.href='update.jsp?num=<%=DBnum%>&pageNum=<%=pageNum%>'">
			<input type="button" value="글삭제" class="btn"
			onclick="location.href='delete.jsp?num=<%=DBnum%>&pageNum=<%=pageNum%>'">
			<input type="button" value="답글쓰기" class="btn"
			onclick="location.href='reWrite.jsp?num=<%=DBnum%>&re_ref=<%=DBRe_ref%>&re_lev=<%=DBRe_lev%>&re_seq=<%=DBRe_seq%>'">
			<input type="button" value="글목록" class="btn" 
		onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'">
		</div>
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