package com.servlets;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session=req.getSession();  
        session.invalidate(); 
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        out.println("YOU HAVE SUCCESFULLY LOGGED OUT");
       
        RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
        rd.include(req, resp); 

	}
}