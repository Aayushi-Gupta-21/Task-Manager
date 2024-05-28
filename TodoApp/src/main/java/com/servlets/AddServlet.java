package com.servlets;
import java.sql.Date;
import java.io.IOException;

import com.DAO.ToDoDAO;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/add_todo")
public class AddServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String username=req.getParameter("username");
		String todo=req.getParameter("todo");
		String status=req.getParameter("status");
		ToDoDAO dao=new ToDoDAO(DBConnect.getConn());
		boolean f=dao.addTodo(username, todo, status);
		HttpSession hs=req.getSession();
		if(f) {
			hs.setAttribute("success_msg","Todo Added succesfully");
			resp.sendRedirect("index.jsp");
		}
		else {
			hs.setAttribute("failed_msg","Todo failed to be added");
			resp.sendRedirect("index.jsp");
		}
	}
}
