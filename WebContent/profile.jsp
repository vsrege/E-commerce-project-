<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" import="java.util.*"  session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Era81 User Profile</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  
  
</head>
<body>


<nav class="navbar navbar-default">
  <div class="container-fluid">
  <div class="row">
    <div class="col-md-2">
    <a href="product.jsp"><img id="logo" src="images/logo.png" alt="era81 logo"/></a>
      <!-- <a class="navbar-brand" href="#">Era81</a> -->
    </div>
    
    <div class="col-md-6">
      <ul class="nav navbar-nav navbar-center" id="menu">
        <li><a href="#" class="text-uppercase">crowd selection</a></li>
        <li><a href="#" class="text-uppercase">crowd pricing</a></li>
        <li class="active"><a href="#" class="text-uppercase">shop</a></li>
      </ul>
      </div>
      <div id="right">
      <!-- <div class="col-md-2"><a href="#" data-toggle="modal" data-target="#loginModal">Log in</a></div>
      <div class="col-md-2"><a href="#" data-toggle="modal" data-target="#loginModal">Sign up</a></div> -->
      <div id="username" class="col-md-2" style="vertical-align:middle;text-align:center;margin-top:25px;"><%-- <%=session.getAttribute("firstname") %> --%></div> <div class="col-md-2 dropdown" id="customerdrop">
       <button class="dropdown-toggle" data-toggle="dropdown"><img src="images/arrow.png" alt="menu dropdown"/></button>
      <ul class="dropdown-menu">
      <li><a href="#">My Account</a></li>
      <li><a href="profile.jsp">My Profile & Settings</a></li>
      <li><a href="#">My Orders</a></li>
      <li><a href="#">My Voting History</a></li>
      <li><a href="#">My Pricing History</a></li>
      <li><a href="#">My Wishlist</a></li>
      <li><a href="#" id="logout">Log out</a></li>
      </ul> 
      </div>
      </div> 
     
   </div> 
  </div>
</nav>
  
