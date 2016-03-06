<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>Product Catalog</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
 
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  
   <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
  
</head>
<body>
<script>
/*  */
// This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      // The person is not logged into Facebook, so we're not sure if
      // they are logged into this app or not.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '666897203446255',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.2' // use version 2.2
  });

  // Now that we've initialized the JavaScript SDK, we call 
  // FB.getLoginStatus().  This function gets the state of the
  // person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
      sessionStorage.setItem("firstname",response.name);
      
      
    });
    
  }

 

/*  */
/* //This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
  console.log('statusChangeCallback');
  console.log(response);
  // The response object is returned with a status field that lets the
  // app know the current login status of the person.
  // Full docs on the response object can be found in the documentation
  // for FB.getLoginStatus().
  if (response.status === 'connected') {
    // Logged into your app and Facebook.
    testAPI();
  } else if (response.status === 'not_authorized') {
    // The person is logged into Facebook, but not your app.
    document.getElementById('status').innerHTML = 'Please log ' +
      'into this app.';
  } else {
    // The person is not logged into Facebook, so we're not sure if
    // they are logged into this app or not.
    document.getElementById('status').innerHTML = 'Please log ' +
      'into Facebook.';
  }
}

// This function is called when someone finishes with the Login
// Button.  See the onlogin handler attached to it in the sample
// code below.
function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}

window.fbAsyncInit = function() {
	FB.init({
	      appId      : '666897203446255',
	      cookie     : true,  
	      xfbml      : true,
	      version    : 'v2.3'
	    });
	    
// Now that we've initialized the JavaScript SDK, we call 
// FB.getLoginStatus().  This function gets the state of the
// person visiting this page and can return one of three states to
// the callback you provide.  They can be:
//
// 1. Logged into your app ('connected')
// 2. Logged into Facebook, but not your app ('not_authorized')
// 3. Not logged into Facebook and can't tell if they are logged into
//    your app or not.
//
// These three cases are handled in the callback function.

FB.getLoginStatus(function(response) {
  statusChangeCallback(response);
});

};

// Load the SDK asynchronously
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// Here we run a very simple test of the Graph API after login is
// successful.  See statusChangeCallback() for when this call is made.
function testAPI() {
  console.log('Welcome!  Fetching your information.... ');
  FB.api('/me', function(response) {
    console.log('Successful login for: ' + response.name);
    document.getElementById('status').innerHTML =
      'Thanks for logging in, ' + response.name + '!';
  });
}
 */
  
