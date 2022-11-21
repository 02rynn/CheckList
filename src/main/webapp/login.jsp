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
        :root {
            /* COLORS */
            --white: #e9e9e9;
            --gray: #333;
            --blue: #75b5e6;
            --lightblue: #008997;

            /* RADII */
            --button-radius: 0.7rem;

            /* SIZES */
            --max-width: 758px;
            --max-height: 420px;

            font-size: 16px;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
                Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
        }

        body {
            align-items: center;
            background-color: var(--white);
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            display: grid;
            height: 100vh;
            place-items: center;
        }

        .form__title {
            font-weight: 300;
            margin: 0;
            margin-bottom: 1.25rem;
        }

        .link {
            color: var(--gray);
            font-size: 0.9rem;
            margin: 1.5rem 0;
            text-decoration: none;
        }

        .container {
            background-color: var(--white);
            border-radius: var(--button-radius);
            box-shadow: 0 0.9rem 1.7rem rgba(0, 0, 0, 0.25),
                0 0.7rem 0.7rem rgba(0, 0, 0, 0.22);
            height: var(--max-height);
            max-width: var(--max-width);
            overflow: hidden;
            position: relative;
            width: 100%;
        }

        .container__form {
            height: 100%;
            position: absolute;
            top: 0;
            transition: all 0.6s ease-in-out;
        }

        .container--signin {
            left: 0;
            width: 50%;
            z-index: 2;
        }

        .container.right-panel-active .container--signin {
            transform: translateX(100%);
        }

        .container--signup {
            left: 0;
            opacity: 0;
            width: 50%;
            z-index: 1;
        }

        .container.right-panel-active .container--signup {
            animation: show 0.6s;
            opacity: 1;
            transform: translateX(100%);
            z-index: 5;
        }

        .container__overlay {
            height: 100%;
            left: 50%;
            overflow: hidden;
            position: absolute;
            top: 0;
            transition: transform 0.6s ease-in-out;
            width: 50%;
            z-index: 100;
        }

        .container.right-panel-active .container__overlay {
            transform: translateX(-100%);
        }

        .overlay {
            background-color: #CEE4F5;
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            height: 100%;
            left: -100%;
            position: relative;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
            width: 200%;
        }

        .container.right-panel-active .overlay {
            transform: translateX(50%);
        }

        .overlay__panel {
            align-items: center;
            display: flex;
            flex-direction: column;
            height: 100%;
            justify-content: center;
            position: absolute;
            text-align: center;
            top: 0;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
            width: 50%;
        }

        .overlay--left {
            transform: translateX(-20%);
        }

        .container.right-panel-active .overlay--left {
            transform: translateX(0);
        }

        .overlay--right {
            right: 0;
            transform: translateX(0);
        }

        .container.right-panel-active .overlay--right {
            transform: translateX(20%);
        }

        .btn {
            background-color: var(--blue);
            background-image: var(--blue);
            border-radius: 20px;
            border: 1px solid var(--blue);
            color: var(--white);
            cursor: pointer;
            font-size: 0.8rem;
            font-weight: bold;
            letter-spacing: 0.1rem;
            padding: 0.9rem 4rem;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
        }

        .form>.btn {
            margin-top: 1.5rem;
        }

        .btn:active {
            transform: scale(0.95);
        }

        .btn:focus {
            outline: none;
        }

        .form {
            background-color: var(--white);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 3rem;
            height: 100%;
            text-align: center;
        }

        .input {
            background-color: #fff;
            border: none;
            padding: 0.9rem 0.9rem;
            margin: 0.5rem 0;
            width: 100%;
        }

        @keyframes show {

            0%,
            49.99% {
                opacity: 0;
                z-index: 1;
            }

            50%,
            100% {
                opacity: 1;
                z-index: 5;
            }
        }
    </style>

</head>

