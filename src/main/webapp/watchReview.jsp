<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="bbs.jsp" %>
     <%@ page import="dao.bBsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body> 

<div class="container">
		<div class="row">
			<form method="get" action="writeAction2.jsp">
				<!--action페이지로 보낼수 있도록 -->
				<!--post 메소드로 숨기면서 전송, 액션페이지에서 처리할 수 있도록 전송함  -->

				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd; margin-top: 20px; width: 100%;">
					<thead>
						<!--테이블의 제목 -->
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기 양식</th>
						</tr>
						<tr>
							<th><span>상품목록</span> 
							<select name="select">
										<%
											for(Book bk : buyItems){
												%>
													<option id="option" value=<%=bk.getTitle() %>>	
												<%=bk.getTitle() %>
												</option>
										<% 		
											}
										%>
									

							</select>
							<th />
						<tr />
					</thead>
					<!--  -->
					<tbody style="background-color: #eeeeee">
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="review_title" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea type="text" class="form-control"
									placeholder="글 내용" name="review_contents" maxlength="2048"
									style="height: 350px;"></textarea></td>
							<!---->
						</tr>
					</tbody>
				</table>
</body>
</html>