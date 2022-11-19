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

request.setCharacterEncoding("utf-8");

String isbn= request.getParameter("isbn");
int price = Integer.parseInt(request.getParameter("price"));


// out.print(user.toString());
cartDao dao = new cartDao();
cart ct = new cart();

ct.setId((String)user);
ct.setIsbn(isbn);

// ct.setPrice(price);

out.print(ct.getId());
out.print(isbn);
// out.print(price);
int result = dao.insertBookInCart(ct);


response.sendRedirect("cart.jsp?id="+(String)user);
%>

</body>
</html>