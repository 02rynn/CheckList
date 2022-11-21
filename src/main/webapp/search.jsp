<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.Book"%>
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>checkList</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<style>

</style>

</head>

<body>
	<%@ include file="navBar.jsp"%>
	<%
	String value = request.getParameter("value");
	
	%>

	<div
		style="height: 15vh; backGround-color: rgb(151, 200, 237); text-align: center; font-size: 4vh; line-height: 15vh;">
		<span> "<%=value %>" 의 검색 결과입니다
		</span>

	</div>

	<%


	DataDao dao = new DataDao();

	List<Book> bookList = dao.selectBookforSearch(value);

	for (Book bk : bookList) {
	%>
	<div 
		style="width: 23.75%; display: inline-block; padding: 15px;">
		<a href="bookDetail2.jsp?isbn=<%=bk.getIsbn()%>&title=<%=bk.getTitle()%>&imgUrl=<%=bk.getThumbnail()%>&price=<%=bk.getPrice()%>"><img src=<%=bk.getThumbnail() %> class="card-img-top" alt="..."></a>
		<div class="card-body">
			<p class="card-text"><%=bk.getTitle() %></p>
		</div>
	</div>






	<% 
	}
	%>






	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous">
		
	</script>


</body>

</html>