<%@page import="dao.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="dao.BookDao" %>
    <%@ page import="dao.cart" %>
            <%@ page import="dao.CustomerDao" %>
                     <%@ page import="dao.Customer" %>
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

String isbn = "책 isbn";


BookDao dao = new BookDao();
CustomerDao cDao = new CustomerDao();
Customer cs = new Customer();
cs = cDao.selectCustomerInfo((String)user);



out.print(cs.getAddress());
out.print(cs.getCustomer_no());
out.print(cs.getEmail());
out.print(isbn);
out.print(user);








%>

</body>
</html>