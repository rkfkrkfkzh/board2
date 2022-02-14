<%@page import="DAO.ProductDao"%>
<%@page import="DTO.ProductDto"%>
<%@page import="DTO.MemberDto"%>
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
		
		// 2. 파일명은 DB 저장 
		String name = multi.getParameter("name"); // input name 
		int price = Integer.valueOf( multi.getParameter("price") ); // input name 
		String manufacturer = multi.getParameter("manufacturer"); // input name 
		String category = multi.getParameter("category"); // input name 
		int stock = Integer.valueOf( multi.getParameter("stock") ); // input name 
		int conditions = Integer.valueOf(  multi.getParameter("conditions") ); // input name 
		
				// Integer.parseInt() :  정수로 변환  request 사용가능 
				// Integer.valueOf() : 정수로 변환 multi 사용가능 [ request 값을 객체화 시켜서 요청값 ] 
				
		String file = multi.getFilesystemName("file");
					// filesystemName : 첨부파일명
					
		int activation = 0; // 활성화
		int salesrate = 0 ; // 판매수 
		
		ProductDto productDto = new ProductDto( name , price , manufacturer , category , stock , conditions , file , activation , salesrate  );
		
		ProductDao dao = ProductDao.getinstance();
		
		int result =  dao.productadd( productDto );
		
		if( result == 1 ){  
			
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('제품 등록이 되었습니다 .');");
			script.println("location.href ='productadd.jsp'");
			script.println("</script>");
		}
		else{
			
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('제품 등록 오류 [ 관리자에게 문의 ] .');");
			script.println("location.href ='productadd.jsp'");
			script.println("</script>");
		}
		
	
	%>

<%@include file="/footer.jsp" %>

	


</body>
</html>