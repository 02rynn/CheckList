<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">checkList</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Pricing</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                        Dropdown link
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div style="margin: 35px;">
            <a href="">My Page</a>
        </div>
        <div style="margin: 35px;">
            <a href="">LOGIN</a>
        </div>
    </div>
</nav>


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
      			  <td><%= r.getTitle() %></td>
      			   <td><%= r.getReview_title() %></td>
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
             <a href="write.jsp" class="btn btn-primary" style="width: 100px; position: relative; 
            left: 90%;">�۾��� </a>
           
        </div>
    </div>
    



</body>
</html>