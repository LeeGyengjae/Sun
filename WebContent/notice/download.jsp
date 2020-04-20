<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String filename = request.getParameter("name");
	String path = request.getParameter("path");
	String realFolder =  getServletContext().getRealPath(path);
	System.out.println(path);
	System.out.println(realFolder);
	String filePath = realFolder + "\\" + filename;
	try{
		out.clear();
		out = pageContext.pushBody();
		File file = new File(filePath);
		byte b[] = new byte[4096];
		response.reset();
		response.setContentType("application/octet-stream");
		String Encoding = new String(filename.getBytes("UTF-8"),"8859_1");
		response.setHeader("Content-Disposition", "attatchment; filename = " + Encoding);
		FileInputStream is = new FileInputStream(filePath);
		ServletOutputStream sos = response.getOutputStream();
		int numRead;
		while((numRead = is.read(b,0,b.length))!=-1){
			sos.write(b,0,numRead);
		}
		sos.flush();
		sos.close();
		is.close();
	}catch(Exception err){
		err.printStackTrace();
	}
 
%>




</body>
</html>



