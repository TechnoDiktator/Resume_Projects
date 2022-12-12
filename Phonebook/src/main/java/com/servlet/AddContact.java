package com.servlet;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.ContactDao;
import com.entity.Contact;


@WebServlet("/addContact")
public class AddContact extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		int userid = Integer.parseInt(req.getParameter("userid")); 
		String name   =  req.getParameter("name");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");
		String about = req.getParameter("about");
		//System.out.println(userid+" " +name+" " +email+ " " +phno+ " " +about);
		
		Contact c = new Contact(name , email ,phno, about , userid) ;
		ContactDao dao = new ContactDao(DbConnect.getConn());
		boolean result = dao.saveContact(c);
		HttpSession session = req.getSession();
		
		
		if(result == true) {
			
			session.setAttribute("succAddMsg", "your contact has been saved successfully....");
			resp.sendRedirect("addContacts.jsp");
			
		}else {
			
			session.setAttribute("failAddMsg", "Something went wrong on the server....");
			resp.sendRedirect("addContacts.jsp");
			
		}
		
		

		
		super.doPost(req, resp);
		
		
		
	}

	
	
	
}
