<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("UTF-8");
String upId = request.getParameter("review_title");
String upqwe = request.getParameter("review_contents");
String name = request.getParameter("title");
out.print(upId);
out.print(upqwe);
out.print(name);

%>
</body>
</html>