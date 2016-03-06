<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,intial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="css/era81.css"> 
<link rel="stylesheet" href="css/style.css">


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
<title>Era81</title>
</head>
<style>
/* .popover.bottom .arrow {
	right:5%;
} */
</style>
<body>


<nav class="navbar navbar-default">

  <div class="row">
    <div class="col-md-2">
    <a href="product.jsp"><h1>LOGO</h1><!-- <img id="logo" src="images/logotest.png" alt="era81 logo"/> --></a>
     
    </div>
    
    <div class="col-md-6">
      <ul class="nav navbar-nav navbar-center" id="menu">
        <li><!-- <a href="#" class="text-uppercase">crowd selection</a> --></li>
        <li><!-- <a href="#" class="text-uppercase">crowd pricing</a> --></li>
        <li class="active"><a href="product.jsp" class="text-uppercase">shop</a></li>
      </ul>
      </div>
      
     
      <div id="right"> 
      <div class="col-md-1"><a href="#" data-toggle="modal" data-target="#loginModal">Log in</a></div>
      <div class="col-md-1"><a href="#" data-toggle="modal" data-target="#loginModal">Sign up</a></div></div> 
      
      
 		<div class="col-md-2" style="vertical-align:middle;text-align:center;margin-top:25px;display:none;" id="username"></div> 
 		<div class="col-md-2 dropdown" style="display:none;" id="customerdrop">
       	<button class="dropdown-toggle" data-toggle="dropdown"><img src="images/arrow.png" alt="menu dropdown"/></button>
	      <ul class="dropdown-menu">
	      <li><a href="#">My Account</a></li>
	      <li><a href="profile.jsp">My Profile & Settings</a></li>
	      <li><a href="#">My Orders</a></li>
	      <li><a href="#">My Wishlist</a></li>
	      <li><a href="#" id="logout" onclick="logout()">Log out</a></li>
	      </ul> 
	      
	      
	      <a href="#" id="checkout" data-toggle="popover" data-html="true" data-placement="bottom" data-trigger="focus" data-content=""><img src="images/icons/cart.png" alt="cart" id="cart"/></a>
      	</div>
 		
 		
 		
     
   </div> 
 

 </nav> 
<div class="container-fluid">

<div class="row">
<div class="col-md-12">
<h1 id="productname" class="text-uppercase"><!-- REVERSIBLE BACKPACK --></h1>
<p id="darkgrayfont"><!-- Some stuff about the design and the product.Some stuff about the design and the product.Some stuff about the design and the product.Some stuff about the design and the product.Some stuff about the design and the product.Some stuff about the design and the product.Some stuff about the design and the product. --></p>
</div>
</div>
<div>
<div id="prodback" class="row" style="background:no-repeat center;">

<div class="content">
<div class="col-md-2">
<ul class="nobullets" id="nobullets">
<!-- <li><a class="thumbnail" href="#" class="active"><img src="images/products/prod1.png" alt="Image1" class="img-responsive"/></a></li>
<li><a class="thumbnail" href="#"><img src="images/products/prod2.png" alt="Image2" class="img-responsive"/></a></li>
<li><a class="thumbnail" href="#"><img src="images/products/prod1.png" alt="Image3" class="img-responsive"/></a></li> -->
</ul>
</div>
<div class="col-md-9"></div>
<div class="col-md-1">
<div id="arrowright">
<a href="#" ><img src="images/icons/rightarrow.png" alt="rightarrow" id="arr"/></a>
</div>
</div>
</div>
</div>

</div>
<!-- <div class="col-md-12"> -->

<div class="proddetailsbtn" align="center">
<button type="button" class="btn btn-md plainbtn" id="details">Details</button>
<button type="button" class="btn btn-md plainbtn" id="review">Reviews</button>
<button type="button" class="btn btn-md plainbtn" id="styling">Styling</button>
</div>
<!-- </div> -->
<br/>
<div class="details" style="display:none;">
<div class="well row">
<div class="col-md-8">
<p id="description">
<!-- Some stuff about the design and the product.Some stuff about the design and the product.Some stuff about the design and the product.Some stuff about the design and the product.Some stuff about the design and the product.Some stuff about the design and the product.Some stuff about the design and the product.Some stuff about the design and the product.
 --></p>
<div class="col-md-2"><a class="thumbnail"><img id="profilepic" alt="profile pic"/> <!--  src="images/icons/me.jpg"--></a></div>
<div class="col-md-6">
By <a href="#" class="eralinks" id="designer"><!-- Vrushali Rege --></a><br/>
<a href="#" class="eralinks" id="numprod">2</a> products created<br/>
San Francisco, USA
</div>
<div class="col-md-8">
<p>"I believe in creating innovative designs from organic materials"</p></div>
</div>

<div class="col-md-4">

