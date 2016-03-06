

var myApp=angular.module('myApp',[]);
var myProfile=angular.module('myProfile',[]);
var myAccount=angular.module('myAccount',['ui.router','ui.bootstrap']);


myApp.controller('CatalogCtrl',['$scope','$http',function($scope,$http){
	
	console.log("hello world");
	
	$http.get('/catalog').success(function(response){
		console.log("I got data i requested");
		$scope.productlist=response;
	})


}])

myApp.controller('RegisterCtrl',['$scope','$http','$location',function($scope,$http,$location){
	
	console.log("registration");
	
	
$scope.addContact = function(){
	console.log($scope.user);
	$http.post('/catalog', $scope.user).success(function(response){
		console.log(response);
		sessionStorage.setItem("user",$scope.user.fname);
		

		
	});
};

}])

myAccount.controller('DropdownCtrl',['$scope','$http',function($scope,$http){
	
	console.log("In list controller");
	item1={
			name:'My Account',
			path:'#'
	};
	item2={
			name:'My Profile & Settings',
			path:'#'
	};
	item3={
			name:'My Orders',
			path:'#'
	};
	
	var menulist = [item1,item2,item3];
	$scope.menulist=menulist;
	
}])



myProfile.controller('ProfileCtrl',['$scope','$http',function($scope,$http){
	
	console.log("hello world profile");
	var id=sessionStorage.getItem("userid");
	$http.get('/profile/'+ id).success(function(response){
		console.log("I got data i requested");
		$scope.profileattr=response;
	})


}])


myApp.controller('ProductCtrl',['$scope','$http',function($scope,$http){
	
	console.log("hello world product");
	var id=$scope.id;
	
	$http.get('/productdetails/'+ id).success(function(response){
		console.log("I got data i requested");
		$scope.productdet=response;
	})


}])