<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "dao.bBsDAO" %>
       <%@ page import = "dao.Bbs" %>
   <%@ page import="java.io.PrintWriter"%>
   <% request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	request.setCharacterEncoding("utf-8");
   %>
   
   <%@ include file = "navBar.jsp" %>
   
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
request.setCharacterEncoding("UTF-8");
//��ǰ�̸�, ������, �۳��� , isbn
//�۹�ȣ, ��ǰ�̸�, ������, �۾���, �����, ����, isbn  �޾ƿ��� 
PrintWriter script = response.getWriter();
String title =request.getParameter("select");

// System.out.println(title); //å����


String rvTitle =request.getParameter("review_title");
String rvContents =request.getParameter("review_contents");
int rvRate =Integer.parseInt (request.getParameter("rvrate"));
String isbn =request.getParameter("isbn");
//String isbn = request.getParameter("book_num");


Bbs bbs = new Bbs(); 
bBsDAO dao = new bBsDAO(); 

int result = dao.insert_review_contents(title, rvRate, rvTitle,  rvContents, (String)user, isbn);

//bbs.setReview_title(title);
// bbs.setReview_title(rvTitle);
// bbs.setTitle(title);
// bbs.setReview_contents(rvContents);
// bbs.setReview_rate(Integer.parseInt(rvRate));


// String userId = null;
// if(session.getAttribute("userId")!=null){
// 	userId = session.getAttribute("userId").toString();
// }


//   PrintWriter script = response.getWriter();
//       String name = request.getParameter("personName");
//       int id = Integer.parseInt(request.getParameter("id"));
//       PersonInfo personInfo = new PersonInfo();
//       personInfo.setId(id);
//       personInfo.setName(name);
      
//       PersonDao personDao = new PersonDao();
//       int result = personDao.deletePersonInfo(personInfo.getId());
      
      
//       if(result > 0){
//          script.println("<script>");
//          script.println("alert('�����Ǿ����ϴ�.');");
//          script.println("location.href = 'JSPSample.jsp';");
//          script.println("</script>");
//          script.close();
//          return;
//       } else{
//          script.println("<script>");
//          script.println("alert('������ �����Ͽ����ϴ�.');");
//          script.println("location.href = 'PersonInfoDetail.jsp?id="+id+"';");
//          script.println("</script>");
//          script.close();
//       }
      

response.sendRedirect("bbs.jsp");
%>

