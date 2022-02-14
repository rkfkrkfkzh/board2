<%@page import="java.io.PrintWriter"%>
<%@page import="DAO.BoardDao"%>
<%@page import="DTO.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>

	
	<%
		int id = Integer.parseInt( request.getParameter("id") );
		BoardDao dao = BoardDao.getinstance();
		BoardDto dto = dao.getboard(id);
		int result =  dao.deleteboard( id );
		
		if( result == 1 ){  
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('글 삭제 되었습니다 .');");
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
		else{	
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('글 삭제 오류 [ 관리자에게 문의 ] .');");
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
	%>



	


</body>
</html>