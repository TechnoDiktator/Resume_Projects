package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Contact;

public class ContactDao {
	
	private Connection conn;

	public ContactDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public boolean saveContact(Contact c) {
		
		boolean f =  false;
		try {
			String sql = "insert into contact(name , email , phno , about , userid) values(?,?,?,?,?)";
			
			PreparedStatement ps =  conn.prepareStatement(sql);
			ps.setString(1, c.getName() );
			ps.setString(2, c.getEmail() );
			ps.setString(3, c.getPhoneno() );
			ps.setString(4, c.getAbout() );
			ps.setInt(5, c.getUserId() );
			
			
			int ans = ps.executeUpdate();
			if(ans==1) {
				f = true;
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		
		}
		
		
		return f;
		
		
	}
	
	
	public List<Contact> getallContacts(int userid){
		
		List<Contact> contactlist = new ArrayList();
		Contact c = null;
		try {
			String sql = "Select * from contact where userid=? ";
			PreparedStatement ps =  conn.prepareStatement(sql);
			
			ps.setInt(1, userid);
			ResultSet rs =  ps.executeQuery();
			
			//iterating through the result set and storing all the contacts in a list
			while(rs.next()) {
				c = new Contact();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setAbout(rs.getString(4));
				c.setUserId(rs.getInt(5));
				
				contactlist.add(c);
				
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return contactlist;
		
	}
	
	
	
	public Contact getContactById(int cid) {
		Contact c = new Contact();
		try {
			String sql = "select * from user where id=?";
			PreparedStatement ps =  conn.prepareStatement(sql);
			ps.setInt(1, cid);
			
			ResultSet result = ps.executeQuery();
			
			while(result.next()) {
				
				c.setId(result.getInt(1));
				c.setName(result.getString(2));
				c.setEmail(result.getString(3));
				c.setPhoneno(result.getString(4));
				c.setAbout(result.getString(5));
				
			}
			
			
		} catch (Exception e) {
			
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return c;
	}
	
	
	
	public boolean updateCOntact(Contact c) {
		
		boolean f =  false;
		try {
			String sql = "update contact set name=? , email=? , phno=? , about=?  where id =?";
			
			PreparedStatement ps =  conn.prepareStatement(sql);
			ps.setString(1, c.getName() );
			ps.setString(2, c.getEmail() );
			ps.setString(3, c.getPhoneno() );
			ps.setString(4, c.getAbout() );
			ps.setInt(5, c.getId() );
			
			
			int ans = ps.executeUpdate();
			if(ans==1) {
				f = true;
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		
		}
		
		
		return f;
		
	}
	
	
	public boolean deleteContactById(int cid) {
		boolean f = false;
		try {
			
			String sql = "delete from contact where  id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cid);
			int i  = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	

}
