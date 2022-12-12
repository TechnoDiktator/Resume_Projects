package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.ha.ServerAffinityStrategy;





@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session =  req.getSession();
		
		//removing session and redirecting to login page
		session.removeAttribute("user");
		
		HttpSession session2 = req.getSession();
		session2.setAttribute("logoutMsg", "Logged Out Successfully !!!");
		resp.sendRedirect("login.jsp");
		
	}

	
	
}