</script>
<% 
if(session.getAttribute("firstname") == null || session.getAttribute("firstname") == "") 
{
	
	String accounttype="";
	String owneracc="owner";
	String custacc="customer";
}
else{
	
	String accounttype = session.getAttribute("accounttype").toString(); 

	String owneracc="owner";
	String custacc="customer";
}
%>
<nav class="navbar navbar-default">
  <div class="container-fluid">
  <div class="row">
    <div class="col-md-2">
    <a href="product.jsp"><h1>LOGO</h1><!-- <img id="logo" src="images/logotest.png" alt="Company Logo"/> --></a>
      <!-- <a class="navbar-brand" href="#">Era81</a> -->
    </div>
    
    <div class="col-md-6">
      <ul class="nav navbar-nav navbar-center" id="menu">
        <li><a href="#" class="text-uppercase">crowd selection</a> </li>
        <li><a href="#" class="text-uppercase">crowd pricing</a></li>
        <li class="active"><a href="#" class="text-uppercase">shop</a></li> 
      </ul>
      </div>
      <div id="right"> </div>
      <%-- <% if(session.getAttribute("firstname")==null){
    	  	String accounttype="";
    		String owneracc="owner";
    		String custacc="customer";
      
      %> --%>
     <!--  <div id="right"> 
      <div class="col-md-1"><a href="#" data-toggle="modal" data-target="#loginModal">Log in </a></div>
      <div class="col-md-1"><a href="#" data-toggle="modal" data-target="#loginModal">Sign up</a></div></div>  -->
      
      <%--  <%}else{
    	  String accounttype = session.getAttribute("accounttype").toString();
    	  
    		String owneracc="owner";
    		String custacc="customer";
    		
    		
    	  if(accounttype.equalsIgnoreCase(owneracc)){
    		  
    		 %> 
     <div class="col-md-1" style="vertical-align:middle;text-align:center;margin-top:25px;" id="username"></div><div class="col-md-2 dropdown" id="ownerdrop">
      <button class="dropdown-toggle" data-toggle="dropdown"><img src="images/arrow.png" alt="menu dropdown"/></button>
      <ul class="dropdown-menu">
      <li><a href="#">My Account</a></li>
      <li><a href="#">My Store Account</a></li>
      <li><a href="#">View My Store</a></li>
      <li><a href="#">Store Stats</a></li>
      <li><a href="ListingManager.html">Listing Manager</a></li>
      <li><a href="#">Finances</a></li>
      <li><a href="#">Store Settings</a></li>
      <li><a href="#" id="logout">Log out</a></li>
      </ul>
      <!-- <a href="#" id="checkout" data-toggle="popover" data-html="true" data-placement="bottom" data-trigger="focus" data-content=""><img src="images/icons/cart.png" alt="cart" id="cart"/></a>  -->
      </div>
     
      <% } %>
 
 		 <% 
 		// if(accounttype == custacc)
 			if(accounttype.equalsIgnoreCase(custacc)){
 		 %>
 		<div class="col-md-2" style="vertical-align:middle;text-align:center;margin-top:25px;" id="username"></div> <div class="col-md-2 dropdown" id="customerdrop">
       <button class="dropdown-toggle" data-toggle="dropdown"><img src="images/arrow.png" alt="menu dropdown"/></button>
      <ul class="dropdown-menu">
      <li><a href="#">My Account</a></li>
      <li><a href="profile.jsp">My Profile & Settings</a></li>
      <li><a href="#">My Orders</a></li>
      <!-- <li><a href="#">My Voting History</a></li>
      <li><a href="#">My Pricing History</a></li> -->
      <li><a href="#">My Wishlist</a></li>
      <li><a href="#" id="logout">Log out</a></li>
      </ul>
      <!-- <a href="#" id="checkout" data-toggle="popover" data-html="true" data-placement="bottom" data-trigger="focus" data-content=""><img src="images/icons/cart.png" alt="cart" id="cart"/></a> 
       --></div>
 		 <%} 
 		 
 		 }%>
 		   --%>
 		
     
   </div> 
 

  <!-- Modal -->
  <div class="modal fade" id="loginModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
       <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"></h4>
       </div>  
        <div class="modal-body">
       <!--  <button type="button" class="close" data-dismiss="modal">&times;</button> -->
          <div class="col-sm-12  modheader">
          <h4 class="greentexthead">Welcome to Era81!</h4><br/>
          <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">Log in with Facebook </fb:login-button>
<p>We will never post anything without your permission.</p>
<div id="status"></div>
          <h4>or</h4>
          </div>
		  <div class="row vdivide">
		    <div class="col-sm-6 text-center"><h4 class="greentext">Sign up (new user) </h4> 
		    <form id="signup" class="contact" method="post">
		    <input type="text" id="fname" placeholder="Enter first name"/>
		    <input type="email" id="email" placeholder="Enter e-mail address"/>
		    <input type="email" id="remail" placeholder="Re-enter e-mail address"/>
		    <input type="password" id="pass" placeholder="Enter password"/>
		    <input type="password" id="rpass" placeholder="Re-enter password"/>
		    <input type="submit" id="signupbtn" class="btn btn-md modalbt" value="Sign me up"/>
		    <p>By signing up, you agree to our <br/><a class="modallink">terms of use</a> and <a class="modallink">privacy policy</a></p>
		    </form>
		    </div>
		    <div class="col-sm-6 text-center"><h4 class="greentext">Log in (have an account) </h4> 
		    <form id="login" class="logcontact" method="post">
		    <input type="email" id="logemail" placeholder="Enter e-mail address"/>
		    <input type="password" id="logpass" placeholder="Enter password"/>
		    <p><a href="#">Forgot password?</a></p><br/>
		    <input type="submit" id="loginbtn" class="btn btn-md modalbt" value="Log me in"/>
		    <input type="checkbox" id="remember" class="checkbox" value="R"/><label for="remember" class="modallink">Remember me</label>
		    </form>
		    
		    </div>
		  </div>
		</div>
       
    </div>
  </div>
  </div>
  </div>
</nav>
  
