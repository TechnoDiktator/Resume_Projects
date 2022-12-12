package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.TryCatchFinally;

import com.conn.DbConnect;
import com.dao.ContactDao;
import com.entity.Contact;

@WebServlet("/update")
public class EditContact extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int cid = Integer.parseInt(req.getParameter("cid"));
		String name   =  req.getParameter("name");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");
		String about = req.getParameter("about");
		//System.out.println(userid+" " +name+" " +email+ " " +phno+ " " +about);
		
		
		Contact c = new Contact();
		c.setName(name);
		c.setEmail(email);
		c.setPhoneno(phno);
		c.setAbout(about);
		
		ContactDao dao = new ContactDao(DbConnect.getConn());
		boolean ans = dao.updateCOntact(c);
		HttpSession session = req.getSession();
		if(ans == true) {
			session.setAttribute("succEditMsg", "your contact has been updated successfully....");
			resp.sendRedirect("viewcontacts.jsp");
		}else {
			session.setAttribute("failEditMsg", "Something went wrong on the server....");
			resp.sendRedirect("editcontact.jsp?cid="+cid);
		}
		
		
		
		
		
		super.doPost(req, resp);
	}

	
	
	
	
}
