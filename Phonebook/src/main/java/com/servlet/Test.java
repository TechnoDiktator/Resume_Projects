package com.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.conn.DbConnect;

public class Test {

	public static void main(String args[]) {
		
		DbConnect db = new DbConnect();
		
		Connection con = db.getConn();
		
		System.out.println(con);
		
		
	 
	}
	
	
	
}
