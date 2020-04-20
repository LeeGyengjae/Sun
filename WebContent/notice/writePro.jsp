<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("../member/login.jsp");
	}
	
	request.setCharacterEncoding("UTF-8");
	ServletContext ctx = getServletContext();
	String realPath = ctx.getRealPath("/upload");
	int max = 10 * 1024 * 1024;
	MultipartRequest multi 
	= new MultipartRequest(request,realPath,max,"UTF-8",new DefaultFileRenamePolicy());
	
	String name = multi.getParameter("name");
	String passwd = multi.getParameter("passwd");
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	
	
	BoardBean bb = new BoardBean(); 
	bb.setName(name); 
	bb.setPasswd(passwd);
	bb.setSubject(subject);
	bb.setContent(content); 
	bb.setDatetime(new Timestamp(System.currentTimeMillis()));
	bb.setIp(request.getRemoteAddr());
	
	
	
	
	Enumeration e = multi.getFileNames();
	while(e.hasMoreElements()){
		String filename = (String)e.nextElement();
		String file = (String)multi.getOriginalFileName(filename);
		String realfile = (String)multi.getFilesystemName(filename);
		bb.setFile(file);
		bb.setRealfile(realfile);
	}
	
	
	BoardDAO bdao = new BoardDAO();
	bdao.insertBoard(bb); 
		
		response.sendRedirect("notice.jsp");
		

%>
    