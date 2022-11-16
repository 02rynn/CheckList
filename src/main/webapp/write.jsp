<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="dao.bBsDAO"%>
<%@ page import="dao.Book"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<title>�ı��ۼ� ������</title>
</head>
<body>

	<%
// 	String user = session.getAttribute("userId").toString();

	bBsDAO dao = new bBsDAO();
	

	String name = "asd";
	List<Book> buyItems = dao.selectBuyBookList(name);
	
	//�α��� �ȵǾ������� �α��� �������� �̵�
	%>


	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">checkList</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#">Pricing</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Dropdown link
					</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
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
			<form method="get" action="writeAction2.jsp">
				<!--action�������� ������ �ֵ��� -->
				<!--post �޼ҵ�� ����鼭 ����, �׼����������� ó���� �� �ֵ��� ������  -->

				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd; margin-top: 20px; width: 100%;">
					<thead>
						<!--���̺��� ���� -->
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">�Խ���
								�۾��� ���</th>
						</tr>
						<tr>
							<th><span>��ǰ���</span> 
							<select name="select">
										<%
											for(Book bk : buyItems){
												%>
													<option id="option" value=<%=bk.getTitle() %>>	
												<%=bk.getTitle() %>
												</option>
										<% 		
											}
										%>
									

							</select>
							<th />
						<tr />
					</thead>
					<!--  -->
					<tbody style="background-color: #eeeeee">
						<tr>
							<td><input type="text" class="form-control"
								placeholder="�� ����" name="review_title" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea type="text" class="form-control"
									placeholder="�� ����" name="review_contents" maxlength="2048"
									style="height: 350px;"></textarea></td>
							<!---->
						</tr>
					</tbody>
				</table>

				<div class="bbs"
					style="display: flex; align-items: center; justify-content: flex-end">
					<input id="saveBtn" type="submit" class="btn btn-outline-primary" value="�����ϱ�"
						style="width: 100px;">

					<div class="customSelectDiv designSettingElement shape "
						id="selectPostReviewRateDiv" style="margin-left: 10px;"
						data-text="���� �ֱ�">



						<select name="rvrate" class="btn btn-outline-primary"
							onchange="require('common/common').customSelectBoxClickEvent(this)"
							id="selectPostReviewRate">
							<option value="0" selected="selected">���� �ֱ�</option>
							<option value="5">�ڡڡڡڡ�</option>
							<option value="4">�ڡڡڡڡ�</option>
							<option value="3">�ڡڡڡ١�</option>
							<option value="2">�ڡڡ١١�</option>
							<option value="1">�ڡ١١١�</option>
						</select>

					</div>
				</div>

			</form>
		</div>
	</div>

	<div class="btn-wrapper save-post-wrapper field">
		<button id="goListReviewInBoardProduct" type="button"
			class="btn btn-outline-dark" style="margin-left: 40px;"
			onclick="history.back()">������� ����</button>
	</div>
	</div>

<script>
/* document.getElementById("updateBtn").addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.personDetailForm;
    if (form.personName.value == "") { // �̸��� ���� ���
      alert("�̸��� �ʼ��Դϴ�.");
      form.personName.focus();
      return false;
    } else { // �̸��� �ִ� ���
      if (confirm("�����Ͻðڽ��ϱ�?")) {
        form.action = "updatePerson_proc.jsp";
        form.submit();
      }
    }
  }); */
  
  
  document.getElementById("saveBtn").addEventListener("click", (e) => {
	    e.preventDefault();
	    
	    //������ writeAction2�� ��������
	    location.href = "writeAction2.jsp"
	    		
	    form.action = "writeAction2.jsp";
        form.submit();
  }


</script>
</body>
</html>