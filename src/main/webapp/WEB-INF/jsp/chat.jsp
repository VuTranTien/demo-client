<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Demo</title>
  <meta name="description" content="GihOt Admin">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/script.js"></script>

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
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css"
    rel="stylesheet">
  <style>
    /*
*
* ==========================================
* FOR DEMO PURPOSES
* ==========================================
*
*/
    body {
      background-color: #74EBD5;
      background-image: linear-gradient(90deg, #74EBD5 0%, #9FACE6 100%);
      min-height: 100vh;
    }
    .container{max-width:1170px; margin:auto;}
img{ max-width:100%;}
.inbox_people {
  background: #f8f8f8 none repeat scroll 0 0;
  float: left;
  overflow: hidden;
  width: 40%; border-right:1px solid #c4c4c4;
}
.inbox_msg {
  border: 1px solid #c4c4c4;
  clear: both;
  overflow: hidden;
}
.top_spac{ margin: 20px 0 0;}


.recent_heading {float: left; width:40%;}
.srch_bar {
  display: inline-block;
  text-align: right;
  width: 60%; 
}
.headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}

.recent_heading h4 {
  color: #05728f;
  font-size: 21px;
  margin: auto;
}
.srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
.srch_bar .input-group-addon button {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  padding: 0;
  color: #707070;
  font-size: 18px;
}
.srch_bar .input-group-addon { margin: 0 0 0 -27px;}

.chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
.chat_ib h5 span{ font-size:13px; float:right;}
.chat_ib p{ font-size:14px; color:#989898; margin:auto}
.chat_img {
  float: left;
  width: 11%;
}
.chat_ib {
  float: left;
  padding: 0 0 0 15px;
  width: 88%;
}

.chat_people{ overflow:hidden; clear:both;}
.chat_list {
  border-bottom: 1px solid #c4c4c4;
  margin: 0;
  padding: 18px 16px 10px;
}
.inbox_chat { height: 550px; overflow-y: scroll;}

.active_chat{ background:#ebebeb;}

.incoming_msg_img {
  display: inline-block;
  width: 6%;
}
.received_msg {
  display: inline-block;
  padding: 0 0 0 10px;
  vertical-align: top;
  width: 92%;
 }
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 3px;
  color: #646464;
  font-size: 14px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
}
.time_date {
  color: #747474;
  display: block;
  font-size: 12px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 57%;}
.mesgs {
  float: left;
  padding: 30px 15px 0 25px;
  width: 60%;
}

 .sent_msg p {
  background: #05728f none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 14px;
  margin: 0; color:#fff;
  padding: 5px 10px 5px 12px;
  width:100%;
}
.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
.sent_msg {
  float: right;
  width: 46%;
}
.input_msg_write input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  color: #4c4c4c;
  font-size: 15px;
  min-height: 48px;
  width: 100%;
}

.type_msg {border-top: 1px solid #c4c4c4;position: relative;}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  position: absolute;
  right: 0;
  top: 11px;
  width: 33px;
}
.messaging { padding: 0 0 50px 0;}
.msg_history {
  height: 516px;
  overflow-y: auto;
}

    
  </style>

</head>

