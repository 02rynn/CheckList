<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dao.cartDao" %>
    <%@ page import="dao.cart" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file ="navBar.jsp" %>
<%
String isbn= request.getParameter("isbn");


out.print(user.toString());
cartDao dao = new cartDao();
cart ct = new cart();
ct.setId(user.toString());
ct.setIsbn(isbn);
out.print(ct.getId());
int result = dao.insertBookInCart(ct);


response.sendRedirect("cart.jsp");
%>

</body>
</html>