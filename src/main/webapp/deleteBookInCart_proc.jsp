<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dao.DataDao"%>
<%@ page import="dao.Book"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%


String isbn=request.getParameter("isbn");
String id=request.getParameter("id");
DataDao dao = new DataDao();

int result = dao.deleteBookInCart(id,isbn);
 
if(result > 0){
%>      
<script>
alert('삭제되었습니다.')
location.href = "cart.jsp"</script>
<%    

}else{

      %>   
   
<script> alert('삭제에 실패했습니다.')
location.href = "cart.jsp?isbn=<%=isbn%>";
</script>

<% 
}
%>
<script>location.href = "cart.jsp"</script>
</body>
</html>