
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



</style>
</head>
<nav class="navbar navbar-expand-lg bg-light" style="width : 100%;  ">
	<div class="container-fluid">
		<a class="navbar-brand" href="main.jsp">checkList</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="index.jsp">About</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> Category
				</a>
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
					</ul></li>
			</ul>
		</div>
		<form class="d-flex" role="search" style="width: 60%">
			<input class="form-control me-2" type="search" placeholder="Search"
				aria-label="Search">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</form>
		<div style="margin: 20px;">
			<a href="">Join</a>
		</div>
		<div style="margin: 20px;">
			<a href="">My Page</a>
		</div>
		<div style="margin: 20px;">
			<a href="login.jsp">LOGIN</a>
		</div>
	</div>
</nav>

<body>


<!-- JavaScript Bundle with Popper -->
</body>

</html>