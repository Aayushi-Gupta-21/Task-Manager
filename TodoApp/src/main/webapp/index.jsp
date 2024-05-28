<%@page import="com.db.DBConnect"%>
<%@page import="com.DAO.ToDoDAO"%>
<%@page import="com.entity.TodoDtls"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Jsp</title>
<%@include file="component/all_css.jsp"%>

</head>
<body>
	<%@include file="component/navbar.jsp"%>



	<h1 class="text-center text-success">TODO APP</h1>

	<%
	String sucmsg = (String) session.getAttribute("success_msg");
	if (sucmsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=sucmsg%></div>
	<%
	session.removeAttribute("sucmsg");
	}
	%>

	<%
	String failmsg = (String) session.getAttribute("failed_msg");
	if (failmsg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=failmsg%></div>
	<%
	session.removeAttribute("failmsg");
	}
	%>


	<div class="container">
		<table class="table table-striped" border="1px">
			<thead class="bg-success text-white">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Todo</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
			<%
			ToDoDAO dao=new ToDoDAO(DBConnect.getConn());
			List<TodoDtls> todo=dao.getTodo();			
			for(TodoDtls t:todo)
			{%>
				<tr>
					<th scope="row"><%=t.getId() %></th>
					<td><%=t.getName() %></td>
					<td><%=t.getTodo() %></td>
					<td><%=t.getStatus() %></td>
					<td>
				<a href="edit.jsp?id=<%=t.getId()%>" class="btn btn-sm btn-success"> Edit </a>
				 <a href="delete?id=<%=t.getId()%>" class="btn btn-sm btn-danger"> Delete </a>
				 
				 </td>
				</tr>
				
				
			<% }
			
			%>
			
			
			
			
			
			
			
			
			
			
			
				

			</tbody>
		</table>
	</div>

</body>
</html>