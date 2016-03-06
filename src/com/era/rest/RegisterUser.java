package com.era.rest;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.sun.jersey.api.view.Viewable;


@Path("/insertUser") 
public class RegisterUser {

	@POST
	@Path("/insertReg")
	@Consumes(MediaType.APPLICATION_JSON)
	public String insertReg(String data, @Context HttpServletRequest request,
		      @Context HttpServletResponse response)throws Exception{
		System.out.println(data);
		
	
		Connection conn = null;
		
		
			try {
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn = DriverManager.getConnection("jdbc:mysql://era81site.cuul94fk24zg.us-west-2.rds.amazonaws.com:3306/era81", "root", "era81test");
				//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/era81", "root", "era@test");
				//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/era81", "root", "");
				if(!conn.isClosed()){
					System.out.println("Connection Successful");
					
				}else{
					System.out.println("Connection Error!!");
				}
				 
			      System.out.println("Connection to server sucessfully");
			      
			     
			}
				catch (InstantiationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(data);
			 
			JSONObject jsonObject = (JSONObject) obj;
	 
			String fname = (String) jsonObject.get("firstname");
			System.out.println(fname);
			String email = (String) jsonObject.get("email");
			System.out.println(email);
			String pass = (String) jsonObject.get("pass");
			System.out.println(pass);
			String acc="customer";
			String profilepic="images/profilepics/alice.jpeg";
			
	 
			String query = "INSERT into user(fname,email,password,acctype,profilepic) values (?, ?, ?, ?, ?)";
			System.out.println(query);
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setString(1, fname);
			stmt.setString(2, email);
			stmt.setString(3, getHash(pass));
			stmt.setString(4, acc);
			stmt.setString(5, profilepic);
			
			int rowcount = stmt.executeUpdate();
			System.out.println(rowcount);
			String result="";
			
		if(rowcount>0)
		{
			
			System.out.println("Registration added successfully!");
			result="Registration added successfully!";
			
			HttpSession session=request.getSession();
			//session.setAttribute("first", fname);
			//session.setAttribute("email", email);
			session.setAttribute("firstname", fname);
			session.setAttribute("accounttype", acc);
			session.setAttribute("email", email);
			session.setAttribute("picurl", profilepic);
			
			
			if(conn!=null)
			{
				conn.close();
			}
			
			return result;
		}
		else
		{
			result="Registration unsuccessful!";
			
			if(conn!=null)
			{
				conn.close();
			}
			
			return result;
		}
		
		
}
	
	
	@POST
	@Path("/chkReg")
	@Consumes(MediaType.APPLICATION_JSON)
	public void chkReg(String data, @Context HttpServletRequest request,
		      @Context HttpServletResponse response)throws Exception{
		System.out.println(data);
		
	
		Connection conn = null;
		
		
			try {
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn = DriverManager.getConnection("jdbc:mysql://era81site.cuul94fk24zg.us-west-2.rds.amazonaws.com:3306/era81", "root", "era81test");
				//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/era81", "root", "era@test");
				//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/era81", "root", "");
				if(!conn.isClosed()){
					System.out.println("Connection Successful");
					
				}else{
					System.out.println("Connection Error!!");
				}
				 
			      System.out.println("Connection to server sucessfully");
			      
			     
			}
				catch (InstantiationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(data);
			 
			JSONObject jsonObject = (JSONObject) obj;
	 
			
			String email = (String) jsonObject.get("email");
			//System.out.println(email);
			String pass = (String) jsonObject.get("pass");
			//System.out.println(pass);
			String hashpass = getHash(pass);
			
			
	 
			String query = "SELECT COUNT(*),fname,lname,acctype,profilepic from user where email='"+email+"' and password='"+hashpass+"'";
			//System.out.println(query);
			
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.execute();
			ResultSet rs = stmt.getResultSet();
			rs.first();
			int cnt = rs.getInt(1);
			String firstname = rs.getString(2);
			String lastname = rs.getString(3);
			String acctype = rs.getString(4);
			String pic = rs.getString(5);
			String result="";
			if (cnt > 0) {
				
				
				System.out.println("Welcome existing user!");
				result="User exists!";
				
				HttpSession session=request.getSession();
				System.out.println(session);
				session.setAttribute("firstname", firstname);
				session.setAttribute("lastname", lastname);
				session.setAttribute("accounttype", acctype);
				session.setAttribute("email", email);
				session.setAttribute("picurl", pic);
				
				if(conn!=null)
				{
					conn.close();
				}
				result="Registration successful!";
				System.out.println(result);
				
			} else {
				
				if(conn!=null)
				{
					conn.close();
				}
				result="Registration unsuccessful!";
				
				
			}
			
		
}
	
	
	
	
	public String getHash(String str) throws Exception{
		
		MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(str.getBytes());
 
        byte byteData[] = md.digest();
 
        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
 
        String hex = sb.toString();
        //System.out.println(hex);
        return hex; 
 
	}
}