<ul class="palette">
<div id="apperelsize">
<li>Select size:<hr></li>
<li>



<button type="button" class="btn btn-sm sizebtn eragreen" id="small" value="S">S</button>
<button type="button" class="btn btn-sm sizebtn eragreen" id="medium" value="M">M</button>
<button type="button" class="btn btn-sm sizebtn eragreen" id="large" value="L">L</button>
<button type="button" class="btn btn-sm sizebtn eragreen" id="xlarge" value="XL">XL</button>
</li>
</div>
<li>Select color:<hr></li>
<li>
<button type="button" class="btn btn-sm prodcolorbtn" id="black"></button>
<button type="button" class="btn btn-sm prodcolorbtn" id="navy"></button>
<button type="button" class="btn btn-sm prodcolorbtn" id="orange"></button>
</li>
<li>
<button type="button" class="btn btn-md activebtn" id="pricebtn" onclick="addtocart()"><!-- $230 / ADD --></button>
</li>
</ul>
</div>
</div>
</div>

<div class="reviews" style="display:none;">
<div class="well row">
<div class="col-md-12">
<p align="center">Overall satisfaction <img src="images/icons/lol.png" alt="smiley1"/><span><a href="#" data-toggle="tooltip" data-placement="bottom" title="Recommend Score is computed by summing positive recommends and subtracting negative ones. The higher the Recommend Score the better the product is.">Recommended</a>:89%</span></p>
</div>
<div class="col-md-12">
<div class="col-md-1"><img src="images/icons/lol.png" alt="smiley1"/></div>
<div class="col-md-11"><a class="modallink" href="">Eloise</a><span>#date</span><br/>
Fabulous quality and excellent as always.
</div>

</div>
<div class="col-md-12"><div align="center"><button type="button" class="btn btn-md showmore">SHOW MORE</button></div></div>
</div>

</div>
<div class="styling">
<div class="row">
<div class="col-md-12">
<p align="center">
The #product will look amazing with:
</p>
</div>
</div>
</div>


</div>

<br/>
<!-- Recommendations -->
<div class="row">
<div class="col-md-12">
<p align="center" style="display:none;">You might like these products</p>
<div class="cover-container">
<div class="cover-item"><p><img src="images/products/prod1.png" alt="prod1"/><p>#ProductName<br/>$200</p></div>
<div class="cover-item"><p><img src="images/products/prod2.png" alt="prod2"/><p>#ProductName<br/>$200</p></div>
<div class="cover-item"><p><img src="images/products/prod1.png" alt="prod1"/><p>#ProductName<br/>$200</p></div>
</div>
</div>
</div>



</body>
<script>




$("#arr").click(function(){
	var img= new Array();
	var imgarr =sessionStorage.getItem("picurls");
	img =imgarr.split(',');
	
	var src = $("#prodback").css('background-image');
	src = src.replace('url(','').replace(')','');
  
	for(i=0;i<img.length;i++){
		
		if(src.indexOf(img[i])>-1){
		i++;
			
		}
		else{
			document.getElementById("prodback").style.backgroundImage="url("+img[i]+")";
			
		}
		
	}
	
	
});


//logout current user 
function logout(){
	

	sessionStorage.clear();
	window.location.href="product.jsp";	
}

$('.sizebtn').click(function(){
	var id =this.id;
	//alert(id);
	var arr=['#small','#medium','#large','#xlarge'];
	 for(var i=0;i<arr.length;i++)
	{
		$(arr[i]).removeClass('eragreenactive');
		$(arr[i]).addClass('eragreen');
		
	}
	 
	$('#'+id).addClass('eragreenactive');
	
	
});


if(sessionStorage.getItem("firstname")){
	$('#right').hide();
	$('#username').show();
	$('#customerdrop').show();
document.getElementById("username").innerHTML=sessionStorage.getItem("firstname")+" "+sessionStorage.getItem("lastname");
}
//var slideShow=document.getElementById("back");





function validate(){
	
var regex = /[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}/igm;
if (($("#email2").val() == '' || !regex.test($("#email2").val())))
{
    alert('Please enter a valid email address.');
    return false;
}

}





