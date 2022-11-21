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

	 include file="navBar.jsp" 	 
	 %>
	 
	 <%
	
	 bBsDAO dao = new bBsDAO();
	 int rvNum = Integer.parseInt( request.getParameter("rvnum"));
	 List<Review> rvList = dao.select_modified_review_contents(rvNum);
	 System.out.println(rvNum);
	 System.out.println(rvList.get(0).getReview_contents());
	 %>
	
<div class="container">
		<div class="row">
		<form method="post" action="update_review_proc.jsp?bbsID=">
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
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent_modi" maxlength="2048" style="height: 350px;" value="<%=rvList.get(0).getReview_contents()%>"><%= rvList.get(0).getReview_contents()%>></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="customSelectDiv designSettingElement shape "
												id="selectPostReviewRateDiv" style="margin-left: 10px;"
												data-text="평점 주기">



												<select name="rvrate" class="btn btn-outline-primary"
													onchange="require('common/common').customSelectBoxClickEvent(this)"
													id="selectPostReviewRate">
													<option value="0" selected="selected">평점 주기</option>
													<option value="5">★★★★★</option>
													<option value="4">★★★★☆</option>
													<option value="3">★★★☆☆</option>
													<option value="2">★★☆☆☆</option>
													<option value="1">★☆☆☆☆</option>
												</select>

											</div>
			
			
 				
  
			<button id="removeBtn" name ="removeBtn" type="submit" class="btn btn-primary pull-right" value="">글삭제</button>
			<button id="modiBtn"  name="modiBtn"  type="submit" class="btn btn-primary pull-right" value="">글수정</button>
			</form>
				
	
	</div>
		</div>
	<script>

	
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous">
    </script>


</body>
</html>