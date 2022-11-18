<%@page import="dao.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="dao.BookDao" %>
    <%@ page import="dao.cart" %>
            <%@ page import="dao.CustomerDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="navBar.jsp"%>
<%
// String isbn= request.getParameter("isbn");

String isbn = "책이름";
out.print(isbn);
out.print(user);

BookDao dao = new BookDao();
CustomerDao cDao = new CustomerDao();
cDao.selectCustomerInfo(user.toString());














%>

</body>
</html>