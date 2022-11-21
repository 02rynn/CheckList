<%@page import="dao.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="dao.bBsDAO"%>
<%@ page import="dao.Book"%>
<%@ page import="java.util.*"%>

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

	<%@ include file="navBar.jsp"%>

	<% // String user=session.getAttribute("userId").toString(); bBsDAO dao=new bBsDAO();
                           //bbs에서 보내는 정보 받아옴 
                              bBsDAO dao = new bBsDAO(); //bbs에서 폼 제출하면서 받아오는 값들 
                              String writer = request.getParameter("writer");
                              String title = request.getParameter("title");
                              String content = request.getParameter("content");
                              int rate =Integer.parseInt(request.getParameter("rate"));
                              int rvNum = Integer.parseInt(request.getParameter("num"));
	//out.print(rate);
                            

                                 // 현재 세션이 존재하는 사람은 userID, 아닌 사람은 null값이 담김

                                 %>

	<% Review r=new Review(); out.print(r.getReview_rate()); %>
	
	<% if ((user.toString()).equals(writer)) {%>
	<form method="post" id="review_detail">
		<div class="container">
			<div class="row">

				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd;">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								글 수정 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="bbsTitle_modi" maxlength="50"
								value="<%= title %>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="bbsContent_modi" maxlength="2048" style="height: 350px;"><%=  content %></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<div style="display: flex; justify-content: space-between;">
			<div class="rate">
				<div class="customSelectDiv designSettingElement shape "
					id="selectPostReviewRateDiv" style="margin-left: 10px;"
					data-text="평점 주기">

					<select name="rvrate" class="btn btn-outline-primary"
						onchange="require('common/common').customSelectBoxClickEvent(this)"
						id="selectPostReviewRate">
						
					
						
						<% //bbs에서 받아온 값을 띄워줌 ==> 근데 여기서 값을 변경해야함@@@@ ㄷ이 받아온 값을 수정값으로 바꾸고 그걸 update로 보내줘야함 
						
															if(rate== 1){%>
											                    <option selected value="1">★☆☆☆☆</option>
															     <option value="2">★★☆☆☆</option>
															      <option  value="3">★★★☆☆</option>
															      <option  value="4" >★★★★☆</option>
															      <option  value="5">★★★★★</option>
											                 <% }else if(rate== 2){%>  
											                       <option value="1">★☆☆☆☆</option>
															     <option   selected  value="2">★★☆☆☆</option>
															      <option  value="3">★★★☆☆</option>
															      <option  value="4" >★★★★☆</option>
															      <option  value="5">★★★★★</option>
											                  <% }else if(rate == 3){%> 
											                      <option  value="1">★☆☆☆☆</option>
															     <option value="2">★★☆☆☆</option>
															      <option selected value="3">★★★☆☆</option>
															      <option  value="4" >★★★★☆</option>
															      <option  value="5">★★★★★</option>
											                  <% }else if( rate== 4){ %> 
											                    <option  value="1">★☆☆☆☆</option>
															     <option value="2">★★☆☆☆</option>
															      <option  value="3">★★★☆☆</option>
															      <option  value="4" selected >★★★★☆</option>
															      <option  value="5">★★★★★</option>
											                   <% }else{ %>
											                      <option  value="1">★☆☆☆☆</option>
															     <option value="2">★★☆☆☆</option>
															      <option  value="3">★★★☆☆</option>
															      <option  value="4" >★★★★☆</option>
															      <option  selected value="5">★★★★★</option>
											                  <% } %> 
														
														
					
<!-- 						<option selected value="5">★★★★★</option> -->
<!-- 						<option value="4" selected>★★★★☆</option> -->
<!-- 						<option value="3">★★★☆☆</option> -->
<!-- 						<option value="2">★★☆☆☆</option> -->
						
					</select>
				</div>
			</div>
			<div class="btns"
			style="display: flex; justify-content: flex-end;">
			<div class="modidelete">
			
			<button id="removeBtn" name="removeBtn" type="submit"
				style="margin-right: 20px;" class="btn btn-primary pull-right"
				value="<%=rvNum %>">글삭제</button>

			<button id="modiBtn" name="modiBtn" type="submit"
				class="btn btn-primary pull-right" value="<%=rvNum %>">글수정</button>
			</div>
		</div>
		</div>
			</div>
		</div>
		

	</form>

	<% } else { %>
	<div class="container">
	
	
		<div class="row">
			<form method="post" name="review_detail">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd;">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								글 수정 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input disabled type="text" class="form-control"
								placeholder="글 제목" name="bbsTitle" maxlength="50"
								value="<%= title %>"></td>
						</tr>
						<tr>
							<td><textarea readonly class="form-control"
									placeholder="글 내용" name="bbsContent" maxlength="2048"
									style="height: 350px;"><%=  content %></textarea></td>
						</tr>
				
					</tbody>

				</table>

				<% }%>


			</form>
		</div>
	</div>

