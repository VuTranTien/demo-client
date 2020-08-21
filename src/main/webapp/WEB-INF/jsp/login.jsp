<!doctype html>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
<html class="no-js" lang="en">

<head>
  <meta charset="utf-8">
  <title>LOG IN</title>
  <meta name="description" content="GihOt Admin">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style>
      body{
        /* background-image: linear-gradient(to right, #c4e0e5, #4ca1af ); */
        background-image: linear-gradient(90deg, #74EBD5 0%, #9FACE6 100%);
      }
    </style>
  <script>
    function parseJwt(token) {
      var base64Url = token.split('.')[1];
      var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
      var jsonPayload = decodeURIComponent(atob(base64).split('').map(function (c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
      }).join(''));

      return String(jsonPayload);
    }
    function checkToken() {
        chrome.cookies.get({ url: "http://localhost:8880/demo-client/", name: 'PHPSESSID' }, function (cookie) {
          // do something with the cookie
          console.log(cookie);
          alert(cookie.name + ' found, value: ' + cookie.value);
        });
      if (!(document.cookie === "")) {//check xem token con hieu luc khong
        // var objToken = JSON.parse(parseJwt(document.cookie.split(";")[0].split("=")[1]));
        // alert(document.cookie.split(";")[0].split("=")[1]);
        location.replace("http://localhost:8880/demo-client/list-room.do");
      }
    }
    // checkToken();
  </script>
</head>

<body >

  <div class="container" style="margin-top: 20px;">
    <div class="row justify-content-center ">
      <h2>SIGN IN</h2>
    </div>

    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="form-group">
          <label for="exampleInputEmail1">Email address</label>
          <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp">
          <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>
        <div class="form-group">
          <label for="exampleInputPassword1">Password</label>
          <input type="password" name="password" class="form-control" id="password">
        </div>
        <button onclick="callLogin()" class="btn btn-primary">Submit</button>
      </div>

    </div>

  </div>
  <script>
    function callLogin() {
      // if (document.cookie !== "") {//check xem token con hieu luc khong
      //     console.log(parseJwt(document.cookie));
      // }
      // else {
        
        $.post(
          "http://localhost:8880/restApi/login.do",
          {
            email: $("#email").val(),
            password: $("#password").val()
          },
          function (result) {
            console.log(result);
            var resInJson = JSON.parse(result);
            if (resInJson.ret == 0) {
              window.localStorage.setItem("email", resInJson.email);
              // window.localStorage.getItem(key); //gettoken from local storage
              document.cookie = 'access_token=' + resInJson.token;
              window.localStorage.setItem("key", resInJson.key);
              location.replace("http://localhost:8880/demo-client/list-room.do");
              // alert(document.cookie.split(";")[0].split("=")[1]);

            }
          }
        );
      
    }
    function parseJwt(token) {
      var base64Url = token.split('.')[1];
      var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
      var jsonPayload = decodeURIComponent(atob(base64).split('').map(function (c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
      }).join(''));

      return String(jsonPayload);
    }

  </script>

</body>