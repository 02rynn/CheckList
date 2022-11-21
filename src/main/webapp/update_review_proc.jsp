<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter"%>
     <%request.setCharacterEncoding("UTF-8");%>
    <%@ page import="dao.bBsDAO" %>
    <%@ page import = "dao.Review" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	
      PrintWriter script = response.getWriter();
      String title = request.getParameter("bbsTitle_modi");
      String writer = request.getParameter("writer");
      String content = request.getParameter("bbsContent_modi");
      //int id = Integer.parseInt(request.getParameter("id")); //watch에서 보낸 파라미터들을 받아오기 
      int rate =  Integer.parseInt(request.getParameter("rate"));
      int rvNum = Integer.parseInt(request.getParameter("rvNum")); //name에 잇는 value를 받아옴 
     // String writer = request.getParameter("bbsID");
      


      out.println(title);
      
      
      //review객체에 저장하고 -> 이걸 dao로 보내주면 될거가튼뎅//?
      Review rv = new Review(); //
      rv.setReview_contents(content);
      rv.setReview_rate(rate);
      rv.setReview_title(title);
      rv.setReview_num(rvNum);
      
  	out.print(title);
  	out.print(content);
      
      
      
   bBsDAO dao = new bBsDAO(); //수정하고나면 수정된 내용이 창에 떠야하는데 그걸 못받아오는거낙?
		   
    
      int result = dao.updateBbs(title, content, rvNum, rate); //받아온 파라미터들을 dao메소드에 넣어줌
      
      if(result > 0){
         script.println("<script>");
         script.println("alert('수정되었습니다.');");
   
//          script.println("location.href ='watchReviewResult.jsp';")

		script.println("location.href ='watchReviewResult.jsp?rvnum="+rvNum+"&rvRate="+rate+"&writer="+writer+"'");
         script.println("</script>");
         script.close();
         return;
      } else{
         script.println("<script>");
         script.println("alert('수정에 실패하였습니다.');");
         script.println("location.href ='watchReviewResult.jsp';");
         script.println("</script>");
         script.close();
      }
      

  	
   %>



</body>
</html>