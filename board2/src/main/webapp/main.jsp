<%@page import="DTO.ProductDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ProductDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


	<style type="text/css">
	
		.goodslist_tit{
			margin-top: 100px;
			margin-bottom: 60px;
			text-align: center;
		}
		.goodslist_detail{
			color: gray;
			margin-top: 15px;
			padding-bottom: 15px; /* 테두리 위치 */
			border-bottom: 3px solid orange;
		}
		ul{
			margin-top: 20px;
			margin-bottom: 20px;
		}
		ul .main_li{
			margin-right: 18px;
			list-style: none;
			float: left;
			margin-top: 30px;	
		}
		ul .main_li img{
			width: 250px;
			height: 320px;
			border-radius: 5%; /* 모서리 곡선 */
			border: solid 1px gray;
			margin-bottom: 15px;
		}
		ul .main_li img:hover{  /* 마우스 올렸을때 */
			transform: scale( 1.1 ) /*확대*/
		}
		ul .main_li .goods_info{
			width: 250px;
		}
		ul .main_li .goods_info .name{
			line-height: 1.5em;
			font-size: 18px;
			display: block;
		}
		ul .main_li .goods_info .name a{
			text-decoration: none;
		}
		
		ul .main_li .goods_info .manufacturer{
			line-height: 1.5em;
			color: gray;
		}
		
		ul .main_li .goods_info .price{
			line-height: 1.5em;
			text-align : right;
			color: black;
			display: block;
		}
		
		/* 캐러셀 왼쪽/오른쪽 그라이데이션 제거 */
		.carousel-control{
			background: none !important;  /* !important : 효과가 겹칠경우 최우선 */
		}
	</style>



<title>Insert title here</title>
</head>
<body>

	<%@include file="/menu.jsp" %>

		<%// 천단위 쉼표 만들기 = 형식 클래스 [DecimalFormat ] %>
	<% DecimalFormat df = new DecimalFormat("###,### 원"); %>


	<%
		ProductDao dao = ProductDao.getinstance();
		ArrayList<ProductDto> list = dao.productalllist();
	
	%>
	
	<!-- 사진 슬라이드 = 부트스트랩 캐러셀  -->
	
		<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="5000" >
																				<!-- 사진 지나가는 3000=3초 -->
		
			<ol class="carousel-indicators">
			
				<li data-target="#myCarousel" data-slie-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slie-to="1" ></li>
				<li data-target="#myCarousel" data-slie-to="2" ></li>
			</ol>

				<div class="carousel-inner">
				
					<div class="item active">
							<a href="#"><img alt="" src="img/메인배너1.png" class="img-responsive center-block"> </a>
					</div>
					
					<div class="item">
							<a href="#"><img alt="" src="img/메인배너2.jpg" class="img-responsive center-block"></a>
					</div>
					
					<div class="item">
							<a href="#"><img alt="" src="img/메인배너3.jpg" class="img-responsive center-block"></a>
					</div>	
				</div>
				
				
				<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				
					<span class="glyphicon glyphicon-chevron-left"></span>
				
				</a>
				
				<a class="right carousel-control" href="#myCarousel" data-slide="next">
				
					<span class="glyphicon glyphicon-chevron-right"></span>
				
				</a>
		</div>
		<!-- 제품 -->
		
		<div class="container">
			<div class="goodslist" id="goodslist_best"> 
				<div class="goodslist_tit"> <!--  제목  -->
				
					<h3> 베스트 상품 </h3>
					<span class="goodslist_detail"> 멀티샵 BEST 상품들을 만나보세요.</span>
					
				</div>
				
				<ul> 
					<% for( int i = 0 ; i<list.size() ; i++ ) {
					
						ProductDto dto = list.get(i);
					%>

					<li class="main_li"> <!--  하나 상품 -->
						<a href="#"><img alt="" src="upload/<%=dto.getProduct_file()%>"> </a>
						<div class="goods_info">
							<span class="manufacturer"> <%=dto.getProduct_manufacturer() %> </span>
							<span class="name"> <a href="#"> <%=dto.getProduct_name() %> </a> </span> 
							<span class="price"> 
									<%=df.format(dto.getProduct_price()) %>
							</span>
						</div>
					</li>
					<%
					}
					%>
				</ul>
				
			</div>
		
		</div>
		

	<%@include file="/footer.jsp" %>


</body>
</html>