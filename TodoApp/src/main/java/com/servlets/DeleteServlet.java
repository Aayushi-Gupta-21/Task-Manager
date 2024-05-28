package com.servlets;

import java.io.IOException;

import com.DAO.ToDoDAO;
import com.db.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		String username=req.getParameter("username");
		String todo=req.getParameter("todo");
		String status=req.getParameter("status");
		ToDoDAO dao=new ToDoDAO(DBConnect.getConn());
		boolean f=dao.deleteTodo(id);
        HttpSession hs=req.getSession();
		if(f) {
			hs.setAttribute("success_msg","Todo deleted succesfully");
			resp.sendRedirect("index.jsp");
		}
		else {
			hs.setAttribute("failed_msg","Todo deletion failed");
			resp.sendRedirect("index.jsp");
		}
	}
}
