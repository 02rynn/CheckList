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
				<!--action�������� ������ �ֵ��� -->
				<!--post �޼ҵ�� ����鼭 ����, �׼����������� ó���� �� �ֵ��� ������  -->

				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd; margin-top: 20px; width: 100%;">
					<thead>
						<!--���̺��� ���� -->
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">�Խ���
								�۾��� ���</th>
						</tr>
						<tr>
							<th><span>��ǰ���</span> 
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
								placeholder="�� ����" name="review_title" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea type="text" class="form-control"
									placeholder="�� ����" name="review_contents" maxlength="2048"
									style="height: 350px;"></textarea></td>
							<!---->
						</tr>
					</tbody>
				</table>
</body>
</html>