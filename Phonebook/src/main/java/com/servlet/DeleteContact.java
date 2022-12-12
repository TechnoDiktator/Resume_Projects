package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.ContactDao;


@WebServlet("/delete")
public class DeleteContact extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cid = Integer.parseInt(req.getParameter("cid"));
		
		ContactDao dao = new ContactDao(DbConnect.getConn());
		boolean f = dao.deleteContactById(cid);
		HttpSession session = req.getSession();
		if(f == true) {
			
			session.setAttribute("succMsg", "Contact Deleted successfullyt....");
			resp.sendRedirect("viewcontacts.jsp");
			
		}else {
			session.setAttribute("FailedMsg", "Something Worng on server....");
			resp.sendRedirect("viewcontacts.jsp");
		}
		
		
		
		super.doGet(req, resp);
	}

	
	
	
}