<div class="container fullwidth">
<div class="row">
    <div class="col-md-2 well" style="height:625px;">
    <ul class="prodparent" id="prodparent">
    <li>
    <button type="button" class="btn btn-md  openlist">Apparels</button>
    
    <ul class="appchild" id="apparels">
    
    </ul>
    </li> 
    <li>
    <button type="button" class="btn btn-md  openlist">Accessories</button>
    <ul class="appchild" id="accessories">
   
    </ul>
    </li>
    </ul>
   <br/>
      <h5 class="text-uppercase"><span class="range">Price Range</span></h5>
      
      
 
<p>
  <input type="text" id="rleft" readonly>
  <input type="text" id="rright" readonly>
</p>
      <div id="slider-range"></div>
      
      <br/><br/>
      <h5 class="text-uppercase"><span id="prodcolor">color</span></h5>
      <ul class="palette">
      <li>
      <button type="button" class="btn btn-sm colorbtn" id="red"></button>
      <button type="button" class="btn btn-sm colorbtn" id="darkgray"></button>
      <button type="button" class="btn btn-sm colorbtn" id="yellow"></button>
      <button type="button" class="btn btn-sm colorbtn" id="parrotgreen"></button>
      <button type="button" class="btn btn-sm colorbtn" id="green"></button>
      <button type="button" class="btn btn-sm colorbtn" id="blue"></button> 
      </li>
      <li>
      <button type="button" class="btn btn-sm colorbtn" id="purple"></button>
      <button type="button" class="btn btn-sm colorbtn" id="pink"></button>
      <button type="button" class="btn btn-sm colorbtn" id="white"></button>
      <button type="button" class="btn btn-sm colorbtn" id="lightgray"></button>
      <button type="button" class="btn btn-sm colorbtn" id="black"></button>
      <button type="button" class="btn btn-sm colorbtn" id="brown"></button> 
      </li>
      </ul>
      
    </div>
   
    <form id="choice" class="choice">
    <div class="col-md-2"> 
    <input type="checkbox" id="female"  value="F" class="checkbox" name="gender"/><label for="female">&nbsp;Female</label>
    <input type="checkbox" id="male" value="M" class="checkbox" name="gender"/><label for="male">&nbsp;Male</label>
    </div>
    <div class="col-md-3">
    <label id="lb">Sort By:</label>
    <span class="customselect">
    <select id="sortlist">
    <option value="0">--Select--</option>
    <option value="BA">Brand(A to Z)</option>
    <option value="BD">Brand(Z to A)</option>
    <option value="RA">Rating(High to low)</option>
    <option value="RD">Rating(Low to high)</option>
    <option value="PA">Price(low to high)</option>
    <option value="PD">Price(high to low)</option>
    <option value="SA">Sales(High to low)</option>
    <option value="SD">Sales(Low to high)</option>
    </select>
    </span> 
    </div>
    <!-- <div class="col-md-3"> -->
    <span class="search col-md-2">
     <input type="text"  placeholder="Search product..." class="searchinput"/>
      <a href="#">
          <span class="glyphicon glyphicon-search"></span>
       </a>
     </span>
        <!-- </div> -->
        <div class="col-md-3">
       
        <span class="grids">
         <label id="lb">Display</label>
        <a href="#"><img src="images/grid3.png" alt="grid1" id="grid1" class="grid"/></a><!--class="gridactive"  -->
        <a href="#"><img src="images/grid1.png" alt="grid2" id="grid2" class="grid"/></a>
        <a href="#"><img src="images/grid2.png" alt="grid3" id="grid3" class="grid"/></a>
        </span>
        </div>
    <div class="col-md-10" id="productdisplayblock"> 
   
     </div>
      </form>
    </div>
  </div>

</body>
<script>
//var $ = jQuery.noConflict();
//setting session storage for user

