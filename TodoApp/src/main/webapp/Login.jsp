<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="component/all_css.jsp"%>
</head>
<body>
<body style="background-color: #f0f1f2;">


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
		<div class="row p-5">
			<div class="col-md-6 offset-md-3">
				<div class="card">
				<h2 class="text-center  text-success">TASK MANAGER</h2>
					<div class="card-body">
						<h3 class="text-center  text-success">Login</h3>
						
						
						<form action="login"  method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Username</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp"  name="uname">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Password</label> <input type="password"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="pwd">

							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">LOGIN</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>