<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="dao.bBsDAO" %>
     <%@ page import = "dao.Review" %>
         <%@ page import="java.io.PrintWriter"%>
         <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<!-- PrintWriter script = response.getWriter(); -->
    <%
    
    PrintWriter script = response.getWriter();
      int rvNum = Integer.parseInt(request.getParameter("rvNum"));
     bBsDAO dao = new bBsDAO();
      int result = dao.deleteBbs(rvNum);
      
      
      if(result > 0){
         script.println("<script>");
         script.println("alert('삭제되었습니다.');");
         script.println("location.href = 'bbs.jsp';"); // 게시판으로 이동 
         script.println("</script>");
         script.close();
         return;
      } else{
         script.println("<script>");
         script.println("alert('삭제에 실패하였습니다.');");
         script.println("location.href = 'watchReview.jsp="+rvNum+"';"); //그대로 리뷰화면으로 이동 
         script.println("</script>");
         script.close();
      }
    
    
    %>


</body>
</html>