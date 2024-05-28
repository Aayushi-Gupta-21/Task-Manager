package com.servlets;
import java.io.IOException;

import com.DAO.ToDoDAO;
import com.db.DBConnect;
import com.entity.TodoDtls;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		String username=req.getParameter("username");
		String todo=req.getParameter("todo");
		String status=req.getParameter("status");
		
		ToDoDAO dao=new ToDoDAO(DBConnect.getConn());
		TodoDtls t=new TodoDtls();
		t.setId(id);
		t.setName(username);
		t.setTodo(todo);
		t.setStatus(status);
		
		boolean f=dao.updateTodo(t);
		HttpSession hs=req.getSession();
		
		if(f) {
			hs.setAttribute("success_msg","Todo updated succesfully");
			resp.sendRedirect("index.jsp");
		}
		else {
			hs.setAttribute("failed_msg","Todo update failed");
			resp.sendRedirect("index.jsp");
		}
	}
}
