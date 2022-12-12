package com.conn;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnect {
	
	
	private static Connection conn;
	
	public static Connection getConn() {
		
		if(conn == null) {
			System.out.println("DbConnect trying to make a new connection to phonebook database");
			
		    try {
		    	System.out.println("Entered try block");
		        Class.forName("com.mysql.cj.jdbc.Driver");
		        System.out.println("Driver loading ......success!");
		        String url = "jdbc:mysql://localhost:3306/phonebook";
		        String name = "root";
		        String password = "PlusOne97@";
		        try {
		        	System.out.println("Attempting connection to DB");
		            conn = DriverManager.getConnection(url, name, password);
		            System.out.println("Connected to DB.");
		           
		           
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
	
		    } catch (ClassNotFoundException e) {
		        e.printStackTrace();
		    }
			
		}
		
		
		return conn;
		
		
	}
	
	
	

}
