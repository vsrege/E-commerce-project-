<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,intial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/era81.css"> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<!-- <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" /> -->
<title>Era81</title>
</head>
<body>
<script>
/*  */
//This is called with the results from from FB.getLoginStatus().
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



</script>

<nav class="navbar navbar-default">
 <!--  <div class="container-fluid"> -->
  <div class="row">
    <div class="col-md-2">
    <a href="product.jsp"><img id="logo" src="images/logo.png" alt="era81 logo"/></a>
     
    </div>
    
    <div class="col-md-6">
      <ul class="nav navbar-nav navbar-center" id="menu">
        <li><!-- <a href="#" class="text-uppercase">crowd selection</a> --></li>
        <li><!-- <a href="#" class="text-uppercase">crowd pricing</a> --></li>
        <li class="active"><a href="product.jsp" class="text-uppercase">shop</a></li>
      </ul>
      </div>
      <div id="right">
      <div class="col-md-2" id="username"></div>
      <div class="col-md-2"><a href="#" data-toggle="modal" data-target="#loginModal">Login</a></div>
      </div> 
     
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

 </nav> 
  <!-- </div> -->

<div id="back" class="row class="img-responsive"">

<div id="formcontainer">
<div id="heading">
 <h1 class="text-uppercase">thank you!</h1>
<h3>Your Era81 account has been created.</h3>
<h3>We've sent you a confirmation email, please follow the</h3>
<h3>link in the email to activate your account.</h3>
<br/>
<h3>We wish you a great time on Era81!</h3>

<button type="button" class="btn btn-md accbtn"><a href="product.jsp">Explore Products</a></button><button type="button" class="btn btn-md accbtn"><a href="product.jsp"></a>Manage Account</a></button>
 

</div>



</div>

</div>





		

<!-- </div> -->
</body>
</html>

<script>





var slideShow=document.getElementById("back");
document.getElementById("back").style.backgroundImage="url('images/slides/lion.jpg')";





function validate(){
	
var regex = /[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}/igm;
if (($("#email2").val() == '' || !regex.test($("#email2").val())))
{
    alert('Please enter a valid email address.');
    return false;
}

}




$(document).ready(function() {	


	var fname="";
	var lname="";
	var email="";
	var pic="";
	<%if(session.getAttribute("firstname")!=null){%>
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
	<%}%>





});

$("#loginbtn").click(function(e){ 
 	
 	e.preventDefault();
 	
 	var email = $('#logemail').val();
 	
 	reqObject["email"] = email;
 	var pass = $('#logpass').val();
 	
 	reqObject["pass"] = pass;
 	
 	
 	var reqjson = JSON.stringify(reqObject);
 	//alert(reqjson);
 	
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
 	        location.reload();
 	        
 	        
 	    	
 	    },
 	    error: function()
 	    {
 	    	alert("This user does not exist");
 	    }
 	});
 	
 }); 

    

</script>