function setSession(){
	//alert("Set session is called");
	var fname="";
	var lname="";
	var email="";
	var pic="";
	
	<%if(session.getAttribute("firstname")!=null){%>
	fname = "<%=session.getAttribute("firstname") %>";
	lname = "<%=session.getAttribute("lastname") %>";
	email = "<%=session.getAttribute("email") %>";
	pic = "<%=session.getAttribute("picurl") %>";
	
	sessionStorage.setItem("firstname", fname);
	sessionStorage.setItem("lastname", lname);
	sessionStorage.setItem("email", email);
	sessionStorage.setItem("picurl", pic);
	document.getElementById("username").innerHTML=sessionStorage.getItem("firstname")+" "+sessionStorage.getItem("lastname");
	
	<%}%> 


	
var menu="";
var menuHere="";
var logtext="";

menuHere = document.getElementById("right");
if(sessionStorage.getItem("firstname")){
	//alert("hello");
	var logtext="";
	logtext+='<div class=\"col-md-2\" style=\"vertical-align:middle;text-align:right;margin-top:25px;\" id=\"username\">'+sessionStorage.getItem("firstname")+'</div> <div class=\"col-md-2 dropdown\" id=\"customerdrop\">'+
		'<button class=\"dropdown-toggle\" data-toggle=\"dropdown\"><img src=\"images/arrow.png\" alt=\"menu dropdown\"/></button><ul class=\"dropdown-menu\">'+
		'<li><a href=\"#\">My Account</a></li><li><a href=\"profile.jsp\">My Profile & Settings</a></li><li><a href=\"#\">My Orders</a></li>'+
		'<li><a href=\"#\">My Wishlist</a></li><li><a href=\"#\" id=\"logout\">Log out</a></li></ul>'+
		'<a href=\"#\" id=\"checkout\" data-toggle=\"popover\" data-html=\"true\" data-placement=\"bottom\" data-trigger=\"focus\" data-content=\"\"><img src=\"images/icons/cart.png\" alt=\"cart\" id=\"cart\"/></a>'+
		'</div>';
	
}
else{
	
	var logtext="";
	logtext+='<div class=\"col-md-1\"><a href=\"#\" data-toggle=\"modal\" data-target=\"#loginModal\">Log in </a></div>'+
		'<div class=\"col-md-1\"><a href=\"#\" data-toggle=\"modal\" data-target=\"#loginModal\">Sign up</a></div>';
}

menuHere.innerHTML=logtext;
//location.reload();
}

setSession();

