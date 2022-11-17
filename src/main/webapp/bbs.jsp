<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR" %>
    <%@ page import = "dao.bBsDAO" %>
    <%@ page import = "dao.Review" %>
    <%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>


<%@ include file ="navBar.jsp" %>


    <div class="container">
        <div class="row">
                    
     <%
     
    
 	 bBsDAO dao = new bBsDAO();
 	 List<Review> rvList = dao.select_bbs_contents(); //�����ͺ��̽����� �޾ƿ� ����� ����Ʈ�� �����žƴϳİ�...
      %>
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;margin-top: 20px; width: 100%;
            maxlength=50">
                <thead> <!--���̺��� ���� -->
                    <tr>
                        <th style="background-color: #eeeeee; text-align: center;">��ȣ</th>
                       <th style="background-color: #eeeeee; text-align: center;">��ǰ�̸�</th>
                        <th style="background-color: #eeeeee; text-align: center;">����</th>
                        <th style="background-color: #eeeeee; text-align: center;">�۾���</th>
                        <th style="background-color: #eeeeee; text-align: center;">�����</th>
                        <th style="background-color: #eeeeee; text-align: center;">���� </th>
                    </tr>
                </thead>

                <tbody style="background-color:#eeeeee">
                <!-- �����ͺ��̽����� �۹�ȣ, å�̸�, å����, �۾���, �����, ���� ������ͼ� ����������  -->
            
      <%
      
      	if(rvList != null && rvList.size()>0){ //�迭�� null�� �ƴϰ� size�� 0���� ũ�� �ݺ��� ��������
      		for(Review  r : rvList){
      			%>
      			<tr>
      			
      			 <td><%= r.getReview_num() %></td>
      			<td><a href="watchReview.jsp"><%= r.getTitle() %></a></td> <!-- ���������� ������  -->
      			   <td><a href="watchReview.jsp"><%= r.getReview_title() %></a></td>
      			    <td><%= r.getId() %></td>
      			     <td><%= r.getReveiw_date() %></td>
      			      <td><%
      			    if(r.getReview_rate()== 1){
    			    	  out.println("�ڡ١١١�");
    			      }else if(r.getReview_rate() ==2){
    			    	  out.println("�ڡڡ١١�");		  
    			      }else if(r.getReview_rate() == 3){
    			    	  out.println("�ڡڡڡ١�");
    			      }else if(r.getReview_rate() == 4){
    			    	  out.println("�ڡڡڡڡ�");
    			      }else{
    			    	 out.println("�ڡڡڡڡ�");
    			      } 
      			      
      			      %></td>
     			 
     			 </tr>
      	<%
      		}
      	}
      %>
     
 
                  
                </tbody>
            </table>
             <a href="Write.jsp" class="btn btn-primary" style="width: 100px; position: relative; 
            left: 90%;">�۾��� </a>
           
        </div>
    </div>
    



</body>
</html>