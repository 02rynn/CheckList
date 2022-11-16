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
<nav class="navbar navbar-expand-lg bg-light" style="width : 100%; top : -30px">
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
                <input name="inid" type="email" placeholder="Email" class="input" />
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