<!doctype html>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
<html class="no-js" lang="en">

<head>
  <meta charset="utf-8">
  <title>Demo</title>
  <meta name="description" content="GihOt Admin">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
    integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
    crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <style>
    body {
      background-color: #74EBD5;
      background-image: linear-gradient(90deg, #74EBD5 0%, #9FACE6 100%);
      /* background-image: linear-gradient(to right, #c4e0e5, #4ca1af ); */
      min-height: 100vh;
    }

    ::-webkit-scrollbar {
      width: 5px;
    }

    ::-webkit-scrollbar-track {
      width: 5px;
      background: #f5f5f5;
    }

    ::-webkit-scrollbar-thumb {
      width: 1em;
      background-color: #ddd;
      outline: 1px solid slategrey;
      border-radius: 1rem;
    }

    .text-small {
      font-size: 0.9rem;
    }

    .messages-box,
    .chat-box {
      height: 510px;
      overflow-y: scroll;
    }

    .rounded-lg {
      border-radius: 0.5rem;
    }

    input::placeholder {
      font-size: 0.9rem;
      color: #999;
    }
  </style>
  <script>
    var token;

    function parseJwt(token) {
      var base64Url = token.split('.')[1];
      var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
      var jsonPayload = decodeURIComponent(atob(base64).split('').map(function (c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
      }).join(''));

      return String(jsonPayload);
    }
    function checkToken() {
        
      if (!(document.cookie === "")) {//check xem token con hieu luc khong
      token = document.cookie.split(";")[0].split("=")[1];
        var objToken = JSON.parse(parseJwt(token));
        console.log(objToken);
        var t = objToken.exp*1000 < new Date().getTime();
        if(t){
          alert(t);
          location.replace("http://localhost:8880/demo-client/login.do");
        }
        // alert(document.cookie.split(";")[0].split("=")[1]);
        
      }
      
    }
    checkToken();

  </script>
</head>

<body onload="loadRoom()">
  <div class="container" style="margin-top: 20px;">
    <div class="row justify-content-center ">
      <h2>List Room</h2>
    </div>
    <div class="row justify-content-center ">
      <div class="btn-group-vertical w-50 " id="list-rooms">
      </div>
    </div>
  </div>

  

</body>
<script>
  // var listRooms;
  $.extend(
    {
        redirectPost: function(location, args)
        {
            var form = $('<form></form>');
            form.attr("method", "post");
            form.attr("action", location);

            $.each( args, function( key, value ) {
                var field = $('<input></input>');

                field.attr("type", "hidden");
                field.attr("name", key);
                field.attr("value", value);

                form.append(field);
            });
            $(form).appendTo('body').submit();
        }
    });
  var urlPre = "http://localhost:8880";
  var url = "http://192.168.100.138:8080";
  function loadRoom() {//load room tra ve tu api 
  
    $.post(url+"/center/user/room_list.do", function (data) {
      var listRooms = JSON.parse(data);
      var i = 0;
      listRooms.forEach((element) => {
        var new_element = document.createElement("button");

        new_element.name = element.name; 
        new_element.setAttribute("id","room_"+element.id);
        new_element.setAttribute("value",element.name);
        new_element.setAttribute("class","btn btn-success")
        new_element.innerHTML = element.name;
        new_element.onclick = function() { // Note this is a function
          //goi ajax toi api check xem token co hop le khong
          // alert(element.id);
          // $.post(
          //         urlPre+"/restApi/room_info.do",
          //         {
          //           id : parseInt(element.id)
                    
          //         },
          //         function(result){
          //           var j2 = JSON.parse(result);
          //           var ip_ = j2.ip;
          //           var port_ = j2.port;
                    
          //           $.redirectPost("http://localhost:8880/demo-client/chat.do", {ip: ip_, port: port_});


          //         }

          //       );
          $.redirectPost("http://localhost:8880/demo-client/chat.do", {id: element.id, port: element.port, ip: element.ip});
          

        };
        console.log(String(new_element.value));
        $("#list-rooms").append(new_element);
      });
    });

  }

</script>

</html>