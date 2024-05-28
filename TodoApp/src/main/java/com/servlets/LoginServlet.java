package com.servlets;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String uname=req.getParameter("uname");
		String pwd=req.getParameter("pwd");
		
		HttpSession hs=req.getSession();

		if((uname.equals("admin") && pwd.equals("root"))) {
			
			resp.sendRedirect("index.jsp");
		}
		else {
			hs.setAttribute("failed_msg","Username and password incorrect");
			resp.sendRedirect("Login.jsp");
		}
	}
}