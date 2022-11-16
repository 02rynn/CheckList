<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.Book"%>
<%@ page import="dao.BookDao"%>
<%@ page import="dao.DataDao"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>

<head>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>checkList</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<style>
.swiper-container {
	height: 250px;
	border: 5px solid silver;
	border-radius: 7px;
	box-shadow: 0 0 20px #ccc inset;
}

.swiper-slide {
	text-align: center;
	display: flex;
	/* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items: center;
	/* 위아래 기준 중앙정렬 */
	justify-content: center;
	/* 좌우 기준 중앙정렬 */
}

.swiper-slide img {
	box-shadow: 0 0 5px #555;
	max-width: 90%;
	/* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}
*{
        font-family :-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
                Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
                font-weight: 500;
        }

</style>
</head>

<body>
<%@ include file="navBar.jsp"%>

<div>
			<div style="height: 20%; display: inline-block; width: 100%;">
			
				<div class="container text-center">
				<%
				
				String category = request.getParameter("category");
				DataDao dao = new DataDao();
				

				List<Book> asd = dao.selectBookByCategory(category);
				
				for(int i = 0 ; i < (asd.size()/5)+1 ;i++){
					Book bk2 = asd.get(i*4);
					Book bk3 = asd.get(i*4+1);
					Book bk4 = asd.get(i*4+2);
					Book bk5 = asd.get(i*4+3);
					Book bk6 = asd.get(i*4+4);
				
				%>
					<div class="row">
						<div class="col"
							style="width: 10% display: inline-block; padding: 15px;">
							<img src=<%=bk2.getThumbnail() %> class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text"><%=bk2.getTitle()%> </p>
							</div>
							<p><%=bk2.getPrice()%>원</p>
						</div>
						<div class="col"
							style="width: 10%; display: inline-block; padding: 15px">
							<img src=<%=bk3.getThumbnail() %> class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text"><%=bk3.getTitle()%></p>
							</div>
							<p><%=bk3.getPrice()%>원</p>
						</div>
						<div class="col"
							style="width: 10%; display: inline-block; padding: 15px">
							<img src=<%=bk4.getThumbnail() %> class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text"><%=bk4.getTitle()%> </p>
							</div>
							<p><%=bk4.getPrice()%>원</p>
						</div>
							<div class="col"
							style="width: 10%; display: inline-block; padding: 15px">
							<img  src=<%=bk5.getThumbnail() %> class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text"><%=bk5.getTitle()%></p>
							</div>
							<p><%=bk5.getPrice()%>원</p>
						</div>	
						<div class="col"
							style="width: 10%; display: inline-block; padding: 15px">
							<img  src=<%=bk6.getThumbnail() %> class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text"><%=bk6.getTitle()%> </p>
							</div>
							<p><%=bk6.getPrice()%>원</p>
						</div>
					</div>
					<%
					
				}
					
					
					%>
					
					


				</div>

			</div>
		</div>






	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous">
    </script>


</body>

</html>