<%@ page import="dao.CustomerDao" %>
	<%@ page import="dao.Customer" %>
		<%@ page import="java.io.PrintWriter" %>
			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>Insert title here</title>
				</head>

				<body>
					<% PrintWriter script=response.getWriter(); String id=request.getParameter("inid"); String
						pw=request.getParameter("inpw"); out.print(id); out.print(pw); CustomerDao dao=new
						CustomerDao(); Customer cs=null; cs=dao.selectCustomerInfo(id); out.print(cs.getId());
						out.print(cs.getPassword()); if(id.equals(cs.getId()) && pw.equals(cs.getPassword())){
						session.setAttribute("userId", id); script.println("<script>");
						script.println("alert('로그인 성공');");
						script.println("location.href = 'main.jsp';");
						script.println("location.href = 'main.jsp';");
						script.println("</script>");
						script.close();
						}else{
						script.println("<script>");
							script.println("alert('로그인 실패');");
							script.println("location.href = 'index.jsp';");
							script.println("</script>");
						script.close();

						}


						%>
				</body>

				</html>