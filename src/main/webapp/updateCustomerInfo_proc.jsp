<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dao.Customer"%>
<%@ page import="dao.DataDao"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%

//addPerson.jsp -> FORM �±� ��� "name"���� �Է��� �޾����� �Ѿ���� �̸� 
//submit -> action="addPerson.proc.jsp" ����� ��û�� ����. 
//��û��  request��� �ɷ� �Ķ���Ϳ� ��ܼ� ����.  

   String password = request.getParameter("password");
   String email = request.getParameter("email");
   String phone_num = request.getParameter("phone_num");
   String address = request.getParameter("address");
   String id = request.getParameter("id");
   
   Customer customer = new Customer();
   
   customer.setPassword(password);
   customer.setEmail(email);
   customer.setPhone_num(phone_num);
   customer.setAddress(address);
   customer.setId(id);
   
   out.println(password);
	
// 	Customer customerInfo = new Customer();
// 	customerInfo.setPassword(password);
// 	customerInfo.setEmail(id);
// 	customerInfo.setId(id);
// 	customerInfo.setId(id);
// 	customerInfo.setId(id);
	
	
  DataDao dao = new DataDao();
   int result = dao.updateCustomerInfo(customer);
    
   if(result > 0){
%>      
   <script>
    alert('�����Ǿ����ϴ�.')
   	location.href = "JSPSample.jsp";
   </script>
   <%    
   
   }else{

         %>   
      
   <script>
   	alert('���� �����߽��ϴ�.')
   	location.href = "personInfoDetail.jsp?id=<%=id%>";
   </script>
   
   <% 
   }
   %>
<script>location.href = "JSPSample.jsp"</script>
</body>
</html>