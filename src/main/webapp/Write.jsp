<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="dao.bBsDAO"%>
<%@ page import="dao.Book"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
   crossorigin="anonymous">
<title>후기작성 페이지</title>
</head>

<body>

   <%@ include file="navBar.jsp"%>
   <% // String user=session.getAttribute("userId").toString(); bBsDAO dao=new bBsDAO(); List<Book>

      bBsDAO dao = new bBsDAO();
   
   
   
      List<Book> buyItems = dao.selectBuyBookList((String)user);
      buyItems = dao.selectBuyBookList((String)user);

      //로그인 안되어잇으면 로그인 페이지로 이동
   %>


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
                     <select id="select" style="width: 100%;" name="select" onchange="showTitle()">
                           <option id="option" value="구매 도서를 확인하세요">구매 도서를 확인하세요
                           </option>
                           <% for(Book bk : buyItems){ %>
                           <option id="option"
                              value="<%=bk.getTitle()%>&<%=bk.getIsbn()%>">

                              <%=bk.getTitle() %>
                           </option>

                           <% } %>


                     </select>
                     <th />
                  <tr />
               </thead>
               <!--  -->
               <tbody style="background-color: #eeeeee">
                  <tr>
                     <td><input id="titl" type="text" class="form-control"
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

            <div class="bbs"
               style="display: flex; align-items: center; justify-content: flex-end">
               <input id="saveBtn" type="submit" class="btn btn-outline-primary"
                  value="저장하기">

               <div class="customSelectDiv designSettingElement shape "
                  id="selectPostReviewRateDiv" style="margin-left: 10px;"
                  data-text="평점 주기">

                  <select name="rvrate" class="btn btn-outline-primary"
                     onchange="require('common/common').customSelectBoxClickEvent(this)"
                     id="selectPostReviewRate">
                     <option>평점 주기</option>
                     <option value="5">★★★★★</option>
                     <option value="4">★★★★☆</option>
                     <option value="3">★★★☆☆</option>
                     <option value="2">★★☆☆☆</option>
                     <option value="1">★☆☆☆☆</option>
                  </select>

               </div>
            </div>

         </form>
      </div>
   </div>

   <div class="btn-wrapper save-post-wrapper field">
      <button id="goListReviewInBoardProduct" type="button"
         class="btn btn-outline-dark"
         style="margin-left: 70px; position: relative; bottom: 50px;"
         onclick="history.back()">목록으로 가기</button>
   </div>


   <script>
//        const tit = document.getElementById("tit");
                          
//       function showTitle(){
//          tit.value = document.getElementById("selectbox").value;
//       }
        
     let tit = null;
     function showTitle(){
        let select = document.getElementById("select");
        
        tit = (select.options[select.selectedIndex].value);
        let arr = tit.split("&");
        document.getElementById("titl").value = arr[0];
        console.log(tit);
      }
   
//       document.getElementById("saveBtn").addEventListener("click", (e) => {
//          e.preventDefault();

//          form.action = "writeAction2.jsp";
//          form.submit();
//          location.href = "writeAction2.jsp"
//       });
   </script>
</body>

</html>