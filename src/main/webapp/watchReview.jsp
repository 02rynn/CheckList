<%@page import="dao.Review" %>
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
      <%@page import="java.io.PrintWriter" %>
         <%request.setCharacterEncoding("UTF-8");%>
            <%@ page import="dao.bBsDAO" %>
               <%@ page import="dao.Book" %>
                  <%@ page import="java.util.*" %>

                     <!DOCTYPE html>
                     <html>

                     <head>
                        <meta charset="UTF-8">
                        <title>Insert title here</title>
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
                           rel="stylesheet"
                           integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
                           crossorigin="anonymous">
                        <link rel="stylesheet"
                           href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
                     </head>

                     <body>

                        <%@ include file="navBar.jsp" %>

                           <% // String user=session.getAttribute("userId").toString(); bBsDAO dao=new bBsDAO();
                              List<Book>
                              bBsDAO dao = new bBsDAO();
                              String writer = request.getParameter("writer");
                              String title = request.getParameter("title");
                              String content = request.getParameter("content");
                              int rate =Integer.parseInt(request.getParameter("rate"));
                              int rvNum = Integer.parseInt(request.getParameter("num"));

                              List<Book> buyItems = dao.selectBuyBookList((String)user);

                                 // 현재 세션이 존재하는 사람은 userID, 아닌 사람은 null값이 담김

                                 %>

                                 <% //게시글에서 제목 누르면 여기로 이동해서 /* 창에 쓰여있던 글번호와 제목을 불러옴 (글씨 밝기 밝게) 본인이면 -> 수정과 삭제버튼도 밑에 추가
                                    // 버튼 누르면 각각 update, delete 되도록
                                    //updateAction 만들어야 하


                                    %>

                                    <% Review r=new Review(); %>
                                       <% if ((user.toString()).equals(writer)) {%>
                                          <div class="container">
                                             <div class="row">
                                                <form method="get"
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
                                                               <input type="text" class="form-control"
                                                                  placeholder="글 제목" name="bbsTitle_modi" maxlength="50"
                                                                  value="<%= title %>">
                                                            </td>
                                                         </tr>
                                                         <tr>
                                                            <td><textarea class="form-control" placeholder="글 내용"
                                                                  name="bbsContent_modi" maxlength="2048"
                                                                  style="height: 350px;"
                                                                  value="<%= content %>>"><%=  content %></textarea>
                                                            </td>
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
                                                e.preventDefault();

                                                //정보를 writeAction2로 보내도록
                                                location.href = "update_review_proc.jsp"

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


                     </body>

                     </html>