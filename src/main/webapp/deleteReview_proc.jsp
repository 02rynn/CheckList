<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

//리뷰넘버를 파라미터로 받기 
      PrintWriter script = response.getWriter();
      String name = request.getParameter("personName");
      int id = Integer.parseInt(request.getParameter("id"));
      PersonInfo personInfo = new PersonInfo();
      personInfo.setId(id);
      personInfo.setName(name);
      
      PersonDao personDao = new PersonDao();
      int result = personDao.deletePersonInfo(personInfo.getId());
      
      if(result > 0){
         script.println("<script>");
         script.println("alert('삭제되었습니다.');");
         script.println("location.href = 'index.jsp;");
         script.println("</script>");
         script.close();
         return;
      } else{
         script.println("<script>");
         script.println("alert('삭제에 실패하였습니다.');");
         script.println("location.href = 'PersonInfoDetail.jsp?id="+id+"';");
         script.println("</script>");
         script.close();
      }
      
   %>
</body>
</html>