
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>

	<%
			// 세션 초기화 
			
			//1.모든 세션 초기화
				//session.invalidate(); 
			
			//2.
				session.setAttribute("user", null);
			
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('로그아웃 되었습니다 .');");
			script.println("location.href ='/board2/main.jsp'");
			script.println("</script>");
			
	
	
	%>


</body>
</html>