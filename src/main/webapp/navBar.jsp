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
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Category </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">에세이</a></li>
						<li><a class="dropdown-item" href="#">국내소설 action</a></li>
						<li><a class="dropdown-item" href="#">중국소설 </a></li>
						<li><a class="dropdown-item" href="#">일본소설 </a></li>
						<li><a class="dropdown-item" href="#">미국소설 </a></li>
						<li><a class="dropdown-item" href="#">시</a></li>
						<li><a class="dropdown-item" href="#">여행</a></li>
						<li><a class="dropdown-item" href="#">예술</a></li>
						<li><a class="dropdown-item" href="#">인문</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<form class="d-flex" role="search" style="width: 60%">
			<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success" type="submit">Search</button>
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

</script>

</body>

</html>