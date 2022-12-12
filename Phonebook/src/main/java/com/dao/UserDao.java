package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.conn.DbConnect;
import com.entity.User;

public class UserDao {
	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	
	

	//new user registration
	public boolean userRegister(User u){
		boolean f = false;
		
	
		
		try {
			String sql = "insert into User (name , email , password) values(?,?,?)";
			
		
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			
			
			int i =  ps.executeUpdate();
			if(i == 1 ) {
				f =true;
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}	
	
	
	
	
	//login 
	public User loginUser(String e , String p) {
		
		User u = null;
		
		
		try {
			
			String sql = "select * from user where email=? and password=?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, e);	
			ps.setString(2, p);	
			
			ResultSet rs = ps.executeQuery();
					
			while(rs.next()) {
				
				u = new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				
				
			}
			
			
		} catch (Exception e2) {
			// TODO: handle exception
			e2.printStackTrace();
		
		}
		
		
		
		return u;
	}
	
	
	
	

}
