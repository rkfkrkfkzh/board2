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
		String realFolder = "C:/Users/User/git/jsp/board2/src/main/webapp/upload";
		
		// MultipartRequest : cos 라이브러리에서 제공 
		MultipartRequest multi = new MultipartRequest( request , realFolder , 1024*1024*10 , "UTF-8" , new DefaultFileRenamePolicy() );
													// 요청방식 ,   , 저장위치 , "파일최대용량" , "인코딩" , "보안 : "
																									// DefaultFileRenamePolicy() : 업로드시 중복된 파일명 제거 
		request.setCharacterEncoding("UTF-8"); // 요청할때 데이터를 한글로 인코딩
	
		// 첨부파일 사용시 enctype : 타입으로 변경 
		int id = Integer.parseInt( multi.getParameter("id") );
		String title =  multi.getParameter("title") ;
		String contents =  multi.getParameter("contents") ;
		String file =  multi.getFilesystemName("file");
		
		if( file == null ){
			file = multi.getParameter("file2"); // 기존 파일로 다시 넣어주기
		}
	
		BoardDao dao = BoardDao.getinstance();
		
		int result =  dao.updateboard(title, contents, file, id);
		
		if( result == 1 ){  
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('글 수정 되었습니다 .');");
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
		else{	
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('글 수정 오류 [ 관리자에게 문의 ] .');");
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
	%>


	<%@include file="/footer.jsp" %>
	


</body>
</html>