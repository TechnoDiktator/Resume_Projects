package com.entity;

public class Contact {
	
	
	private int id;
	private String name;
	private String email;
	private String phoneno;
	private String about;
	
	private int userId;

	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Contact( String name, String address, String phoneno, String about, int userId) {
		super();
		
		this.name = name;
		this.email = email;
		this.phoneno = phoneno;
		this.about = about;
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	



	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

}