<<<<<<< HEAD
	<script>
	//r.getReview_rate()
					let selectRate = document.getElementById('selectPostReviewRate'); //
					selectRate.selectedIndex = <%=r.getReview_rate()%>;  //select된 인덱스의 값을 알려줌 인덱스 알면 ->?
		
	
                                                const review_detail = document.getElementById("review_detail")
											  document.getElementById("modiBtn").addEventListener("click", (e) => {
=======
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




                                                   <button id="removeBtn" name="removeBtn" type="submit"
                                                      class="btn btn-primary pull-right"
                                                      value="<%=rvNum %>">글삭제</button>
                                                   <button id="modiBtn" name="modiBtn" type="submit"
                                                      class="btn btn-primary pull-right"
                                                      value="<%=rvNum %>">글수정</button>
                                                </form>

                                                <% } else { %>
                                                   <div class="container">
                                                      <div class="row">
                                                         <form method="post"
                                                            action="update_review_proc.jsp?bbsID=<%= user.toString() %>">
                                                            <table class="table table-striped"
                                                               style="text-align: center; border: 1px solid #dddddd;">
                                                               <thead>
                                                                  <tr>
                                                                     <th colspan="2"
                                                                        style="background-color: #eeeeee; text-align: center;">
                                                                        게시판 글 수정 양식</th>
                                                                  </tr>
                                                               </thead>
                                                               <tbody>
                                                                  <tr>
                                                                     <td>
                                                                        <input disabled type="text" class="form-control"
                                                                           placeholder="글 제목" name="bbsTitle"
                                                                           maxlength="50" value="<%= title %>">
                                                                     </td>
                                                                  </tr>
                                                                  <tr>
                                                                     <td><textarea readonly class="form-control"
                                                                           placeholder="글 내용" name="bbsContent"
                                                                           maxlength="2048"
                                                                           style="height: 350px;"><%=  content %></textarea>
                                                                     </td>
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


                                             document.getElementById("modiBtn").addEventListener("click", (e) => {
>>>>>>> ea3ddfc26528d9cbf99642ccdda96f05b1d1a37b
                                                e.preventDefault();

<%-- 											    update_review_proc.jsp?bbsID=<%= user.toString() //여기서 넘겨줄때 수정된 값이 아닌 bbs에서 넘어오는값을 넘겨줌 ㅜㅜ %> --%>

<<<<<<< HEAD
												if (confirm("수정하시겠습니까?")) {
													review_detail.action = "update_review_proc.jsp?rate=<%=rate%>&rvNum=<%=rvNum%>&writer=<%=writer%>";
													review_detail.submit();
										             }
                                             });
                                               
											  document.getElementById("removeBtn").addEventListener("click", (e) => {
	                                                e.preventDefault();

	                                             
													if (confirm("삭제하시겠습니까?")) {
														review_detail.action = "delete_review_proc.jsp?rvNum=<%=rvNum%>";
														review_detail.submit();
											             }
	                                             });
                                                </script>
=======
                                                form.action = "update_review_proc.jsp";
                                                form.submit();

                                             }  
                                             
                                             document.getElementById("removeBtn").addEventListener("click", (e) => {
                                                e.preventDefault();

                                                if (confirm("삭제하시겠습니까?")) {
                                                   form.action = "deleteReview_proc.jsp";
                                                   form.submit();
                                                }

                                             });


                                             src = "https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
                                             integrity = "sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
                                             crossorigin = "anonymous" >
                                          </script>
>>>>>>> ea3ddfc26528d9cbf99642ccdda96f05b1d1a37b


</body>

</html>