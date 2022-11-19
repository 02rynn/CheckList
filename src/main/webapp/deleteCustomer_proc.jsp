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
<%@ include file="navBar.jsp"%>

<%



// String id=request.getParameter((String)user);
DataDao dao = new DataDao();

int result = dao.deleteCustomer((String)user);
// int result2 = dao.deleteDataInCart((String)user);

if(result > 0 ){
%>      
<script>
alert('삭제되었습니다.')
location.href = "logOut_proc.jsp"</script>

<% 
}
%>
<script>location.href = "logOut_proc.jsp"</script>
</body>
</html>