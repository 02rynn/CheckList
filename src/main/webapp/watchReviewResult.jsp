<%@page import="dao.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
 <%request.setCharacterEncoding("UTF-8");%>
     <%@ page import="dao.bBsDAO" %>
      <%@ page import="dao.Book" %>
      <%@ page import = "java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
	<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
</head>
<body> 

	<%@
	
	
	 include file="navBar.jsp" %>
	
		<% // String user=session.getAttribute("userId").toString(); bBsDAO dao=new bBsDAO(); List<Book>
		
		//update_review_proc으로 넘어오는 글제목,글내용, 아이디를 보내주면 그걸 받아서
		//다시 dao를 이용해서 디비로 보내주면 될듯?

		bBsDAO dao = new bBsDAO();
		

		String writer = request.getParameter("writer");
		String title = request.getParameter("bbsTitle_modi");
		String content = request.getParameter("bbsContent_modi");
		int rate =Integer.parseInt(request.getParameter("rvRate"));
		int rvNum = Integer.parseInt(request.getParameter("rvnum"));


     
		 List<Review> rvList = dao.select_modified_review_contents(rvNum);//데이터베이스에잇는 정ㅂ3ㅗ가지고 오기 
	 

	%>
		 
   

<% if ((user.toString()).equals(writer)) {%>  
<div class="container">
		
		<div class="row">
		<form method="post" action="update_review_proc.jsp?bbsID=<%= user.toString() %>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						<input type="text" class="form-control" placeholder="글 제목" name="bbsTitle_modi" maxlength="50" value="<%=rvList.get(0).getReview_title()%>">
						</td>
					</tr>
					
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent_modi" maxlength="2048" style="height: 350px;"><%=rvList.get(0).getReview_contents() %>></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="customSelectDiv designSettingElement shape "
												id="selectPostReviewRateDiv" style="margin-left: 10px;"
												data-text="평점 주기">
												<select name="rvrate" class="btn btn-outline-primary"
													onchange="require('common/common').customSelectBoxClickEvent(this)"
													id="selectPostReviewRate">
													<option value="0" selected="selected">
													<%
														
														   if(rvList.get(0).getReview_rate()== 1){
											                      out.println("★☆☆☆☆");
											                   }else if(rvList.get(0).getReview_rate() ==2){
											                      out.println("★★☆☆☆");        
											                   }else if(rvList.get(0).getReview_rate() == 3){
											                      out.println("★★★☆☆");
											                   }else if(rvList.get(0).getReview_rate() == 4){
											                      out.println("★★★★☆");
											                   }else{
											                     out.println("★★★★★");
											                   } 
														
														%>
													
													</option>
													<option value="5">★★★★★</option>
													<option value="4">★★★★☆</option>
													<option value="3">★★★☆☆</option>
													<option value="2">★★☆☆☆</option>1
													<option value="1">★☆☆☆☆</option>
												</select>
											</div>
  				<div style="display: flex; justify-content: flex-end; position: relative; bottom:50px; margin-right:70px;" >
			<button   style="margin-right:20px;" id="removeBtn" name ="removeBtn" type="submit" class="btn btn-primary pull-right" value="<%=rvNum %>">글삭제</button>
			<button id="modiBtn"  name="modiBtn"  type="submit" class="btn btn-primary pull-right" value="<%=rvNum %>">글수정</button>
			</div>
			</form>
				
			<% }
				else { %>
				<div class="container">
				<h5><%=user%><%=writer %></h5>
				<div class="row">
				<form method="post" action="updateAction.jsp?bbsID=<%= user.toString() %>">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
						<thead>
							<tr>
								<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
								<input  disabled type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%=rvList.get(0).getReview_title()%>">
								</td>
							</tr>
							<tr>
								<td><textarea readonly class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%=  rvList.get(0).getReview_contents() %></textarea></td>
							</tr>
						</tbody>
					</table>
				
		<% }%>	
		

			
		
			
			</form>
		</div>
	</div>
	</div>
		</div>
			<script>
	
// 	 		document.getElementById("modiBtn").addEventListener("click", (e) => {
// 			e.preventDefault();

// 									//정보를 writeAction2로 보내도록
// 			location.href = "watchReview.jsp";

// 			form.action = "update_review_proc.jsp"; //form을 보내는 곣
// 			form.submit();
// 								}  
				
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

</body>
</html>