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

//상세페이지에서 장바구니 버튼 담기 눌렀을때 연결되서 나오는 장바구니 페이지에 담은 리스트가 화면에 안보여서 잠깐 주석 처리함 
// navBar에서 장바구니 아이콘 누르면 리스트 보임 
// response.sendRedirect("cart.jsp?id="+(String)user+"price="+price);


if (user == null) {
	response.sendRedirect("main.jsp");
} else {
	response.sendRedirect("cart.jsp?id=" + (String) user);
}

// response.sendRedirect("cart.jsp?id="+(String)user);
%>





</body>

</html>