<%@page import="DAO.MemberDao"%>
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

		request.setCharacterEncoding("UTF-8"); // 요청할때 데이터를 한글로 인코딩
	
		// 첨부파일 사용시 enctype : 타입으로 변경 
		
		// 2. 파일명은 DB 저장 
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		String address4 = request.getParameter("address4");
		String address = address1 +"/"+address2+"/"+address3+"/"+address4;
		
		MemberDto dto = new MemberDto();
		dto.setMember_id(id);
		dto.setMember_password(password);
		dto.setMember_name(name);
		dto.setMember_phone(phone);
		dto.setMember_email(email);
		dto.setMember_address(address);
		
		MemberDao dao = MemberDao.getinstance();
		
		int result =  dao.signup(dto);
		
		if( result == 1 ){  
			
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 성공 되었습니다 .');");
			script.println("location.href ='/board2/main.jsp'");
			script.println("</script>");
		}
		else{
			
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("location.href ='/board2/member/signup.jsp?cancel=1'");
			script.println("</script>");
		}
	
	%>

<%@include file="/footer.jsp" %>

	


</body>
</html>