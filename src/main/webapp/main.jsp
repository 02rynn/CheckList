<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.Book"%>
<%@ page import="dao.BookDao"%>
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

	<%

    
    %>
	<div style="position: absolute; left: 2.5%; width: 95%;">
		<div
			style="text-align: center; font-size: 30px; font-weight: 200; background-color: #CEE4F5; height: 60px;">
			신간도서</div>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<%
		BookDao dao = new BookDao();
		List<Book> bookList = dao.getAladinItemList("ItemNewAll");

		for(int i = 0 ; i < bookList.size();i++){
			Book bk = bookList.get(i);
		%>
				<div class="swiper-slide">
					<a href="bookDetailByAPI.jsp?isbn=<%=bk.getIsbn() %>"><img src=<%=bk.getThumbnail()%>></a>
					
				</div>
				<%} %>
			</div>

			<!-- 네비게이션 -->
			<div class="swiper-button-next"></div>
			<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
			<div class="swiper-button-prev"></div>
			<!-- 이전 버튼 -->

			<!-- 페이징 -->
			<div class="swiper-pagination"></div>
		</div>
		<div style="justify-items: auto;">
			<div style="float: left; width: 33%;">
				<p class="" style="text-align: center; font-size: 20px;">
					<span text-style-option="fontStyleBold"
						style="color: rgb(34, 34, 34);"><span
						text-style-option="color">BOOKSHOP</span></span>
				</p>
			</div>
			<div style="float: left; width: 33%;">
				<p class="" style="text-align: center; font-size: 20px;">
					<span text-style-option="fontStyleBold"
						style="color: rgb(34, 34, 34);"><span
						text-style-option="color">OPENING HOUR</span></span>
				</p>
			</div>
			<div style="float: left; width: 33%;">
				<p class="" style="text-align: center; font-size: 20px;">
					<span text-style-option="fontStyleBold"
						style="color: rgb(34, 34, 34);"><span
						text-style-option="color">BANK ACCOUNT</span></span>
				</p>
			</div>
		</div>
		<div>
			<div style="height: 20%; display: inline-block; width: 100%;">
				<div
					style="text-align: center; font-size: 30px; font-weight: 200; background-color: #CEE4F5; height: 60px;">
					편집자 추천 도서</div>
				<div class="container text-center">
				<%
				BookDao dao2 = new BookDao();
				List<Book> bookList22 = dao2.getAladinItemList_ItemEditorChoice();
				
				for(int i = 0 ; i < 4;i++){
					Book bk2 = bookList22.get(i*4);
					Book bk3 = bookList22.get(i*4+1);
					Book bk4 = bookList22.get(i*4+2);
					Book bk5 = bookList22.get(i*4+3);
					Book bk6 = bookList22.get(i*4+4);
				
				%>
					<div class="row">
						<div class="col"
							style="width: 15% display: inline-block; padding: 15px;">
							<img src=<%=bk2.getThumbnail() %> class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text"><%=bk2.getContent().substring(0,40)+"..." %> </p>
							</div>
						</div>
						<div class="col"
							style="width: 15%; display: inline-block; padding: 15px">
							<img src=<%=bk3.getThumbnail() %> class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text"><%=bk3.getContent().substring(0,40)+"..." %> </p>
							</div>
						</div>
						<div class="col"
							style="width: 15%; display: inline-block; padding: 15px">
							<img src=<%=bk4.getThumbnail() %> class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text"><%=bk4.getContent().substring(0,40)+"..." %> </p>
							</div>
						</div>
							<div class="col"
							style="width: 15%; display: inline-block; padding: 15px">
							<img  src=<%=bk5.getThumbnail() %> class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text"><%=bk5.getContent().substring(0,40)+"..." %> </p>
							</div>
						</div>	<div class="col"
							style="width: 15%; display: inline-block; padding: 15px">
							<img  src=<%=bk6.getThumbnail() %> class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text"><%=bk6.getContent().substring(0,40)+"..." %> </p>
							</div>
						</div>
					</div>
					<%
					
				}
					
					
					%>
					
					


				</div>

			</div>
		</div>

	</div>








	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous">
    </script>
	<script>
        new Swiper('.swiper-container', {

            slidesPerView: 4, // 동시에 보여줄 슬라이드 갯수
            spaceBetween: 30, // 슬라이드간 간격
            slidesPerGroup: 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

            // 그룹수가 맞지 않을 경우 빈칸으로 메우기
            // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
            loopFillGroupWithBlank: true,

            loop: true, // 무한 반복

            pagination: { // 페이징
                el: '.swiper-pagination',
                clickable: true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
            },
            navigation: { // 네비게이션
                nextEl: '.swiper-button-next', // 다음 버튼 클래스명
                prevEl: '.swiper-button-prev', // 이번 버튼 클래스명
            },
        });
    </script>

</body>

</html>