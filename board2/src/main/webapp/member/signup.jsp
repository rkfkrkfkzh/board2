<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	
	<style type="text/css">
	.login-box{
	
		margin-top: 75px;
		height: auto;
		text-align: center;
		box-shadow: 0 3px 6px black;

	}
	
	.login-key{
		height: 100px;
		font-size: 80px;
		line-height: 100px;
		background-image: url("/board2/img/mainlogo2.png");
		background-repeat: no-repeat;
		background-position: center;
	}
	
	.login-title{
		margin-top: 15px;
		text-align: center;
		font-size: 30px;
		letter-spacing: 2px;
		font-weight: bold;
	}
	
	.login-form{
		margin-top: 25px;
		text-align: left;
	}
	input[type=text]{
		
		border: none;
		border-bottom: 2px solid blue;
		font-weight: bold;
		margin-bottom: 20px;
		
	}
	input[type=password]{
		border: none;
		border-bottom: 2px solid blue;
		font-weight: bold;
		margin-bottom: 20px;
	}
	.form-group{ margin-bottom: 40px; }
	
	.form-control:focus{
		border-bottom: 4px solid blue;
		box-shadow: none;
	}
	.form-control-label{
		font-size: 10px;
		color : #cccccc;
		font-weight: bold;
		letter-spacing: 1px;
	}
	.btn-outline-primary{
		
		color: blue;
		font-weight: bold;
		letter-spacing: 1px;
		box-shadow: 0 1px 3px black;
	}
	.btn-outline-primary:hover{
		background-color:#0DB8DE;
	}
	.login-btm{
		float: left;
	}
	.login-button{
		margin-bottom: 30px;
		text-align: right;
	
	}
	.login-text{
		text-align: left;
		font-weight: bold;
	}
	
	
	
	
	
	</style>


<title>Insert title here</title>
</head>
<body>

	<%@include file="/menu.jsp" %>
	
	
		<%
			//include의 menu에 user 세션이 존재 
		if( user !=null ){
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되었습니다 .');");
			script.println("location.href ='/board2/main.jsp'");
			script.println("</script>");
		}

		%>
	
	
	<div class="container">
	
		<div class="row">
			<div class="col-lg-3 col-md-2"></div> <!--  공백 -->
			
				<div class="col-lg-6 col-md-8 login-box">
				
					<div class="col-lg-12 login-key">
						<i class="fa fa-key" aria-hidden="true"></i>
					</div>
					
					<div class="col-lg-12 login-title">
						Member SignUp
					</div>
						<div class="col-lg-12 login-form">
							<form name="signupform" method="post" action="signupcontroller.jsp" onsubmit="return checkadd()">
								<div class="form-group">
									<label class="form-control-label">USER ID [필수]</label>
									<input type="text" class="form-control" maxlength="30" name="id">
								</div>
								
								<div class="form-group">
									<label class="form-control-label">Password [필수]</label>
									<input type="password" class="form-control" maxlength="30" name="password">
								</div>
								
								<div class="form-group">
									<label class="form-control-label">Password Check</label>
									<input type="password" class="form-control" maxlength="30" name="passwordcheck">
								</div>
								
								
								<div class="form-group">
									<label class="form-control-label">USER NAME [필수]</label>
									<input type="text" class="form-control" maxlength="30" name="name">
								</div>
								
								<div class="form-group">
									<label class="form-control-label">Phone</label>
									<input type="text" class="form-control" maxlength="30" name="phone">
								</div>
								
								<div class="form-group">
									<label class="form-control-label">E-mail</label>
									<input type="email" class="form-control" maxlength="30" name="email">
								</div>
						
								<div class="form-group">
									<label class="form-control-label">Address</label><br>
									<input type="text" id="sample4_postcode" placeholder="우편번호" name="address1">
									<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="address2">
									<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="address3">
									<span id="guide" style="color:#999;display:none"></span>
									<input type="text" id="sample4_detailAddress" placeholder="상세주소" size="43" name="address4">
								</div>						
								
								<div class="col-lg-12 loginbttm">
									<div class="col-lg-6 login-btm login-text">	
										<% 
											String cancel = request.getParameter("cancel");
											if( cancel !=null ){
										%>	
											[회원가입 실패] 동일한 아이디가 존재합니다.
										<%
										}
											
										%>
										<!-- 회원가입 실패시  -->
									</div>
									
									<div class="col-lg-6 login-btm login-button">
										<button type="submit" class="btn btn-outline-primary"> SignUp </button>
									</div>
								</div>
								
							</form>
							
						</div>
				</div>
		</div>
	</div>
	
	
	

	


	<%@include file="/footer.jsp" %>




</body>
</html>