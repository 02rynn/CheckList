<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="dao.DataDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%

String id = request.getParameter("id");
String isbn = request.getParameter("isbn");
int cnt = Integer.parseInt(request.getParameter("cnt"));
out.print(id);
out.print(isbn);
out.print(cnt);
DataDao dao = new DataDao();

dao.updateBookInBskt(cnt,isbn,id);

%>
	<script>

var referrer = document.referrer;

location.href=referrer;


</script>
</body>
</html>