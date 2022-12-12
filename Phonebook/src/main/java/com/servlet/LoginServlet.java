package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.UserDao;
import com.entity.User;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = req.getParameter("name");
		String pass = req.getParameter("password");
		
		UserDao dao = new UserDao(DbConnect.getConn());
		User u = dao.loginUser(email, pass);
		
		HttpSession session =  req.getSession();
		
		
		//if the user actually exists
		if(u!=null) {
			System.err.println("User is available " +u.toString());
			session.setAttribute("user", u);
			resp.sendRedirect("index.jsp");
			
		}else {
			
			System.err.println("User is not available" +u);
			session.setAttribute("invalidMsg", "Invalid Email and/or Password");
			resp.sendRedirect("index.jsp");			
			
		}
		
		
		
		
		super.doPost(req, resp);
		
		
		
	}

	
	
	
}
