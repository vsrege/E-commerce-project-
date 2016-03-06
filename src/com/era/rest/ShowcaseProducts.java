package com.era.rest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
//import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.json.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.sun.jersey.api.view.Viewable;

@Path("/getProduct") 
public class ShowcaseProducts {
	
	
	Connection conn = null;
	
	public Connection connect() throws SQLException{
		try {
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			
			conn = DriverManager.getConnection("jdbc:mysql://era81site.cuul94fk24zg.us-west-2.rds.amazonaws.com:3306/era81", "root", "era81test");
			//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/era81", "root", "era@test");
			//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/era81", "root", "");
			if(!conn.isClosed()){
				System.out.println("Connection Successful");
				
			}
			else{
				System.out.println("Connection Error!!");
			}
			 
		     
		      
		     
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
			
	return conn;		
	}
	

	@GET
	@Path("/getMenu")
	@Consumes(MediaType.APPLICATION_JSON)
	public String getMenu( @Context HttpServletRequest request,
		      @Context HttpServletResponse response)throws Exception{
		
		
		Connection conn = connect();
		
			
	 //apparel
			String query = "SELECT id,categoryname from category where parentcategory='1'";
			
			
	
			
			
			JSONArray list_apparel = new JSONArray();
			JSONArray list_apparel_cat = new JSONArray();
			
			PreparedStatement stmt = conn.prepareStatement(query);
			ResultSet rs1 = stmt.executeQuery(query);
			
			while(rs1.next())
			{
				
				list_apparel.put(rs1.getInt(1));
				list_apparel_cat.put(rs1.getString(2));
			
			}
			
			//accessories
			Connection conn2 = connect();
			String query2 = "SELECT id,categoryname from category where parentcategory='2'";
			
			
			PreparedStatement stmt2 = conn2.prepareStatement(query2);
			ResultSet rs2 = stmt2.executeQuery(query2);
			JSONArray list_accessory = new JSONArray();
			JSONArray list_accessory_cat = new JSONArray();
			
			while(rs2.next())
			{
				
				list_accessory.put(rs2.getInt(1));
				list_accessory_cat.put(rs2.getString(2));
				
			
			}
			//System.out.println(list_accessory);
			//System.out.println(list_accessory_cat);
			JSONObject final_obj = new JSONObject();
			final_obj.put("apparelids", list_apparel);
			final_obj.put("apparelnames", list_apparel_cat);
			final_obj.put("accessoryids", list_accessory);
			final_obj.put("accessorynames", list_accessory_cat);
			String finalObj = final_obj.toString();
			System.out.println("JSON menu"+finalObj);
			if(conn!=null || conn2!=null)
			{
				conn.close();
				conn2.close();
			}
			return finalObj;
}
	
	
	@GET
	@Path("/showProducts")
	@Consumes(MediaType.APPLICATION_JSON)
	public String showProducts(String data, @Context HttpServletRequest request,
		      @Context HttpServletResponse response)throws Exception{

	
		Connection conn = connect();
	
	
 //apparel
		String query = "SELECT p.id,p.price,p.imageurl,p.name,u.fname,u.lname from product as p,user as u where p.designerid=u.id order by p.name asc";
		System.out.println(query);
		

		
		
		JSONArray prodid = new JSONArray();
		JSONArray price=new JSONArray();
		JSONArray image=new JSONArray();
		JSONArray productname=new JSONArray();
		JSONArray designername = new JSONArray();
		JSONObject final_obj = new JSONObject();
		
		PreparedStatement stmt = conn.prepareStatement(query);
		ResultSet rs1 = stmt.executeQuery(query);
		
		while(rs1.next())
		{
			
			prodid.put(rs1.getInt(1));
			price.put(rs1.getInt(2));
			image.put(rs1.getString(3));
			productname.put(rs1.getString(4));
			designername.put(rs1.getString(5)+" "+rs1.getString(6));
		
		}
		
		final_obj.put("productid", prodid);
		final_obj.put("price", price);
		final_obj.put("imageurl", image);
		final_obj.put("productnames", productname );
		final_obj.put("designernames", designername );
		
		String finalObj = final_obj.toString();
		System.out.println("JSON productlist"+finalObj);
		if(conn!=null)
		{
			conn.close();
		}
		return finalObj;
		
}

	
	//get products by color choice
	
	
	
	@POST
	@Path("/getProductByChoice")
	@Consumes(MediaType.APPLICATION_JSON)
	public String getProductByChoice(String data, @Context HttpServletRequest request,
		      @Context HttpServletResponse response)throws Exception{

		System.out.println(data);
	
		Connection conn = connect();
	
	
 //color
		String query = "SELECT p.id,p.price,p.imageurl,p.name,u.fname,u.lname from product as p,user as u,color as c where p.designerid=u.id and p.colorid=c.id and c.color='"+data+"' order by p.name asc";
		System.out.println(query);
		

		
		
		JSONArray prodid = new JSONArray();
		JSONArray price=new JSONArray();
		JSONArray image=new JSONArray();
		JSONArray productname=new JSONArray();
		JSONArray designername = new JSONArray();
		JSONObject final_obj = new JSONObject();
		
		PreparedStatement stmt = conn.prepareStatement(query);
		ResultSet rs1 = stmt.executeQuery(query);
		
		while(rs1.next())
		{
			
			prodid.put(rs1.getInt(1));
			price.put(rs1.getInt(2));
			image.put(rs1.getString(3));
			productname.put(rs1.getString(4));
			designername.put(rs1.getString(5)+" "+rs1.getString(6));
		
		}
		
		final_obj.put("productid", prodid);
		final_obj.put("price", price);
		final_obj.put("imageurl", image);
		final_obj.put("productnames", productname );
		final_obj.put("designernames", designername );
		
		String finalObj = final_obj.toString();
		System.out.println("JSON productlist"+finalObj);
		if(conn!=null)
		{
			conn.close();
		}
		return finalObj;
		
}

	
	
	@POST
	@Path("/getProductByGender")
	@Consumes(MediaType.APPLICATION_JSON)
	public String getProductByGender(String data, @Context HttpServletRequest request,
		      @Context HttpServletResponse response)throws Exception{

		
		String[] arr = new String[]{};
		arr = data.split(",");
	
	String gender = "";
	for(int i = 0; i < arr.length; i++) {
		
		  gender += "'" + arr[i] + "',";
		}
	
	if (gender.endsWith(",")) {
		if(gender.length()>1){
		gender = gender.substring(0, gender.length() - 1);
		}
		else{
		gender = gender.substring(0, gender.length());
		}
		}
	
		Connection conn = connect();
	
	
 //color
		String query = "SELECT p.id,p.price,p.imageurl,p.name,u.fname,u.lname from product as p,user as u where p.designerid=u.id and p.gender in("+gender+") order by p.name asc";
		System.out.println(query);
		

		
		
		JSONArray prodid = new JSONArray();
		JSONArray price=new JSONArray();
		JSONArray image=new JSONArray();
		JSONArray productname=new JSONArray();
		JSONArray designername = new JSONArray();
		JSONObject final_obj = new JSONObject();
		
		PreparedStatement stmt = conn.prepareStatement(query);
		ResultSet rs1 = stmt.executeQuery(query);
		
		while(rs1.next())
		{
			
			prodid.put(rs1.getInt(1));
			price.put(rs1.getInt(2));
			image.put(rs1.getString(3));
			productname.put(rs1.getString(4));
			designername.put(rs1.getString(5)+" "+rs1.getString(6));
		
		}
		
		final_obj.put("productid", prodid);
		final_obj.put("price", price);
		final_obj.put("imageurl", image);
		final_obj.put("productnames", productname );
		final_obj.put("designernames", designername );
		
		String finalObj = final_obj.toString();
		//System.out.println("JSON productlist"+finalObj);
		if(conn!=null)
		{
			conn.close();
		}
		return finalObj;
		
}
	
	
	//Costwise filter
	@POST
	@Path("/getProductByCost")
	@Consumes(MediaType.APPLICATION_JSON)
	public String getProductByCost(String data, @Context HttpServletRequest request,
		      @Context HttpServletResponse response)throws Exception{

		
		String[] arr = new String[]{};
		arr = data.split(",");
		System.out.println(arr[0]+"to"+arr[1]);
	

		Connection conn = connect();
	
	
 //color
		String query = "SELECT p.id,p.price,p.imageurl,p.name,u.fname,u.lname from product as p,user as u where p.designerid=u.id and p.price between "+arr[0]+" and "+arr[1]+" order by p.name asc";
		System.out.println(query);
		

		
		
		JSONArray prodid = new JSONArray();
		JSONArray price=new JSONArray();
		JSONArray image=new JSONArray();
		JSONArray productname=new JSONArray();
		JSONArray designername = new JSONArray();
		JSONObject final_obj = new JSONObject();
		
		PreparedStatement stmt = conn.prepareStatement(query);
		ResultSet rs1 = stmt.executeQuery(query);
		
		while(rs1.next())
		{
			
			prodid.put(rs1.getInt(1));
			price.put(rs1.getInt(2));
			image.put(rs1.getString(3));
			productname.put(rs1.getString(4));
			designername.put(rs1.getString(5)+" "+rs1.getString(6));
		
		}
		
		final_obj.put("productid", prodid);
		final_obj.put("price", price);
		final_obj.put("imageurl", image);
		final_obj.put("productnames", productname );
		final_obj.put("designernames", designername );
		
		String finalObj = final_obj.toString();
		//System.out.println("JSON productlist"+finalObj);
		if(conn!=null)
		{
			conn.close();
		}
		return finalObj;
		
}
	
	
	
	//get product for product page
	@POST
	@Path("/getProductById")
	@Consumes(MediaType.APPLICATION_JSON)
	public String getProductById(String data, @Context HttpServletRequest request,
		      @Context HttpServletResponse response)throws Exception{

		System.out.println(data);
	
		Connection conn = connect();
	
	
 //color
		String query = "SELECT p.id,p.price,p.imageurl,p.description,p.name,u.fname,u.lname,c.color,s.size,u.profilepic from product as p,user as u,color as c,size as s where p.designerid=u.id and p.colorid=c.id and p.sizeid=s.id and p.id='"+data+"' order by p.name asc";
		System.out.println(query);
		

		JSONArray prodchildid = new JSONArray();
		JSONArray prodchildurl = new JSONArray();
		

		
		JSONObject final_obj = new JSONObject();
		
		PreparedStatement stmt = conn.prepareStatement(query);
		ResultSet rs1 = stmt.executeQuery(query);
		
		while(rs1.next())
		{
			
			
			final_obj.put("productid", rs1.getInt(1));
			final_obj.put("price", rs1.getInt(2));
			final_obj.put("imageurl", rs1.getString(3));
			final_obj.put("desc", rs1.getString(4));
			final_obj.put("productname", rs1.getString(5) );
			final_obj.put("designername", rs1.getString(6)+" "+rs1.getString(7) );
			final_obj.put("color", rs1.getString(8) );
			final_obj.put("size", rs1.getString(9) );
			final_obj.put("profilepic", rs1.getString(10) );
		}
		
		String query2 = "SELECT id,url from productpics where parentproduct='"+data+"'";
		System.out.println(query2);
		PreparedStatement stmt2 = conn.prepareStatement(query2);
		ResultSet rs2 = stmt.executeQuery(query2);
		while(rs2.next())
		{
			prodchildid.put(rs2.getInt(1));
			prodchildurl.put(rs2.getString(2));
		}
		final_obj.put("pchildids", prodchildid);
		final_obj.put("pchildurls", prodchildurl);
		
		String finalObj = final_obj.toString();
		
		if(conn!=null)
		{
			conn.close();
		}
		return finalObj;
		
}

	
	
}//end showcaseproducts
