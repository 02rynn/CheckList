<%@page import="dao.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@ page import="java.io.PrintWriter"%>
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
PrintWriter script = response.getWriter();
String upId=request.getParameter("upId");
String upPw=request.getParameter("upPw");
String upEmail=request.getParameter("upEmail");
String upAddress=request.getParameter("upAddress");
String upPhoneNum=request.getParameter("upPhoneNum");
String upName=request.getParameter("upName");


Customer cs = new Customer();
CustomerDao dao = new CustomerDao();
cs.setId(upId);
cs.setPassword(upPw);
cs.setEmail(upEmail);
cs.setAddress(upAddress);
cs.setPhone_num(upPhoneNum);
cs.setCustomer_name(upName);

int result = dao.insertCustomerInfo(cs);


if(result == 1){
    script.println("<script>");
    script.println("alert('가입 성공');");
    script.println("location.href = 'index.jsp';");
    script.println("</script>");
    script.close();
}else{
    script.println("<script>");
    script.println("alert('실패');");
    script.println("location.href = 'index.jsp';");
    script.println("</script>");
    script.close();
	
}



%>

</body>
</html>