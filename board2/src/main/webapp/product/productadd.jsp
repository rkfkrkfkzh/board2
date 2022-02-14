<%@page import="java.io.PrintWriter"%>
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
			//include의 menu에 user 세션이 존재 
		if( !user.equals("admin") ){
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('일반회원은 접근 불가.');");
			script.println("location.href ='/board2/main.jsp'");
			script.println("</script>");
		}

	%>
	
	<div class="container">
		
		<div class="col-md-3">
			<%@include file="adminsidebar.jsp" %>
		</div>
		<div class="col-md-1"></div>
		
		<div class="col-md-5">
		
			<form name="addform" onsubmit="return checkadd2()" method="post" action="productaddcontroller.jsp" enctype="multipart/form-data">
				<div class="form-group row">
						<label>상품명</label>
						<div>
							<input type="text" name="name" class="form-control">
						</div>
				</div>
				
				<div class="form-group row">
						<label>상품가격</label>
						<div>
							<input type="text" name="price" class="form-control">
						</div>
				</div>
				
				<div class="form-group row">
						<label>제조사</label>
						<div>
							<input type="radio" name="manufacturer" value="나이키"> 나이키
							<input type="radio" name="manufacturer" value="아디다스"> 아디다스
							<input type="radio" name="manufacturer" value="휠라"> 휠라
						</div>
				</div>
				
				<div class="form-group row">
						<label>카테고리</label>
						<div>
							<input type="radio" name="category" value="신발"> 신발
							<input type="radio" name="category" value="가방"> 가방
							<input type="radio" name="category" value="의류"> 의류
						</div>
				</div>
				
				<div class="form-group row">
						<label>재고</label>
						<div>
							<input type="text" name="stock" class="form-control">
						</div>
				</div>
				
				<div class="form-group row">
						<label>신상여부 </label>
						<div>
							<input type="radio" name="conditions" value="1"> 신제품
							<input type="radio" name="conditions" value="2"> 기존제품
						</div>
				</div>
				
				<div class="form-group row">
						<label>사진</label>
						<div>
							<input type="file" name="file" class="form-control">
						</div>
				</div>
				
				<div class="form-group row">
						<div class="col-md-5"></div>
						<input type="submit" value="  제  품  등  록  " class="btn btn-primary">
				</div>

				
			</form>
		</div>
	
	</div>

	<%@include file="/footer.jsp" %>


</body>
</html>