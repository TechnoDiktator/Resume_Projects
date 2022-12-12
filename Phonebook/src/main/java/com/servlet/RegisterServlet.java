package com.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.UserDao;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {


	public void doPost(HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		User u = new User(name , email , password) ;
		DbConnect db = new DbConnect();
		Connection conn = db.getConn();		
		//-------------------------------------------------------------------TEST-------------------------------------
		if(conn == null) {
			System.out.println("----------------------------------------");
			System.out.println("The connection has not been established!!");
			System.out.println("----------------------------------------");
		}
		//------------------------------------------------------------------------------------------------------------
		
		UserDao d = new UserDao(conn);
		boolean result  =  d.userRegister(u);
		
		
		
		
		HttpSession session = request.getSession();
		
		
		if(result == true) {
			
			session.setAttribute("successMsg", "User registration successful");
			System.out.println("User Registered Successfully ");
			response.sendRedirect("register.jsp");
			
		}else {
			
			session.setAttribute("errorMsg","Something went wrong on the server !!!! Try again.");
			System.out.println("Something wrong on server.............");
			response.sendRedirect("register.jsp");
			
		}
		
		
	}
	
	
}
