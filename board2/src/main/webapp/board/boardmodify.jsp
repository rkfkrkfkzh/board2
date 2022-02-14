<%@page import="java.io.File"%>
<%@page import="DTO.BoardDto"%>
<%@page import="DAO.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>



<title>Insert title here</title>
</head>
<body>

	<%@include file="/menu.jsp" %>


	<%	// 해당 아이디에 해당하는 dto
		int id = Integer.parseInt( request.getParameter("id") );
		BoardDao dao = BoardDao.getinstance();
		BoardDto dto = dao.getboard(id);
	%>

	<!-- 부트스트랩 테이블  -->
	<div class="container">
		<div>
			<form action="boardmodifycontroller.jsp?id=<%=id %>" method="post" enctype="multipart/form-data">
			
				<table class="table table-striped" style="text-align: center; border: 1px">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;"> 게시물 수정 </th>
						</tr>	
					</thead>
					
					<tbody> 
						<tr>
							<td> <input type="text" name="title" placeholder="글 제목" class="form-control" maxlength="40" value="<%=dto.getTitle()%>"></td>
						</tr>
							
						<tr>
							<td> <textarea name="contents" placeholder="글 내용" class="form-control" maxlength="3000" 
									style="height: 400px;"><%=dto.getContents() %></textarea> </td>
						</tr>
					</tbody>
					
				</table>
					<input type="file" name="file">
					<input type="hidden" name="file2" value="<%=dto.getFile()%>">
					<input type="submit" value="글 수정" class="btn btn-primary pull-right">
			</form>
		</div>
	</div>
	
	<%@include file="/footer.jsp" %>


</body>
</html>