var reqObject = {};
$(document).ready(function() {
	
	
	
	$.ajax({
        url: "",
        context: document.body,
        success: function(s,x){

            $('html[manifest=saveappoffline.appcache]').attr('content', '');
                $(this).html(s);
        }
    }); 
	
	
	
	//genderwise product classification
	$('.checkbox').change(function() {
		
	var checkedValues = $('.checkbox:checked').map(function() {
    return this.value;
}).get().join();
	
	//alert(checkedValues);
$.ajax({
		
 	    url : 'rest/getProduct/getProductByGender',
 	    type: 'POST',
 	    data : checkedValues,
 	    contentType: 'application/json; charset=utf-8',
 	    dataType : 'json',
 	    processData: true,
 	    success: function(a,data)
 	    {
 	     
 	      var menu,productlist,menuHere,prodlist='',i;
 	      menu = eval('(' + JSON.stringify(a) + ')'); 
 	      productlist = menu.productid.length;
 	     
 	      menuHere = document.getElementById("productdisplayblock");
 	   	  
 	   	if(productlist==0 || productlist==null)
 	   		{
 	   //	prodlist+='<h4 align=\"center\" style=\"margin-top:50px;color:'+color+';\">Products currently unavailable</h4>';
 	   	prodlist+='<div class=\"well col-md-12\" style=\"height:100%\">Products currently unavailable</div>';
 	   		}
 	   	else{
 	       for(i=0;i<productlist;i++)
 	    	   {
 	    	  prodlist+=
 	    	 '<div class=\"products col-md-6\" id=\"gridblock\">'+
 	    	 '<img class=\"img-responsive\" alt=\"'+menu.productnames[i]+'\" src=\"'+menu.imageurl[i]+'" class=\"gridproduct\"/><div align=\"center\"><br/>'+'<br/>$'+menu.price[i]+'</div>'+
 	 	     '<div class=\"aroleft\"><img src=\"images/icons/leftarrow.png\" alt=\"leftarrow\"/></div>'+
 	 	     '<div class=\"aroright\"><img src=\"images/icons/rightarrow.png\" alt=\"rightarrow\"/></div></div>';
 	    	  
 	    	   };
 	    	   
 	   		}
 	   	
 	       
 	      menuHere.innerHTML=prodlist;
 	      
 	    	
 	    },
 	    error: function()
 	    {
 	    	alert("Product for this gender unavailable at the moment");
 	    }
 	}); 
	
	
	
	
	
	
	});
	
	
	
	//fetching categories data
	$.ajax({
 	    url : 'rest/getProduct/getMenu',
 	    type: 'GET',
 	    //data : reqjson,
 	    contentType: 'application/json; charset=utf-8',
 	    dataType : 'json',
 	    processData: true,
 	    success: function(a,data)
 	    {
 	        
 	       var menu,apparels,menuHere,appmenu='',accessories,menu2Here,accmenu='',i,j;
 	       menu = eval('(' + JSON.stringify(a) + ')'); 
 	       apparels = menu.apparelids.length;
 	       menuHere = document.getElementById("apparels");
 	   	  
 	   	
 	       for(i=0;i<apparels;i++)
 	    	   {
 	    	   appmenu+=
 	    	  '<li><a href=\"\" id=\"'+menu.apparelids[i]+'">'+menu.apparelnames[i]+'</a></li>';
 	    	   
 	    	   };
 	       
 	      menuHere.innerHTML=appmenu;
 	      
 	      
 	      
 	     accessories = menu.accessoryids.length;
 	     menu2Here = document.getElementById("accessories");
 	   	
 	   	
 	       for(j=0;j<accessories;j++)
 	    	   {
 	    	   accmenu+=
 	    	  '<li><a href=\"\" id=\"'+menu.accessoryids[j]+'">'+menu.accessorynames[j]+'</a></li>';
 	    	   
 	    	   };
 	       
 	      menu2Here.innerHTML=accmenu;
 	      
 	      
 	    	
 	    },
 	    error: function()
 	    {
 	    	alert("Product categories not available");
 	    }
 	});
	
	
	//fetching product data
	
	$.ajax({
 	    url : 'rest/getProduct/showProducts',
 	    type: 'GET',
 	    //data : reqjson,
 	    contentType: 'application/json; charset=utf-8',
 	    dataType : 'json',
 	    processData: true,
 	    success: function(a,data)
 	    {
 	     
 	      var menu,productlist,menuHere,prodlist='',i;
 	      menu = eval('(' + JSON.stringify(a) + ')'); 
 	      productlist = menu.productid.length;
 	      menuHere = document.getElementById("productdisplayblock");
 	   	  
 	   	
 	       for(i=0;i<productlist;i++)
 	    	   {
 	    	  prodlist+=
 	    	 '<div class=\"products col-md-6\" id=\"gridblock\">'+
 	    	'<a href=\"ProductPage.jsp?id='+menu.productid[i]+'\">'+
 	    	 //'<img class=\"img-responsive\" alt=\"'+menu.productnames[i]+'\" src=\"'+menu.imageurl[i]+'" class=\"gridproduct\"/></a><div align=\"center\"><br/>'+menu.productnames[i]+" by "+menu.designernames[i]+'<br/>$'+menu.price[i]+'</div>'+
 	 	     '<img class=\"img-responsive\" alt=\"'+menu.productnames[i]+'\" src=\"'+menu.imageurl[i]+'" class=\"gridproduct\"/></a><div align=\"center\"><br/>'+menu.productnames[i]+'<br/>$'+menu.price[i]+'</div>'+ 
 	    	 '<div class=\"aroleft\"><img src=\"images/icons/leftarrow.png\" alt=\"leftarrow\"/></div>'+
 	 	      '<div class=\"aroright\"><img src=\"images/icons/rightarrow.png\" alt=\"rightarrow\"/></div></div>';
 	    	  
 	    	   };
 	       
 	      menuHere.innerHTML=prodlist;
 	      
 	        
 	       
 	        
 	    	
 	    },
 	    error: function()
 	    {
 	    	alert("Products not available");
 	    }
 	});
	
	
	
//fetching color id data
	$(".colorbtn").click(function(){
		
		var color=$(this).attr("id");
		
	$.ajax({
		
 	    url : 'rest/getProduct/getProductByChoice',
 	    type: 'POST',
 	    data : color,
 	    contentType: 'application/json; charset=utf-8',
 	    dataType : 'json',
 	    processData: true,
 	    success: function(a,data)
 	    {
 	     
 	      var menu,productlist,menuHere,prodlist='',i;
 	      menu = eval('(' + JSON.stringify(a) + ')'); 
 	      productlist = menu.productid.length;
 	     
 	      menuHere = document.getElementById("productdisplayblock");
 	   	  
 	   	if(productlist==0 || productlist==null)
 	   		{
 	   	prodlist+='<div class=\"well col-md-12\" style=\"height:590px;\">'+
 	   	'<div class=\"col-md-12\" align=\"center\"><img src=\"images/icons/sad.png\" style=\"height:80px;width:85px;margin-top:20px;margin-bottom:20px\"/></div>'+
 	   	'<div class=\"col-md-12\" align=\"center\" style=\"font-size:18px;\">Sorry, we could not find any results for<br/>color '+color+'</div>'+
 	   	'<div class=\"col-md-12\" align=\"center\" style=\"font-size:18px;\"><br/><br/>Try other search words<br/><br/>'+
 	   '<span class=\"search col-md-4\" style=\"margin-left:35%\"><input type=\"text\"  placeholder=\"\" class=\"searchinput\"/><a href=\"#\"><span class=\"glyphicon glyphicon-search\"></span></a></span></div>'+
 	   	'</div>';
 	   
 	   		}
 	   	else{
 	       for(i=0;i<productlist;i++)
 	    	   {
 	    	  prodlist+=
 	    	 '<div class=\"products col-md-6\" id=\"gridblock\">'+
 	    	'<a href=\"ProductPage.jsp?id='+menu.productid[i]+'\">'+
 	    	 '<img class=\"img-responsive\" alt=\"'+menu.productnames[i]+'\" src=\"'+menu.imageurl[i]+'" class=\"gridproduct\"/></a><div align=\"center\"><br/>'+menu.productnames[i]+" by "+menu.designernames[i]+'<br/>$'+menu.price[i]+'</div>'+
 	 	      '<div class=\"aroleft\"><img src=\"images/icons/leftarrow.png\" alt=\"leftarrow\"/></div>'+
 	 	      '<div class=\"aroright\"><img src=\"images/icons/rightarrow.png\" alt=\"rightarrow\"/></div></div>';
 	    	  
 	    	   };
 	    	   
 	   		}
 	   	
 	       
 	      menuHere.innerHTML=prodlist;
 	      
 	    	
 	    },
 	    error: function()
 	    {
 	    	alert("Product of this color not available at the moment");
 	    }
 	}); 
	});
	
	
	
	
	
	
	 $('#grid1').click(function(){
		
		$("#gridblock").removeClass("col-md-4 col-md-3");
		
		$('#productdisplayblock').children('#gridblock').toggleClass('products col-md-6');//= "products col-md-6";
			});
			
			$('#grid2').click(function(){
				
				$("#gridblock").removeClass("col-md-6 col-md-3");
				
				$('#productdisplayblock').children('#gridblock').toggleClass('products col-md-4');//.className = "products col-md-4";
					});
			$('#grid3').click(function(){
				
				$("#gridblock").removeClass("col-md-6 col-md-4");
				//document.getElementById('gridblock').className = '';
				$('#productdisplayblock').children('#gridblock').toggleClass('products col-md-3');//.className = "products col-md-1";
					});
	
	
	

	$('ul.appchild li').click(function() {
		
        $(this).css("list-style-image"," url(images/icons/bullet.png)");
       
    });
	

	$("ul ul").css("display", "none");

	$(".openlist").click(function(e) {
	    e.preventDefault();
	    $(this).toggleClass('activebtn');
	   $(this).next("ul").toggle(); 
	});

	
	
	

	function validate(){
		
		var regex = /[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}/igm;
		if (($("#email").val() == '' || !regex.test($("#email").val())))
		{
		    alert('Please enter a valid email address.');
		    return false;
		}

		}







});