<div class="container profileback">
<div class="row">
<form id="userinfo">
    <div class="col-md-12">
    
    <ul class="nav navbar-nav" id="profilemenu">
        <li class="active"><a href="#" class="">My Profile</a></li>
       <!--  <li><a href="#" class="">Voting History</a></li>
        <li><a href="#" class="">Pricing History</a></li> -->
        <li><a href="orderhistory.html" class="">My Orders</a></li>
        <li><a href="#" class="">Wish List</a></li>
      </ul>
      
    </div>
   <!--  <div class="col-md-2">
    <img alt="profile picture" id="profilepagepic"/>images/icons/me.jpg
    <img src="images/icons/citizen.gif" alt="stamp" id="stamp"/>
    
    </div> -->
    <!-- <div class="col-md-5">
    <div class="profileinfo">
    <div>
    Vrushali Rege 
    <a href="#"><span class="glyphicon glyphicon-pencil"></span></a></div>
    <div>City <a href="#"><span class="glyphicon glyphicon-pencil"></span></a></div>
      <div>Voted for:<a href="#">10</a> ideas, <span class="selectideas"><a href="#">5</a> got selected</span></div>
    <div>Priced:<a href="#">13</a> ideas, <span class="selectideas"><a href="#">2</a> in Crowd Price range</span></div>
    </div>
    </div> -->
    <!-- <div class="col-md-5">
    <div class="profileinfo">
    <div>
    Experience points:<span class="selectideas">150 &nbsp;<a href="#">  View activities</a></span>
   </div>
    <div>Expert ranking: <span class="selectideas">Responsible Citizen </span><a href="#" class="resp" data-toggle="tooltip" data-placement="bottom" title="Responsible Citizen receives 1 out of 6 free shippings. You need 150 more experience points to become a Mayor. Learn More about Expert Ranking and perks."><span class="glyphicon glyphicon-question-sign"></span></a></div>
     
      
    </div>
    </div> --><br/><br/>
     <!-- <div class="col-md-12">
     <textarea id="bio" maxlength="150">"I love creating innovative designs from organic materials to make our world a better healthier place to live."</textarea>
     <p align="right">(150/150 characters)</p>
     </div> -->
    <!--  <div class="col-md-3 social">
     <div><img src="images/icons/fbicon.png" alt="facebook"/><input type="text" id="fb" value="http://facebook.com/123"/></div>
      <div><img src="images/icons/twittericon.png" alt="twitter"/><input type="text" id="tw" /></div>
       <div><img src="images/icons/beicon.png" alt="be"/><input type="text" id="be"/></div>
     
     </div> -->
     <!-- <div class="col-md-9 social">
      <div><img src="images/icons/youtubeicon.png" alt="youtube"/><input type="text" id="youtube"/></div>
      <div><img src="images/icons/pinicon.png" alt="pinterest"/><input type="text" id="pinterest" /></div>
       <div><img src="images/icons/webicon.png" alt="web"/><input type="text" id="web"/></div>
     
   </div> -->
   <div class="col-md-12 othership">
   <div id="shiptitle">
   <a href="#"><span id="plus" class="glyphicon glyphicon-plus-sign"></span></a>  Shipping Information
   </div>
   <div id="fillship" class="col-md-12 well">
   <div class="col-md-12">
    <a href="#"><span id="minus" class="glyphicon glyphicon-minus-sign"></span></a><span id="title">Shipping Information</span>
    </div>
    
   <div class="col-md-12">
   <input type="checkbox" id="sameaddr" name="sameaddr" value="S"/> Use shipping information as billing information
   </div>
   <div class="col-md-6 social">
   <div><label class="control-label col-sm-6" for="firstname">First name</label><input type="text" id="firstname" class="form-control"/></div>
   <div><label class="control-label col-sm-6" for="lname">Last name </label><input type="text" id="lname" class="form-control"/></div>
   <div><label class="control-label col-sm-6" for="phone">Phone</label> <input type="text" id="phone" class="form-control"/></div>
   <div><label class="control-label col-sm-6" for="emailid">Email </label><input type="text" id="emailid" class="form-control"/></div>
   </div> 
   <div class="col-md-6 social">
   <div><label class="control-label col-sm-6" for="address1">Address 1 </label><input type="text" id="address1" class="form-control"/></div>
   <div><label class="control-label col-sm-6" for="address2">Address 2 </label><input type="text" id="address2" class="form-control"/></div>
   <div><label class="control-label col-sm-6" for="city">City </label><input type="text" id="city" class="form-control"/></div>
   <div><label class="control-label col-sm-6" for="state">State </label><select id="state" class="form-control"><option value="0">Select State</option></select></div>
   <div><label class="control-label col-sm-6" for="zipcode">Zip code </label><input type="text" id="zipcode" class="form-control"/></div>
   
   </div> 
  <div class="col-md-12" align="right"><button type="button" class="btn btn-md activebtn" id="saveship">Save</button></div>
   </div> 
   
   </div>
   
   <div class="col-md-12 otherset">
   <div id="othertitle"><a href="#"><span id="plus" class="glyphicon glyphicon-plus-sign"></span></a>  Settings</div>
   <div id="fillset" class="col-md-12 well">
   <div class="col-md-12">
    <a href="#"><span id="minus" class="glyphicon glyphicon-minus-sign"></span></a><span id="title">Settings</span>
    </div>
    <div class="col-md-6 social">
   <div><label class="control-label col-sm-6" for="oldpass"><b>Old password</b></label><input type="password" id="oldpass" class="form-control"/></div>
   <div><label class="control-label col-sm-6" for="newpass">New password </label><input type="password" id="newpass" class="form-control"/></div>
   <div><label class="control-label col-sm-6" for="confirm">Confirm new password</label> <input type="password" id="confirm" class="form-control"/></div>
   <div><label class="control-label col-sm-6" for="privacy">Profile Privacy</label><select id="privacystat"></select></div>
   
   </div> 
   <div class="col-md-12"><button type="button" class="btn btn-md activebtn" id="saveset">Save</button></div>
   </div>
   </div>
   
     </form>
</div>
  </div>
</body>
<script>
$(document).ready(function() {	
	document.getElementById("username").innerHTML=sessionStorage.getItem("firstname")+" "+sessionStorage.getItem("lastname");
	var ppic = sessionStorage.getItem("picurl");
	$('#profilepagepic').attr("src",ppic);
	
	
	
	$('[data-toggle="tooltip"]').tooltip();   

	function validate(){
		
		var regex = /[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}/igm;
		if (($("#email").val() == '' || !regex.test($("#email").val())))
		{
		    alert('Please enter a valid email address.');
		    return false;
		}

		}

var from,to,subject,text;
$("#signup").click(function(){ 
	validate();
    to=$("#email").val();
    subject="Thanks for signing up with Era81";
    text="Hi User,\nWelcome to Era81.Vote for your customized product,decide its price and see it launch in your market.";
    $.get("http://localhost:3000/send",{to:to,subject:subject,text:text},function(data){
    if(data=="sent")
    {
       /* $("#message").empty().html("

Email is been sent at "+to+" . Please check inbox !

");*/
alert('Message sent');
window.location="AccountConfirm.html";
    }

});
});

 $("#shiptitle").click(function(){
	
	$("#shiptitle").hide();
	$("#fillship").show();
	
});

$("#fillship").click(function(){
	
	$("#shiptitle").show();
	$("#fillship").hide();
	
}); 
$("#othertitle").click(function(){
	
	$("#othertitle").hide();
	$("#fillset").show();
	
});
$("#fillset").click(function(){
	
	$("#othertitle").show();
	$("#fillset").hide();
	
});



});




</script>
</html>