<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<!-- CSS only -->
	<!-- CSS only -->
	<meta charset="UTF-8">
	<title>checkList</title>
	<style>
		:root {
			/* COLORS */
			- -white: #e9e9e9;
			- -gray: #333;
			- -blue: #75b5e6;
			- -lightblue: #008997;
			/* RADII */
			- -button-radius: 0.7rem;
			/* SIZES */
			- -max-width: 758px;
			- -max-height: 420px;
			font-size: 16px;
			font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
				Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
		}

		.btn {
			background-color: var(- -blue);
			background-image: var(- -blue);
			border-radius: 20px;
			border: 1px solid var(- -blue);
			color: var(- -white);
			cursor: pointer;
			font-size: 0.8rem;
			font-weight: bold;
			letter-spacing: 0.1rem;
			padding: 0.9rem 4rem;
			text-transform: uppercase;
			transition: transform 80ms ease-in;
		}

		* {
			font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
				Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
			font-weight: 500;
		}
	</style>
</head>
<%	String isLog =request.getParameter("isLog");

%>
<nav class="navbar navbar-expand-lg bg-light" style="width: 100%;">
	<div class="container-fluid">
		<a class="navbar-brand" href="main.jsp">checkList</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
			aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="category_show.jsp" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Category </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="Category_show.jsp?category=전체">전체</a></li>
						<li><a class="dropdown-item" href="Category_show.jsp?category=경제경영">경제경영</a></li>
						<li><a class="dropdown-item" href="Category_show.jsp?category=만화">만화</a></li>
						<li><a class="dropdown-item" href="Category_show.jsp?category=소설/시/희곡">소설/시/희곡</a></li>
						<li><a class="dropdown-item" href="Category_show.jsp?category=수험서/자격증">수험서/자격증</a></li>
						<li><a class="dropdown-item" href="Category_show.jsp?category=어린이">어린이</a></li>
						<li><a class="dropdown-item" href="Category_show.jsp?category=에세이">에세이</a></li>
						<li><a class="dropdown-item" href="Category_show.jsp?category=외국어">외국어</a></li>
						<li><a class="dropdown-item" href="Category_show.jsp?category=인문학">인문학</a></li>
						<li><a class="dropdown-item" href="Category_show.jsp?category=자기계발">자기계발</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<form id="searckBox" class="d-flex" role="search" style="width: 60%" action="search.jsp">
			<input name="value" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			<button id="searckBoxBtn" class="btn btn-outline-success" type="submit">Search</button>
		</form>

		<%
		
		Object user = session.getAttribute("userId");
		
		if(user == null){
			%>

		<div style="margin: 20px;">
			<a href="login.jsp">로그인</a>
		</div>

		<% 
		}else{
		
		%>
		<div style="margin: 20px;">
			<a href="">마이 페이지</a>
		</div>
		<div id="logoutBtn" style="margin: 20px;">
			<a href="logOut_proc.jsp">로그아웃</a>
		</div>
		<%} %>

	</div>
</nav>

<body>

<script>
const searckBox = document.getElementById("searckBox");
const searckBoxBtn = document.getElementById("searckBoxBtn");

searckBoxBtn.addEventListener("click", () => {
	searckBox.action = "search.jsp";
	searckBox.submit();
});

</script>

</body>

</html>