<body onload="load()">
  <div class="container">
    <br>
    <br>

    <h3 class=" text-center">Messaging</h3>
    <div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4 >Online</h4>
              <input type="text" hidden value="${room_id}" id="room_name">
              <input type="text" hidden value="${email}" id="email">
            </div>
            <div class="srch_bar">
              <div class="stylish-input-group">
                <input type="text" class="search-bar" placeholder="Search">
                <span class="input-group-addon">
                  <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                </span> </div>
            </div>
          </div>
          <div class="inbox_chat" id="list_online">
          

          </div>
        </div>
        <div class="mesgs">
          <div class="msg_history" id="msg_history">
            <div class="incoming_msg">
              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
              </div>
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>Test which is a new approach to have all
                    solutions</p>
                  <span class="time_date"> 11:01 AM | June 9</span>
                </div>
              </div>
            </div>
            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>Test which is a new approach to have all
                  solutions</p>
                <span class="time_date"> 11:01 AM | June 9</span>
              </div>
            </div>
            <div class="incoming_msg">
              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
              </div>
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>We work directly with our designers and suppliers,
                    and sell direct to you, which means quality, exclusive
                    products, at a price anyone can afford.</p>
                  <span class="time_date"> 11:01 AM | Today</span>
                </div>
              </div>
            </div>
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" class="write_msg" id="message" placeholder="Type a message" />
              <button class="msg_send_btn" id="send" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
        </div>
      </div>

    </div>

    <script>

      var listRooms;
     
      var ip="";
      var port="";
      var idx = 0;
      var email =$("#email").val();
      alert(email);
     
      

      function load() {//load room tra ve tu api 
        console.log($("#room_name").val());
        
        
      


        // Khoi tao socket

        let socket = new WebSocket("ws://192.168.100.139:"+"9000");

        //Gui tin nhan di
        socket.onopen = function (e) {
          console.log("[open] Connection established");
          console.log("Sending to server");

           var json1 = '{\
              msg_id: "load_msg",\
              msg_from:'+ email +'}';
            socket.send(json1);
            $(document).ready(function () {
            $('#message').keypress(function (e) {
              if (e.keyCode == 13)
                $('#send').click();
            });
          });
          $("#send").click(function () {

            var json2 = '{\
              msg_id: "normal",\
              msg_from:'+ email +',\
              '+'msg:"'+ String($("#message").val())+'"}';
            socket.send(json2);
            $("#msg_history").append('\
                <div class="outgoing_msg">\
                  <div class="sent_msg">\
                    <p>'+$("#message").val()+'</p>\
                  </div>\
                </div>\
            ');
            $("#message").val("");
          });
         
        };
        //Xu li tin nhan toi
        socket.onmessage = function (event) {
          var js1 = JSON.parse(event.data);
          
          if(js1.msg_id==="load"){
            console.log(js1.msg);
            if(js1.msg.length>0){
              var jsonData = JSON.parse(js1.msg);
            for (var i = 0; i < jsonData.length; i++) {
              var counter = jsonData[i];
                console.log(counter);

              $("#msg_history").append('\
              <div class="incoming_msg">\
                  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">\
                  </div>\
                  <div class="received_msg">\
                    <div class="received_withd_msg">\
                      <p>'+counter.msg+'</p>\
                      <span class="time_date">'+ counter.msg_from +'</span>\
                    </div>\
                  </div>\
                </div>\
          ');
          }
            }

          }
          else if (js1.msg_id === "online"){
            $("#list_online").empty();
            console.log(js1.list_user);
            var list_user = js1.list_user;
            $("#list_online").empty();
            for (var i = 0;i<list_user.length;i++){
              $("#list_online").append('\
              <div class="chat_list">\
              <div class="chat_people">\
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>\
                <div class="chat_ib">\
                  <h5>'+list_user[i].email+'<span class="chat_date">Dec 25</span></h5>\
                </div>\
              </div>\
            </div>\
              ');

            }


          }   
          else if(js1.msg_id==="normal"){
            console.log("IN NORMALLLLLLLLLLLL");
            $("#msg_history").append('\
              <div class="incoming_msg">\
                  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">\
                  </div>\
                  <div class="received_msg">\
                    <div class="received_withd_msg">\
                      <p>'+String(js1.msg)+'</p>\
                      <span class="time_date">'+ js1.msg_from +'</span>\
                    </div>\
                  </div>\
                </div>\
          ');
          }
          else{
            console.log("Error in message recieved");
          }     
          console.log('[message] Data received from ' + js1.msg_from + ' : ' + js1.msg);
        };

        socket.onclose = function (event) {
          if (event.wasClean) {
            alert(`[close] Connection closed cleanly, code=${event.code} reason=${event.reason}`);
          } else {
            // e.g. server process killed or network down
            // event.code is usually 1006 in this case
            alert('[close] Connection died');
          }
        };

        socket.onerror = function (error) {
          alert(`[error] ${error.message}`);
        };

      }
    </script>

</body>

</html>