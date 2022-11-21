<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

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
				<li class="nav-item"><a class="nav-link" href="bbs.jsp">review</a></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="Category_show.jsp?category=전체" role="button"
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
			<button style="color : #75b5e6; border-color: #75b5e6;"  id="searckBoxBtn" class="btn" type="submit">Search</button>
		</form>

		<%
		
		Object user = session.getAttribute("userId");
	
		if(user == null){
			%>

		<div style="margin: 20px;">
			<a href="login.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16" style="color: black; text-decoration: none;">
  <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
  <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
</svg></a>
		</div>

		<% 
		}else{
			
		%>
			<div style="margin: 20px;">
			<a href="cart.jsp?id=<%=(String)user%>"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16" style="color: black; text-decoration: none;">
  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
</svg></a>
		</div>
		<div style="margin: 20px;">
			<a href="myPage.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16" style="color: black; text-decoration: none;">
  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
</svg></a>
		</div>
		
		<div id="logoutBtn" style="margin: 20px;">
			<a href="logOut_proc.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16" style="color: black; text-decoration: none;">
  <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
  <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
</svg></a>
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