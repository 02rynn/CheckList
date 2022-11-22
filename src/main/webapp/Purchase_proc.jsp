<%@page import="dao.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="dao.BookDao" %>
    <%@ page import="dao.cart" %>
            <%@ page import="dao.CustomerDao" %>
                     <%@ page import="dao.Customer" %>
                       <%@ page import="dao.DataDao" %>
                       <%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="navBar.jsp"%>
<%
String isbn= request.getParameter("isbn");
String title = request.getParameter("title");
int price = Integer.parseInt(request.getParameter("price"));
String mm= request.getParameter("paymethodType");
// String isbn = "책 isbn";
out.print(title);

BookDao dao = new BookDao();
CustomerDao cDao = new CustomerDao();
Customer cs = new Customer();

cs = cDao.selectCustomerInfo((String)user);

DataDao dao2 = new DataDao();


out.print(cs.getAddress());
out.print(cs.getCustomer_no());
out.print(cs.getEmail());
out.print(isbn);
out.print(user);
out.print(mm);
out.print(title);

// System.out.println(title);

// dao2.insertBookInPurchase(cs,"K272830385",13000); 규진씨가 처음에 작성한 코드

dao2.insertBookInPurchase(cs, isbn, price,mm,title);










%>
<script type="text/javascript">

if(confirm("구매를 진행합니다")){
	
	location.href = 'purchaseConfirmation.jsp';
}
	


</script>

</body>
</html>