$(function() {
     $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 1500,
      values: [ 0, 1500],
      slide: function( event, ui ) {
        $( "#rleft" ).val( "$" + ui.values[ 0 ]);
        $( "#rright" ).val( "$" + ui.values[ 1 ]);
        var range = ui.values[ 0 ]+','+ui.values[ 1 ];
        
        $.ajax({
    		
     	    url : 'rest/getProduct/getProductByCost',
     	    type: 'POST',
     	    data : range,
     	    contentType: 'application/json; charset=utf-8',
     	    dataType : 'json',
     	    processData: true,
     	    success: function(a,data)
     	    {
     	     
     	      var menu,productlist,menuHere,prodlist='',i;
     	      menu = eval('(' + JSON.stringify(a) + ')'); 
     	      productlist = menu.productid.length;
     	     
     	      menuHere = document.getElementById("productdisplayblock");
     	   	  
     	   	if(productlist==0 || productlist==null)
     	   		{
     	   	prodlist+='<div class=\"well col-md-12\" style=\"height:100%\">Products currently unavailable</div>';
     	   	
     	   		}
     	   	else{
     	       for(i=0;i<productlist;i++)
     	    	   {
     	    	  prodlist+=
     	    	 '<div class=\"products col-md-6\" id=\"gridblock\">'+
     	    	'<a href=\"ProductPage.jsp?id='+menu.productid[i]+'\">'+
     	    	 '<img class=\"img-responsive\" alt=\"'+menu.productnames[i]+'\" src=\"'+menu.imageurl[i]+'" class=\"gridproduct\"/></a><div align=\"center\"><br/>'+menu.productnames[i]+" by "+menu.designernames[i]+'<br/>$'+menu.price[i]+'</div>'+
     	 	      '<div class=\"aroleft\"><img src=\"images/icons/leftarrow.png\" alt=\"leftarrow\"/></div>'+
     	 	      '<div class=\"aroright\"><img src=\"images/icons/rightarrow.png\" alt=\"rightarrow\"/></div></div>';
     	    	  
     	    	   };
     	    	   
     	   		}
     	   	
     	       
     	      menuHere.innerHTML=prodlist;
     	      
     	    	
     	    },
     	    error: function()
     	    {
     	    	alert("Product for this gender unavailable at the moment");
     	    }
     	}); 
        
        
      }
    }); 
    
    
   $( "#rleft" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) );
   $( "#rright" ).val( "$" + $( "#slider-range" ).slider( "values", 1 ) );
  
   
  });


 
 
