<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

		<meta http-equiv="content-Type" content="text/html; charset = UTF-8">	<%// html 페이지 속성  %>
		<meta name="viewport" content ="width=device-width  initial-scale = 1 "> <%// 반응형 웹 만들기 %>
		<link rel="stylesheet" href="/board2/css/bootstrap.css">	<%// 링크 스타일 %>
		
		<style type="text/css">
		
		@font-face {
    font-family: 'CookieRunOTF-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/CookieRunOTF-Bold00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
				
				*{
					  font-family: 'CookieRunOTF-Bold';
				
				}
				
				.navbar-nav li a{
					font-size: 20px;
					color: black;
				}
		
		
		
		</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	
		String user = (String)session.getAttribute("user");
		
	%>

	<nav class="navbar-default" style="background-color: white; margin-top: 30px;">
		<div class="container">
			<div class="navbar-header">
				<a href="/board2/main.jsp"> <img alt="" src="/board2/img/mainlogo2.png" width="100px;" style="margin-right: 50px; margin-top: 10px;"> </a>
			</div>
			<div class="collapse navbar-collapse">
	    			<ul class="nav navbar-nav" >
	    			
						<li class="dropdown">  <!--  드랍다운 시작  -->	
							
							<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button"
								
								aria-haspopup="true" aria-expanded="false"> 나이키 </a>
								
							<ul class="dropdown-menu">
								<li><a href="#"> 모든제품 </a>
								<li><a href="#"> 신발 </a>
								<li><a href="#"> 가방 </a>
							</ul>
						</li> <!--  드랍다운 끝  -->	
						
						<li class="dropdown">	
							<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button"
								
								aria-haspopup="true" aria-expanded="false"> 아이다스 </a>
								
							<ul class="dropdown-menu">
								<li><a href="#"> 모든제품 </a>
								<li><a href="#"> 신발 </a>
								<li><a href="#"> 가방 </a>
							</ul>
						</li> <!--  드랍다운 끝  -->	
						
						<li class="dropdown">	
							<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button"
								
								aria-haspopup="true" aria-expanded="false"> 휠라 </a>
								
							<ul class="dropdown-menu">
								<li><a href="#"> 모든제품 </a>
								<li><a href="#"> 신발 </a>
								<li><a href="#"> 가방 </a>
							</ul>
							
	
						</li> <!--  드랍다운 끝  -->	
					</ul>
					
					<ul class="nav navbar-nav navbar-right" >
					
						
						
						<% if( user ==null ){ %>
						<li><a href="/board2/member/login.jsp"> 로그인 </a> </li>
						<li><a href="/board2/member/signup.jsp"> 회원가입 </a> </li>
						
						<%}else{ %>
							<li style="padding-top : 15px;"> <%=user %> 님  </li>
							<li><a href="/board2/member/logout.jsp" style="font-size: 10px;"> 로그아웃 </a> </li>
							<li><a href="/board2/member/memberinfo.jsp" style="font-size: 10px;"> 회원정보 </a> </li>
							
						<%
							if( user.equals("admin")){
							%> 
								<li><a href="/board2/product/adminpage.jsp"> 관리자 </a> </li>
							<%
							}
						} %>
						<li><a href="/board2/board/board.jsp" style="font-size: 10px;"> 고객센터 </a> </li>
						<li><a href="/board2/board/board.jsp" style="font-size: 10px;"> <img alt="" src="/board2/img/장바구니.png" width="30px;"> </a> </li>
				</ul>
				
			</div>
		</div>
	</nav>
	
	<br>
	<br>
	<br>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="/board2/js/bootstrap.js"></script>

</body>
</html>