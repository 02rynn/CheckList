<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
    <%@ page import="dao.Customer" %>
       <%@ page import="dao.CustomerDao" %>
        <%@ page import="dao.Book" %>
         <%@ page import="dao.BuyBookDao" %>
                  <%@ page import="dao.DataDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="navBar.jsp" %>
<%

String meth = request.getParameter("paymethodType");
String title = request.getParameter("title");
DataDao dao=new DataDao(); 
CustomerDao cDao = new CustomerDao();
Customer cs = new Customer();
out.print((String)user);
List<Book> bk = dao.selectBuyBookInfo((String)user);

cs = cDao.selectCustomerInfo((String)user);

out.print(bk.size());


for(int i = 0 ; i < bk.size();i++){
	Book book = bk.get(i);
	
	
	dao.insertBookInPurchase(cs, book.getIsbn(),book.getPrice(),meth,book.getTitle());
	
	
}



%>
<script type="text/javascript">

if(confirm("구매를 진행합니다")){
	
	location.href = 'purchaseConfirmation.jsp';
}
	


</script>
</body>
</html>