$(document).ready(function() {
	
	
	if(sessionStorage.getItem("cart")===null)
		{
		var data='<div class=\"col-md-12\">Cart is Empty</div>';
		
		}
	else{
	var shopcart=JSON.parse(sessionStorage.getItem("cart"));
	//var len= Object.keys(shopcart).length;
	
	
	var price=0;
	var data='<div class=\"col-md-12\">';
		for(var i=0;i<shopcart.prodid.length;i++)
			{
			data+='<div class=\"col-md-12\"><div class=\"col-md-2\"><img src=\"'+shopcart.itempicurl[i]+'\" alt=\"itempic\"/></div><div class=\"col-md-8\">'+shopcart.prodname[i]+'</div><div class=\"col-md-2\">$'+shopcart.price[i]+'</div></div><br/><br/>';
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
	    	
	 

	
	
	var shop={};
	var prodcolor, size;
	//choose color
	$('.sizebtn').click(function(){ 
		
		size=this.value;
		sessionStorage.setItem("size",size);
	});
	
	
	//choose size
	$('.prodcolorbtn').click(function(){ 
		
		
		prodcolor=this.id;
		sessionStorage.setItem("prodcolor",prodcolor);
	});
	
	
	
	
	
	//productdetails
	$('#details').click(function(){ 
		$('#details').removeClass('btn btn-md plainbtn');
		$('#details').addClass('btn btn-md activebtn');
		$('.reviews').hide();
		$('.styling').hide();
		$('.details').show();
		
		
	});
	
	$('#review').click(function(){ 
		$('#review').removeClass('btn btn-md plainbtn');
		$('#review').addClass('btn btn-md activebtn');
		$('.styling').hide();
		$('.details').hide();
		$('.reviews').show();
		
		
	});
	$('#styling').click(function(){ 
		$('#styling').removeClass('btn btn-md plainbtn');
		$('#styling').addClass('btn btn-md activebtn');
		$('.reviews').hide();
		$('.details').hide();
		$('.styling').show();
		
	});
	
	//getting query productid parameter
	var productid = getQueryVariable("id");
	sessionStorage.setItem("prodid",productid);
	
	function getQueryVariable(variable) {
	  var query = window.location.search.substring(1);
	  var vars = query.split("&");
	  for (var i=0;i<vars.length;i++) {
	    var pair = vars[i].split("=");
	    if (pair[0] == variable) {
	      return pair[1];
	    }
	  } 
	  alert('Query Variable ' + variable + ' not found');
	}
	
	/* 
	} */

	
	
	//get product details
	$.ajax({
 	    url : 'rest/getProduct/getProductById',
 	    type: 'POST',
 	    data : productid,
 	    contentType: 'application/json; charset=utf-8',
 	    dataType : 'json',
 	    processData: true,
 	    success: function(a,data)
 	    {
 	    	
 	    	 
 	     
 	      var menu,productlist,menuHere,prodlist='',childproducts,i;
 	      menu = eval('(' + JSON.stringify(a) + ')'); 
 	      
 	      productlist = menu.productid.length;
 	     
 	      $('#productname').html(menu.productname);
	 	  $('#darkgrayfont').html(menu.desc);
	 	    $('#description').html(menu.desc);
	 	    document.getElementById("prodback").style.backgroundImage="url('"+menu.imageurl+"')";
	 	   $('#pricebtn').html("$"+menu.price+"/ADD");
	 	   sessionStorage.setItem("price",menu.price);
	 	   $('#designer').html(menu.designername);
	 	   $('#profilepic').attr("src",menu.profilepic);
	 	  $('#designer').attr("href","Store.html?designer="+menu.designername);
	 	 sessionStorage.setItem("prodname",menu.productname);
	 	sessionStorage.setItem("itempicurl",menu.imageurl);
	 	sessionStorage.setItem("picurls",menu.pchildurls);
 	  
 	      menuHere = document.getElementById("nobullets");
 	   	  
 	     childproducts = menu.pchildids.length;
 	    
 	       for(i=0;i<childproducts;i++)
 	    	   {
 	    	  
 	    	  prodlist+='<li><a class=\"thumbnail\" href=\"#\"><img style=\"height:100px;width:100px;\" class=\"img-responsive\" src=\"'+menu.pchildurls[i]+'\" id=\"'+menu.pchildids[i]+'\" alt=\"product image\" /></a></li>';
 	    	 /* */
 	    	  
 	    	   };
 	      
 	      menuHere.innerHTML=prodlist;
 	     
 	    
 	    
 	     $('.img-responsive').click(function () { 
 	    	 
 	    	// alert(this.src);
 	    	document.getElementById("prodback").style.backgroundImage="url('"+this.src+"')";
 	     });
	 	
 	    	
 	    },
 	    error: function()
 	    {
 	    	alert("Products not available");
 	    }
 	});
	
	
	
	 $('[data-toggle="tooltip"]').tooltip();   


var from,to,subject,text;
$("#send").click(function(){ 
	validate();
    to=$("#email2").val();
    subject="Thanks for signing up with Era81";
    text="Hi User,\nWelcome to Era81.Vote for your customized product,decide its price and see it launch in your market.";
    $.get("http://localhost:3000/send",{to:to,subject:subject,text:text},function(data){
    if(data=="sent")
    {
	       /* $("#message").empty().html("
	
	Email is been sent at "+to+" . Please check inbox !
	
	");*/
	alert('Message sent');
    }

});
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
    

</script>
</html>

