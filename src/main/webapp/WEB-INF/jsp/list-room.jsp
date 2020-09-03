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
  <script src="${pageContext.request.contextPath}/js/check_token.js"></script>
  <script>
    checkToken('http://localhost:8880/demo-client/login.do',false);
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
  var url = "http://192.168.100.139:8080";
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
          

          // $.redirectPost("http://localhost:8880/demo-client/chat.do", {id: element.id, port: element.port, ip: element.ip});
          location.replace("http://localhost:8880/demo-client/chat.do");
          localStorage.room_id = element.id;
          localStorage.port = element.port;
          localStorage.ip = element.ip;

        
        };
        console.log(String(new_element.value));
        $("#list-rooms").append(new_element);
      });
    });

  }

</script>

</html>