<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "dao.bBsDAO" %>
    <%@ page import = "dao.Review" %>
    <%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">checkList</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Pricing</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                        Dropdown link
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div style="margin: 35px;">
            <a href="">My Page</a>
        </div>
        <div style="margin: 35px;">
            <a href="">LOGIN</a>
        </div>
    </div>
</nav>


    <div class="container">
        <div class="row">
                    
     <%
 	 bBsDAO dao = new bBsDAO();
 	 List<Review> rvList = dao.select_bbs_contents(); //데이터베이스에서 받아온 결과를 리스트에 넣을거아니냐고...
      %>
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;margin-top: 20px; width: 100%;
            maxlength=50">
                <thead> <!--테이블의 제목 -->
                    <tr>
                        <th style="background-color: #eeeeee; text-align: center;">번호</th>
                        <th style="background-color: #eeeeee; text-align: center;">상품이름</th>
                        <th style="background-color: #eeeeee; text-align: center;">제목</th>
                        <th style="background-color: #eeeeee; text-align: center;">글쓴이</th>
                        <th style="background-color: #eeeeee; text-align: center;">등록일</th>
                        <th style="background-color: #eeeeee; text-align: center;">평점 </th>
                    </tr>
                </thead>

                <tbody style="background-color:#eeeeee">
                <!-- 데이터베이스에서 글번호, 책이름, 책제목, 글쓴이, 등록일, 평점 가지고와서 보여지도록  -->
            
      <%
      
      	if(rvList != null && rvList.size()>0){ //배열이 null이 아니고 size가 0보다 크면 반복문 돌릴거임
      		for(Review  r : rvList){
      			%>
      			<tr>
      			
      			 <td><%= r.getReview_num() %></td>
      			  <td><%= r.getTitle() %></td>
      			   <td><%= r.getReview_title() %></td>
      			    <td><%= r.getId() %></td>
      			     <td><%= r.getReveiw_date() %></td>
      			      <td><%
      			    if(r.getReview_rate()== 1){
    			    	  out.println("★☆☆☆☆");
    			      }else if(r.getReview_rate() ==2){
    			    	  out.println("★★☆☆☆");		  
    			      }else if(r.getReview_rate() == 3){
    			    	  out.println("★★★☆☆");
    			      }else if(r.getReview_rate() == 4){
    			    	  out.println("★★★★☆");
    			      }else{
    			    	 out.println("★★★★★");
    			      } 
      			      
      			      %></td>
     			 
     			 </tr>
      	<%
      		}
      	}
      %>
     
      

                  
                  
                  
                  
                  
                </tbody>
            </table>
             <a href="write.jsp" class="btn btn-primary" style="width: 100px; position: relative; 
            left: 90%;">글쓰기 </a>
           
        </div>
    </div>
    



</body>
</html>