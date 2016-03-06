package com.era.rest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

//import org.json.JSONArray;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;




@Path("/placeOrder") 
public class processOrder {
	
Connection conn = null;
	
	public Connection connect() throws SQLException{
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
	
	@POST
	@Path("/insertOrder")
	@Consumes(MediaType.APPLICATION_JSON)
	public String insertOrder(String data, @Context HttpServletRequest request,
		      @Context HttpServletResponse response)throws Exception{

		System.out.println(data);
	
		Connection conn = connect();
		JSONParser parser = new JSONParser();
		 
		JSONObject jsonObject = (JSONObject) parser.parse(data);
		
	
		JSONArray firstName = (JSONArray) jsonObject.get("user");
		JSONArray email = (JSONArray) jsonObject.get("email");
		JSONArray prodid = (JSONArray) jsonObject.get("prodid");
		JSONArray cost = (JSONArray) jsonObject.get("price");
		JSONArray size = (JSONArray) jsonObject.get("size");
		JSONArray color = (JSONArray) jsonObject.get("color");
		JSONArray prodname = (JSONArray) jsonObject.get("prodname");
		JSONArray url = (JSONArray) jsonObject.get("itempicurl");
		
		
		
		Object totalcost = jsonObject.get("subtotal");
		
		            Object name = null;Object emailid=null;
		            
		            
		            
					for(int i=0; i<firstName.size(); i++){
		
		                
		                name = firstName.get(i);
		                emailid = email.get(i);
		               
		            }
					
					Date today=new Date();

					
					
					int random = (int)(Math.random()*9000)+1000;
					
					
		String ostatus="Open";
		String pstatus="Unpaid";
		String query = "INSERT into orders (customer,placed_on,email,order_id,totalamount,order_status,payment_status) values(?,?,?,?,?,?,?)";
		System.out.println(query);	
		PreparedStatement stmt = conn.prepareStatement(query);
		stmt.setObject(1, name);
		stmt.setObject(2, today);
		stmt.setObject(3, emailid);
		stmt.setInt(4, random);
		stmt.setObject(5, totalcost);
		stmt.setString(6, ostatus);
		stmt.setString(7, pstatus);
		
		int rowcount = stmt.executeUpdate();
		System.out.println(rowcount);
		
			
		for(int i=0; i<prodid.size(); i++){
			Object pid = prodid.get(i);
			Object pname = prodname.get(i);
			Object ocost = cost.get(i); 
			Object iurl = url.get(i); 
			Object pcolor = color.get(i); 
			Object psize = size.get(i);
			
		String query2 = "INSERT into order_details (order_id,productid,productname,price,itemurl,color,size,quantity) values(?,?,?,?,?,?,?,?)";
		System.out.println(query2);	
		PreparedStatement stmt2 = conn.prepareStatement(query2);
		stmt2.setInt(1, random);
		stmt2.setObject(2, pid);
		stmt2.setObject(3, pname);
		stmt2.setObject(4, ocost);
		stmt2.setObject(5, iurl);
		stmt2.setObject(6, pcolor);
		stmt2.setObject(7, psize);
		stmt2.setInt(8, 1);
		int rowcount2 = stmt2.executeUpdate();
		System.out.println(rowcount2);
		}
		
		JSONObject final_obj = new JSONObject();
		final_obj.put("orderid", random);
		
		
		String finalObj = final_obj.toString();
		System.out.println("JSON productlist"+finalObj);
		if(conn!=null)
		{
			conn.close();
		}
		return finalObj;
		
}
	
	@GET
	@Path("/fetchOrder")
	@Consumes(MediaType.APPLICATION_JSON)
	public String getOrder(@Context HttpServletRequest request,
		      @Context HttpServletResponse response)throws Exception{
		
		JSONArray oid = new JSONArray();
		JSONArray sum = new JSONArray();
		JSONArray date = new JSONArray();
		JSONArray store = new JSONArray();
		JSONArray ostat = new JSONArray();
		JSONArray pstat = new JSONArray();
		JSONArray dstat = new JSONArray();
		JSONObject final_obj = new JSONObject();
		
		Connection conn = connect();
		
		String query = "SELECT id,order_id,totalamount,placed_on,order_status,payment_status,delivery_status from orders";
		System.out.println(query);
		
		PreparedStatement stmt = conn.prepareStatement(query);
		ResultSet rs1 = stmt.executeQuery(query);
		String storename="#StoreName";
		while(rs1.next())
		{
			//oid.add(0, rs1.getInt("order_id"));
			oid.add(rs1.getInt("order_id"));
			sum.add(rs1.getInt("totalamount"));
			date.add(rs1.getString("placed_on"));
			store.add(storename);
			ostat.add(rs1.getString("order_status"));
			pstat.add(rs1.getString("payment_status"));
			dstat.add(rs1.getString("delivery_status"));
		}
		
		final_obj.put("orderid", oid);
		final_obj.put("price", sum);
		final_obj.put("date", date);
		final_obj.put("storename", store);
		final_obj.put("ostat", ostat);
		final_obj.put("pstat", pstat);
		final_obj.put("dstat", dstat);
		
		String finalObj = final_obj.toString();
		System.out.println(finalObj);
		if(conn!=null)
		{
			conn.close();
		}
		return finalObj;
	}
	
	
	
	@POST
	@Path("/fetchOrderDetails")
	@Consumes(MediaType.APPLICATION_JSON)
	public String getOrderDetails(String data,@Context HttpServletRequest request,
		      @Context HttpServletResponse response)throws Exception{
		
		JSONArray id = new JSONArray();
		JSONArray pid = new JSONArray();
		JSONArray pname = new JSONArray();
		JSONArray price = new JSONArray();
		JSONArray url = new JSONArray();
		JSONArray color = new JSONArray();
		JSONArray size = new JSONArray();
		JSONArray quan = new JSONArray();
		JSONObject final_obj = new JSONObject();
		
		Connection conn = connect();
		
		String query = "SELECT id,productid,productname,price,itemurl,color,size,quantity from order_details where order_id='"+data+"'";
		System.out.println(query);
		
		PreparedStatement stmt = conn.prepareStatement(query);
		ResultSet rs1 = stmt.executeQuery(query);
		
		while(rs1.next())
		{
			id.add(rs1.getInt(1));
			pid.add(rs1.getInt(2));
			pname.add(rs1.getString(3));
			price.add(rs1.getInt(4));
			url.add(rs1.getString(5));
			color.add(rs1.getString(6));
			size.add(rs1.getString(7));
			quan.add(rs1.getInt(8));
		}
		
		final_obj.put("id", id);
		final_obj.put("pid", pid);
		final_obj.put("pname", pname);
		final_obj.put("price", price);
		final_obj.put("url", url);
		final_obj.put("color", color);
		final_obj.put("size", size);
		final_obj.put("quan", quan);
		
		String finalObj = final_obj.toString();
		if(conn!=null)
		{
			conn.close();
		}
		return finalObj;
	}
	
	


}
