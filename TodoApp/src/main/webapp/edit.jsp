<%@page import="com.db.DBConnect"%>
<%@page import="com.DAO.ToDoDAO"%>
<%@page import="com.entity.TodoDtls"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Jsp</title>

<%@include file="component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="component/navbar.jsp"%>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center  text-success">UPDATE Todo</h3>
						<%
						int i=Integer.parseInt(request.getParameter("id"));
						ToDoDAO dao=new ToDoDAO(DBConnect.getConn());
						TodoDtls t=dao.getTodoById(i);
						%>
						
						
						
						
						<form action="update"  method="post">
						
	<input type="hidden" value="<%=t.getId()%>" name="id">
						
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp"  name="username"  value="<%=t.getName()%>">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">TODO</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="todo"  value="<%=t.getTodo()%>">

							</div>
							<div class="form-group ">
								<label for="inputState">Status</label> <select id="inputState"
									class="form-control"  name="status" >
									<%
									if("pending".equals(t.getStatus()))
									{%>
									<option value="pending" selected>Pending</option>
									<option value="complete">Complete</option>
									<% }
									else{
									%>	
									<option value="complete" selected>Complete</option>
									<option value="pending">Pending</option>
										
										<%
									}
									%>
								</select>
							</div>
							
							<div class="text-center">
								<button type="submit" class="btn btn-primary">UPDATE</button>
							</div>
						</form>



					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>