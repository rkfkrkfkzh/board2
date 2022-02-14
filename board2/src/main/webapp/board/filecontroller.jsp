<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
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
		// 1. 파일이름 가져오기 
		String filename = request.getParameter("file");
	
		// 3. 해당파일 자바로 가져오기 
		File file = new File( "C:/Users/User/git/jsp/board2/src/main/webapp/upload/"+filename);
		
		// 4. 첨부파일 형식으로 열기 [ 브라우저 마다 다름 ]
		response.setHeader("Content-Disposition", "attachment;filename="+filename+";");
						   //  형식 ,  첨부파일 이름
						   
		// 5. 입출력 스트림 [ 바이트 단위 ]
		byte[] b = new byte[ (int)file.length() ];
							// 파일의크기만큼 바이트배열 생성
		// 6. 출력 스트림으로 내보내기 
		if( file.isFile() ){
			
			// 입력스트림 
			BufferedInputStream fin = new BufferedInputStream( new FileInputStream(file));
			// 출력스트림 
			BufferedOutputStream fout = new BufferedOutputStream( response.getOutputStream() );
			
			int count ; 
			while(  (count=fin.read(b)) != -1 ){   // 입력스트림에 바이트가 없을때 까지 읽어오기 
				fout.write( b , 0 , count );
			}
		
			fout.close();	// 출력 스트림 종료 
			fin.close();	// 입력 스트림 종료 
			
			
			
			
			
			
			
				
			
		}
		
		
					
		
		
	%>

<%@include file="/footer.jsp" %>

</body>
</html>