$("#signupbtn").click(function(){ 
	
	var from,to,subject,text;
	to=$("#email").val();
	
    subject="Thanks for signing up with Era81";
    
    text="Hi User,\nWelcome to Era81.Vote for your customized product,decide its price and see it launch in your market.";
    $.get("http://localhost:3000/send",{to:to,subject:subject,text:text},function(data){
    	
   
			alert('Message sent');
			
    });

	var first = $('#fname').val();
	
	reqObject["firstname"] = first;
	var email = $('#email').val();
	
	reqObject["email"] = email;
	var pass = $('#pass').val();
	
	reqObject["pass"] = pass;
	
	
	var reqjson = JSON.stringify(reqObject);
	
	$.ajax({
	    url : 'rest/insertUser/insertReg',
	    type: 'POST',
	    data : reqjson,
	    contentType: 'application/json; charset=utf-8',
	    dataType : 'json',
	    processData: true,
	    success: function(a,data)
	    {
	    	var menu;
	 	    menu = eval('(' + JSON.stringify(a) + ')');
	    	setSession();
	    	/* if(sessionStorage.length>0)
	    		{ */
	 	   location.href="AccountConfirm.jsp"; 
	    		/* } */
	        /* var fname="";
	    	var lname="";
	    	var email="";
	    	var pic=""; */
	    	<%-- <%if(session.getAttribute("firstname")!=null){%>
	    	fname = "<%=session.getAttribute("firstname") %>";
	    	lname = "<%=session.getAttribute("lastname") %>";
	    	email = "<%=session.getAttribute("email") %>";
	    	pic = "<%=session.getAttribute("picurl") %>";
	    	//alert(lname);
	    	sessionStorage.setItem("firstname", fname);
	    	sessionStorage.setItem("lastname", lname);
	    	sessionStorage.setItem("email", email);
	    	sessionStorage.setItem("picurl", pic);
	    	document.getElementById("username").innerHTML=sessionStorage.getItem("firstname")+" "+sessionStorage.getItem("lastname");
	    	<%}%> --%>
	    	
	    	
	      return false;
	        
	    },
	    error: function(jqXHR, textStatus, errorThrown)
	    {
	    	
	    	//alert("Registration unsuccessful");
	    	location.href="AccountConfirm.jsp";
	    	
	    }
	    //return false;
	});
	
	//location.href="AccountConfirm.jsp";
    
	return false;
	
	
});
 
