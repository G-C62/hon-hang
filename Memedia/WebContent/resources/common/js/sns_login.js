// 로그인 처리를 위한 함수

function post_to_url(path, params, method){
	method = method || "post";
	  
	var form = document.createElement('form');
	form.setAttribute('method', method);
	form.setAttribute('action', path);
	  
	for(var key in params){
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',key);
		hiddenField.setAttribute('value',params[key]);
		form.appendChild(hiddenField);
	}
	document.body.appendChild(form);
	form.submit();
}

//facebook login

var flag = 0;

// This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // response는 로그인 상태정보를 보여준다.
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // 페이스북을 통해서 로그인
    	flag = 1;
    } else if(response.status === 'unknown'){
    	flag = 0;
    } else {
      // 페이스북에는 로그인 되어있으나 앱에는 로그인이 로그인되어있지 않은 경우
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
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
		appId      : '307253989707808',
		cookie     : true,  // enable cookies to allow the server to access the session
		xfbml      : true,  // parse social plugins on this page
		version    : 'v2.8' // use graph api version 2.8
	});
  
	FB.Event.subscribe('auth.login', function(response) {
		FB.api('/me',{fields: 'id,name,email', locale : 'ko_KR'},function(response) {
			post_to_url('/social/login.do',{'id':response.id, 'name':response.name, 'email':response.email}, 'post');
		});
	});
	  
	//    FB.Event.subscribe('auth.logout', function(response) {
	//  	    flag = 0;
	//    });

	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});
};

  // Load the SDK asynchronously
(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/ko_KR/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk')); 
  
function loginFB(){
	if(flag == 0){
		FB.login();
	} else{
		FB.api('/me',{fields: 'id,name,email', locale : 'ko_KR'},function(response) {
			var user_img = 'http://graph.facebook.com/' + response.id + '/picture?type=large';
			post_to_url('/social/login.do',{'id':response.id, 'name':response.name, 'email':response.email, 'category':'facebook', 'image':user_img}, 'post');
		});
	}  
}  
  
// google login

var googleUser = {};
var startApp = function() {
	gapi.load('auth2', function(){
		auth2 = gapi.auth2.init({
			client_id: '721109737898-tmf89oa6vhpdhogrv9g3meuu5uetr6om.apps.googleusercontent.com',
			cookiepolicy: 'single_host_origin',
		});
		attachSignin(document.getElementById('customBtn'));
	});
};

function attachSignin(element) {
  	console.log(element.id);
  	auth2.attachClickHandler(element, {},
  			function(googleUser) {
  				var profile = googleUser.getBasicProfile();
	
				post_to_url('/social/login.do',{'id':profile.getId(), 'name':profile.getName(), 'email':profile.getEmail(), 'category':'google', 'image':profile.getImageUrl()}, 'post');
				
	// The ID token you need to pass to your backend:
	var id_token = googleUser.getAuthResponse().id_token;
	console.log("ID Token: " + id_token);
  			}, function(error) {
  				alert(JSON.stringify(error, undefined, 2));
  			});
}

// logout
function logout(){
	location.href='/social/logout.do';  
}