<body>
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
			<a href="myPage.jsp?id=user"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16" style="color: black; text-decoration: none;">
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
    <div class="container right-panel-active" style=" top : -100px; height : 650px">
        <!-- Sign Up -->
        <div class="container__form container--signup">
            <form action="#" class="form" id="form1">
                <h2 class="form__title">Sign Up</h2>
                <input name="upId" type="text" placeholder="ID" class="input" />
                <input name="upPw" type="password" placeholder="Password" class="input" />
                <input name="upEmail" type="email" placeholder="Email" class="input"  />
       
               <input name="upAddress" type="text" placeholder="Address" class="input" />
               <input name="upPhoneNum" type="text" placeholder="PhoneNumber" class="input" />
                <input name="upName" type="text" placeholder="name" class="input" />
                <button id= "signbbtn" class="btn">Sign Up</button>
            </form>
        </div>

        <!-- Sign In -->
        <div class="container__form container--signin">
            <form action="" class="form" id="form2">
                <h2 class="form__title">Sign In</h2>
                <input name="inid" type="text" placeholder="ID" class="input" />
                <input name="inpw" type="password" placeholder="Password" class="input" />
                <button id="ininbtn" class="btn">Sign In</button>
            </form>
        </div>

        <!-- Overlay -->
        <div class="container__overlay">
            <div class="overlay">
                <div class="overlay__panel overlay--left">
                    <button class="btn" id="signIn">Sign In</button>
                </div>
                <div class="overlay__panel overlay--right">
                    <button class="btn" id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
    </div>
    <script>
		const signbbtn = document.getElementById("signbbtn");
    	const ininbtn = document.getElementById("ininbtn");
        const signInBtn = document.getElementById("signIn");
        const signUpBtn = document.getElementById("signUp");
        const fistForm = document.getElementById("form1");
        const secondForm = document.getElementById("form2");
        const container = document.querySelector(".container");

        signInBtn.addEventListener("click", () => {
            container.classList.remove("right-panel-active");
        });

        signUpBtn.addEventListener("click", () => {
            container.classList.add("right-panel-active");
        });

        fistForm.addEventListener("submit", (e) => e.preventDefault());
        secondForm.addEventListener("submit", (e) => {
        	
        	e.preventDefault()
        	
        	
        });
        ininbtn.addEventListener("click", (e) => { //로그인 함수
            e.preventDefault();
  
            if (secondForm.inid.value == "") { 
              alert("이름은 필수입니다.");
              secondForm.inid.focus();
              return false;
            } else if (secondForm.inpw.value == ""){
                alert("비밀번호은 필수입니다.");
                secondForm.inpw.focus();
                return false;
            }
            
            else {
             
            	 secondForm.action = "login_proc.jsp";
            	 secondForm.submit();
              
            }
          });
    
      
        
        signbbtn.addEventListener("click", (e) => {// 회원가입 함수
            e.preventDefault();
  
            if (fistForm.upId.value == "") { 
              alert("ID는 필수입니다.");
              fistForm.upId.focus();
              return false;
            } else if (fistForm.upPw.value == ""){
                alert("비밀번호는 필수입니다.");
                secondForm.upPw.focus();
                return false;
            }
             else if (fistForm.upEmail.value == ""){
                alert("Email은 필수입니다.");
                secondForm.upEmail.focus();
                return false;
             }
            else if (fistForm.upAddress.value == ""){
                alert("주소는 필수입니다.");
                secondForm.upPw.focus();
                return false;
            }
            else if (fistForm.upPhoneNum.value == ""){
                alert("연락처는 필수입니다.");
                secondForm.upPw.focus();
                return false;
            }
            else if (fistForm.upName.value == ""){
                alert("이름은 필수입니다.");
                secondForm.upPw.focus();
                return false;
            }else { // 이름이 있는 경우
              if (confirm("회원가입을 하시겠습니까?")) {
            	  fistForm.action = "signUp_proc.jsp";
            	  fistForm.submit();
              }
            }
          });
    
    

        

        

        
    </script>
</body>

</html>