$("#logout").click(function(){ 
	
	sessionStorage.clear();
	location.reload();
	<% session.invalidate(); %>
});
 
 
 
 $("#loginbtn").click(function(e){ 
 	
 	e.preventDefault();
 	
 	var email = $('#logemail').val();
 	
 	reqObject["email"] = email;
 	var pass = $('#logpass').val();
 	
 	reqObject["pass"] = pass;
 	
 	
 	var reqjson = JSON.stringify(reqObject);
 	
 	
 	$.ajax({
 	    url : 'rest/insertUser/chkReg',
 	    type: 'POST',
 	    data : reqjson,
 	    contentType: 'application/json; charset=utf-8',
 	    dataType : 'json',
 	    processData: true,
 	    success: function(data)
 	    {
 	        
 	        alert("User is registered.");
 	        //location.href="product.jsp";
 	        
 	        setSession();
 	       
 	        window.location.reload();
   		
 	    	
 	    },
 	    error: function()
 	    {
 	    	alert("This user does not exist");
 	    }
 	});
 	
 }); 

 function gotochkout(){
		
	 
	 	var chkcart=sessionStorage.getItem("cart");
		
		
		 $.ajax({
	 	    url : 'rest/placeOrder/insertOrder',
	 	    type: 'POST',
	 	    data : chkcart,
	 	    contentType: 'application/json; charset=utf-8',
	 	    dataType : 'json',
	 	    processData: true,
	 	    success: function(a,data)
	 	    {
	 	     
	 	      var menu;
	 	      menu = eval('(' + JSON.stringify(a) + ')');
	 	      sessionStorage.setItem("orderid",menu.orderid);
	 	     location.href="payment.html"; 
	 	      //sessionStorage.removeItem("cart");
	 	      //location.href="aftercheckout.html";   
	 	    	
	 	    },
	 	    error: function()
	 	    {
	 	    	alert("Products not available");
	 	    }
	 	}); 
		
		
	}
 
 

 function addtocart(){
 						
 						
 						if(sessionStorage.getItem("cart"))
 							{
 								
 								var shopcart=JSON.parse(sessionStorage.getItem("cart"));
 								
 								var price = sessionStorage.getItem("price");
 								shopcart.prodid.push(sessionStorage.getItem("prodid"));
 								shopcart.price.push(sessionStorage.getItem("price"));
 								shopcart.size.push(sessionStorage.getItem("size"));
 								shopcart.color.push(sessionStorage.getItem("prodcolor"));
 								shopcart.prodname.push(sessionStorage.getItem("prodname"));
 								shopcart.itempicurl.push(sessionStorage.getItem("itempicurl"));
 								
 						
 							}
 						else{
 							
 							var shopcart={prodid:[],price:[],size:[],color:[],prodname:[],itempicurl:[],user:[],email:[],subtotal:[]};
 							var price = sessionStorage.getItem("price");
 					
 							shopcart.prodid.push(sessionStorage.getItem("prodid"));
 							shopcart.price.push(sessionStorage.getItem("price"));
 							shopcart.size.push(sessionStorage.getItem("size"));
 							shopcart.color.push(sessionStorage.getItem("prodcolor"));
 							shopcart.prodname.push(sessionStorage.getItem("prodname"));
 							shopcart.itempicurl.push(sessionStorage.getItem("itempicurl"));
 							shopcart.user.push(sessionStorage.getItem("firstname")+" "+sessionStorage.getItem("lastname"));
 							shopcart.email.push(sessionStorage.getItem("email"));
 							
 						}
 						
 						sessionStorage.setItem("cart",JSON.stringify(shopcart));
 						location.href="product.jsp";
 				}
 
 
 if(sessionStorage.getItem("cart")===null)
	{
	var data='<div class=\"col-md-12\">Cart is Empty</div>';
	
	}
else{
	
var shopcart=JSON.parse(sessionStorage.getItem("cart"));



var price=0;
var data='<div class=\"col-md-12\">';
	for(var i=0;i<shopcart.prodid.length;i++)
		{
		data+='<div class=\"col-md-2\"><img src=\"'+shopcart.itempicurl[i]+'\" alt=\"itempic\"/></div><div class=\"col-md-8\">'+shopcart.prodname[i]+'</div><div class=\"col-md-2\">$'+shopcart.price[i]+'</div></div><br/><br/>';
     price+=parseInt(shopcart.price[i],10);
     
		}
	shopcart.subtotal=""+price+"";
	
	var updatedcart=JSON.stringify(shopcart);
	sessionStorage.setItem("cart",updatedcart);
	
		

data+='</div><div class=\"col-md-12\"><hr id=\"dottedgreen\"/><div class=\"col-md-10\"><b>Order subtotal</b></div><div id=\"subtotal\" class=\"col-md-2\">$'+price+'</div></div>'+
'<div align=\"right\"><input type=\"submit\" class=\"btn btn-md activebtn\" id=\"chkoutbtn\" onclick=\"gotochkout()\" value=\"Check out\"/></div>';

}
 $('[data-toggle="popover"]').popover(); 
 
 $('[data-toggle=popover]').on('shown.bs.popover', function () {
 	  
 	})
 	
 	
 	$('#checkout').attr('data-content',data);
</script>
</html>