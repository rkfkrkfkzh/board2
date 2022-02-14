
<%@page import="DAO.ReplyDao"%>
<%@page import="DTO.ReplyDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
<%@include file="/menu.jsp" %>
	
	<%

		// 1. 업로드 파일은 서버에 저장 
												// DefaultFileRenamePolicy() : 업로드시 중복된 파일명 제거 
		request.setCharacterEncoding("UTF-8"); // 요청할때 데이터를 한글로 인코딩
	
	
		// 2. 파일명은 DB 저장 
		String contents = request.getParameter("contents"); // input name 
		int id = Integer.parseInt( request.getParameter("id") ) ; // input name 

		ReplyDao replyDao = ReplyDao.getinstance();
		ReplyDto replyDto = new ReplyDto();
		
		replyDto.setReply_boardid( id  );
		replyDto.setReply_contents( contents );
		replyDto.setReply_userid("유재석");
		
		int result = replyDao.re_write(replyDto);

		if( result == 1 ){  
			
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('댓글 등록이 되었습니다 .');");
			script.println("location.href ='boarddetail.jsp?id="+id+"'");
			script.println("</script>");
		
			/* response.sendRedirect("boarddetail.jsp?id="+id); */
			
		}
		else{
			
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('댓글 등록 오류 [ 관리자에게 문의 ] .');");
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
		
	
	%>


<%@include file="/footer.jsp" %>
	


</body>
</html>