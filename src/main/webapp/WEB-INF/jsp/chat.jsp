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

  <!-- template -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/themify-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/flag-icon-css/css/flag-icon.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/selectFX/css/cs-skin-elastic.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

  <script>
    if (localStorage.getItem("email") === null) {
      location.replace('http://localhost:8880/demo-client/login.do');
      localStorage.clear();
    }
    var email = localStorage.email;
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
        email = objToken.email;
        var t = objToken.exp * 1000 < new Date().getTime();
        if (t) {
          location.replace("http://localhost:8880/demo-client/login.do");
        }

      }

    }
    checkToken();
  </script>
  <!-- end template -->
  <style>
    body {
      background-color: #74EBD5;
      background-image: linear-gradient(90deg, #74EBD5 0%, #9FACE6 100%);
      /* background-image: linear-gradient(to right, #2193b0 ,  #6dd5ed ); */
      min-height: 100vh;
    }

    .container {
      max-width: 1170px;
      margin: auto;
    }

    img {
      max-width: 100%;
    }

    .inbox_people {
      background: #f8f8f8 none repeat scroll 0 0;
      float: left;
      overflow: hidden;
      width: 40%;
      border-right: 1px solid #c4c4c4;
    }

    .inbox_msg {
      border: 1px solid #c4c4c4;
      clear: both;
      overflow: hidden;
    }

    .top_spac {
      margin: 20px 0 0;
    }


    .recent_heading {
      float: left;
      width: 40%;
    }

    .srch_bar {
      display: inline-block;
      text-align: right;
      width: 60%;
    }

    .headind_srch {
      padding: 10px 29px 10px 20px;
      overflow: hidden;
      border-bottom: 1px solid #c4c4c4;
    }

    .recent_heading h4 {
      color: #05728f;
      font-size: 21px;
      margin: auto;
    }

    .srch_bar input {
      border: 1px solid #cdcdcd;
      border-width: 0 0 1px 0;
      width: 80%;
      padding: 2px 0 4px 6px;
      background: none;
    }

    .srch_bar .input-group-addon button {
      background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
      border: medium none;
      padding: 0;
      color: #707070;
      font-size: 18px;
    }

    .srch_bar .input-group-addon {
      margin: 0 0 0 -27px;
    }

    .chat_ib h5 {
      font-size: 15px;
      color: #464646;
      margin: 0 0 8px 0;
    }

    .chat_ib h5 span {
      font-size: 13px;
      float: right;
    }

    .chat_ib p {
      font-size: 14px;
      color: #989898;
      margin: auto
    }

    .chat_img {
      float: left;
      width: 11%;
    }

    .chat_ib {
      float: left;
      padding: 0 0 0 15px;
      width: 88%;
    }

    .chat_people {
      overflow: hidden;
      clear: both;
    }

    .chat_list {
      margin: 0;
      padding: 18px 16px 10px;
    }

    .inbox_chat {
      height: 550px;
      overflow-y: scroll;
    }

    .active_chat {
      background: #ebebeb;
    }

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

    .received_withd_msg {
      width: 57%;
    }

    .mesgs {
      background-image: url("${pageContext.request.contextPath}/images/background.jpg");
      float: left;
      padding: 30px 15px 0 25px;
      width: 60%;
    }

    .sent_msg p {
      background: #05728f none repeat scroll 0 0;
      border-radius: 3px;
      font-size: 14px;
      margin: 0;
      color: #fff;
      padding: 5px 10px 5px 12px;
      width: 100%;
    }

    .outgoing_msg {
      overflow: hidden;
      margin: 26px 0 26px;
    }

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

    .type_msg {
      border-top: 1px solid #c4c4c4;
      position: relative;
    }

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

    .messaging {
      padding: 0 0 50px 0;
    }

    .msg_history {
      height: 516px;
      overflow-y: auto;
    }
        button.cell:hover {
            border: 3px solid blue !important;

        }
  </style>

</head>

<body onload="load()">
  <aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">

      <div class="navbar-header">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu"
          aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
          <i class="fa fa-bars"></i>
        </button>
        <a class="navbar-brand"><b>Phòng Trò Chuyện</b></a>
        <a class="navbar-brand hidden" ><img src="${pageContext.request.contextPath}/images/logo2.png"
            alt="Logo"></a>
      </div>

      <div id="main-menu" class="main-menu collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <li>
            <a id= "room_name"></a>
          </li>
          <li>
            <button type="button" data-target="#form_create_check" data-toggle="modal"
              class="btn btn-secondary btn-sm ml-5"><i class="fa fa-lightbulb-o"></i>&nbsp; Tạo bàn</button>
            <button style="margin: 10px;" type="button" data-target="#form_ranked" data-toggle="modal"
              class="btn btn-secondary btn-sm ml-5"><i class="fa fa-user"></i>&nbsp; Xếp hạng</button>

            <div class="modal fade" id="form_create_check" tabindex="-1" role="dialog"
              aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">Tạo bàn cờ</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <div>
                      <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Tên bàn</label>
                        <input type="text" class="form-control" id="nameBoard">
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button id="createBoard" type="button" class="btn btn-primary">Xong</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal fade" id="form_ranked" tabindex="-1" role="dialog"
              aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">Bảng Xếp Hạng</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <div>
                      <div class="form-group">
                        <table id="listRanked" class="table">
                          <tr>
                            <th>Hạng</th>
                            <th>Tên</th>
                            <th>Điểm</th>
                          </tr>

                        </table>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal fade" id="form_accept" tabindex="-1" role="dialog"
              aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">Mời vào bàn cờ</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <div>
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Từ chối</button>
                    <button id="acceptEnter" type="button" class="btn btn-primary">Đồng ý</button>
                    </div>
                  </div>
                  <div class="modal-footer">
                    
                  </div>
                </div>
              </div>
            </div>
            <div id="all_form"></div>

          </li>
          <h3 class="menu-title">Danh sách bàn cờ</h3><!-- /.menu-title -->

          <li id="list_of_chess_board" class="menu-item dropdown">
          </li>
        </ul>
      </div><!-- /.navbar-collapse -->
    </nav>
  </aside><!-- /#left-panel -->


  <div id="right-panel" class="right-panel">
    <header id="header" class="header">
      <div class="header-menu">
        <div class="col-sm-7">
        
        </div>
        <div class ="col-sm-3">

        </div>
        <div class = "col-sm-2">
            <a href="http://localhost:8880/demo-client/list-room.do"><i>DANH SÁCH PHÒNG</i> </a>
        </div>
      </div>
    </header>

    <div class="content mt-3 " >
      <div class="messaging">
        <div class="inbox_msg">
          <div class="inbox_people">
            <div class="headind_srch">
              <div class="recent_heading">
                <h4>Đang hoạt động</h4>
              </div>
              <div class="srch_bar">

              </div>
            </div>
            <div class="inbox_chat" id="list_online">
            </div>
          </div>
          <div class="mesgs">
            <div class="msg_history" id="msg_history" >


            </div>
            <div class="type_msg">
              <div class="input_msg_write">
                <input type="text" class="write_msg" id="message" placeholder="Type a message" />
                <button class="msg_send_btn" id="send" type="button"><i class="fa fa-paper-plane-o"
                    aria-hidden="true"></i></button>
              </div>
            </div>
          </div>
        </div>

      </div>




    </div>

    <script src="${pageContext.request.contextPath}/vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

    <script>

      var listRooms;

      var ip = localStorage.ip;
      var port = localStorage.port;
      var idx = 0;
      var room_name_html =' <i class="menu-icon fa fa-dashboard"></i>Phòng '+localStorage.room_id;
 



      function load() {//load room tra ve tu api 
        $("#room_name").html(room_name_html); 
        let socket = new WebSocket('ws://'+ip +':' + port);

        //Gui tin nhan di
        socket.onopen = function (e) {
          console.log("[open] Connection established");
          console.log("Sending to server");
          var load_ranked = '{\
            msg_id: load_ranked\
          }';
          load_ch(socket);
          socket.send(load_ranked);
          var json1 = '{\
              msg_id: "load_msg",\
              msg_from:'+ email + '}';
          socket.send(json1);
          $(document).ready(function () {
            $('#message').keypress(function (e) {
              if (e.keyCode == 13)
                $('#send').click();
            });
          });
          $("#createBoard").click(function () {
            var js3 = '{\
             msg_id: "create_board",\
             email: "'+ email+ '",\
             name:"'+ $("#nameBoard").val() + '" \
               }';
            localStorage.name_of_chess_board = $("#nameBoard").val();
            socket.send(js3);
            load_ch(socket);
            location.replace("http://localhost:8880/demo-client/game-caro.do?name=" + $("#nameBoard").val() + "&email=" + email);
          });


          $("#send").click(function () {
            if($("#message").val().trim() != ""){
            var json2 = '{\
              msg_id: "normal",\
              msg_from:'+ email + ',\
              '+ 'msg:"' + String($("#message").val()) + '"}';
            socket.send(json2);
            $("#msg_history").append('\
                <div class="outgoing_msg">\
                  <div class="sent_msg">\
                    <p>'+ $("#message").val() + '</p>\
                  </div>\
                </div>\
            ');
            $("#message").val("");
          }
          });

        };
        //Xu li tin nhan toi
        socket.onmessage = function (event) {
          var js1 = JSON.parse(event.data);
          console.log(js1);

          if (js1.msg_id === "load") {
            console.log(js1.msg);
            if (js1.msg.length > 0) {
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
                      <p>'+ counter.msg + '</p>\
                      <span class="time_date">'+ counter.msg_from + '</span>\
                    </div>\
                  </div>\
                </div>\
          ');
              }
            }

          }
          else if (js1.msg_id === "load_ranked") {
            if (js1.list.length > 0) {
              var list_ranked = JSON.parse(js1.list);
            }
            for (var i = 0; i < list_ranked.length; i++) {
              var ranked = list_ranked[i];
              console.log(ranked);
              $("#listRanked").append('\
              <tr>\
              <td>'+ (i + 1) + '</td>\
              <td>'+ ranked.email + '</td>\
              <td>'+ ranked.score + '</td>\
              </tr>');
            }
          }
          else if (js1.msg_id === "online") {
            $("#list_online").empty();
            console.log(js1.list_user);
            var list_user = js1.list_user;
            $("#list_online").empty();
            for (var i = 0; i < list_user.length; i++) {

              var btn = $('<button>');
              $("#list_online").append(btn);
              btn.addClass("btn btn-outline-secondary btn-lg btn-block");
              btn.append('\
              <div class="chat_list">\
                <div class="chat_people">\
                  <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>\
                  <div class="chat_ib">\
                  <h5>'+ list_user[i].email + '</h5>\
                  <input type="text" hidden value="msg'+ i + '" id="msg' + i + '">\
                  <input type="text" hidden value="btn'+ i + '" id="btn' + i + '">\
                  </div>\
                </div>\
              </div>\
              ');

              if (list_user[i].email != email) {
                var formMsg = $('<div>');
                formMsg.append('\
                      <div class="modal fade" id="form_message'+ i + '" tabindex="-1" role="dialog"\
                      aria-labelledby="exampleModalCenterTitle" aria-hidden="true">\
                      <div class="modal-dialog modal-dialog-centered" role="document">\
                        <div class="modal-content">\
                          <div class="modal-header">\
                            <h5 class="modal-title" id="exampleModalCenterTitle">Gửi Tin Nhắn</h5>\
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">\
                              <span aria-hidden="true">&times;</span>\
                            </button>\
                          </div>\
                          <div class="modal-body">\
                            <div>\
                              <div class="form-group">\
                                <label for="recipient-name" class="col-form-label">Tin nhắn</label>\
                                <input type="text" class="form-control" id="'+ i + '">\
                              </div>\
                            </div>\
                          </div>\
                          <div class="modal-footer">\
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>\
                            <button id="sendMsg'+ i + '" type="button" class="btn btn-primary" data-dismiss="modal"> Gửi</button>\
                          </div>\
                        </div>\
                      </div>\
                    </div>\
                  ');
                  $("#all_form").append(formMsg);
                btn.click({ reiEmail: list_user[i].email, fromEmail: email, ix: i }, function (event) {
                  // $("#all_form").html(formMsg);
                  $("#form_message" + event.data.ix).modal("show");

                  $("#sendMsg" + event.data.ix).click({ rEmail: event.data.reiEmail, fEmail: event.data.fromEmail, index: event.data.ix}, function (rs) {
                    if($("#"+rs.data.index).val().trim() != ""){
                    var sendMsg = '{\
                    msg_id: "user_to_user",\
                    msg: "'+ String($("#"+String(rs.data.index)).val()) + '",\
                    msg_from: "'+ rs.data.fEmail + '",\
                    msg_reic: "'+ rs.data.rEmail + '"\
                  }';
                    socket.send(sendMsg);
                    $("#form_message" + event.data.ix);
                    $("#"+String(rs.data.index)).val("");
                  }
                  });

                });
              }


            }
          }
          else if (js1.msg_id === "normal") {
            console.log("Message Normal");
            $("#msg_history").append('\
              <div class="incoming_msg">\
                  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">\
                  </div>\
                  <div class="received_msg">\
                    <div class="received_withd_msg">\
                      <p>'+ String(js1.msg) + '</p>\
                      <span class="time_date">'+ js1.msg_from + '</span>\
                    </div>\
                  </div>\
                </div>\
          ');
          }
          else if (js1.msg_id === "load_list_chess_board") {
            var lst_cb = JSON.parse(js1.list);
            console.log(lst_cb);
            //FIXME: 
            $("#list_of_chess_board").empty();
            for (var jk = 0; jk < lst_cb.length; jk++) {
              if (lst_cb[jk].isFull == 2) {
                var btn = $('<button>');
                btn.addClass('btn btn-danger btn-lg btn-block');
                // btn.css("pointer-events", "none");
                btn.html(lst_cb[jk].name);
                
                $("#list_of_chess_board").append(btn);
                btn.click({ vi: lst_cb[jk].name, eml: email, v_socket : socket }, function (event) {

                  location.replace("http://localhost:8880/demo-client/game-caro.do?name=" + event.data.vi + "&email=" + event.data.eml);

                });
              }
              else if (lst_cb[jk].isFull == 1) {
                var btn = $('<button>');
                btn.addClass('btn btn-success btn-lg btn-block');
                btn.html(lst_cb[jk].name);
                temp = email.split("@")[0];
                if (lst_cb[jk].owner === temp){
                  btn.css("pointer-events", "none");
                }
                $("#list_of_chess_board").append(btn);
                btn.click({ vi: lst_cb[jk].name, eml: email, v_socket : socket }, function (event) {
                  var js4 = '{\
                      msg_id: "enter_board",\
                      email: "'+ event.data.eml + '",\
                      name:"'+ event.data.vi + '"\
                      }';
                  socket.send(js4);
                 
                  $(this).css("pointer-events", "none");
                  localStorage.name_of_chess_board = event.data.vi;


                  location.replace("http://localhost:8880/demo-client/game-caro.do?name=" + event.data.vi + "&email=" + event.data.eml);
                });
              }
            }
          }
          else if (js1.msg_id === "invite_game"){
            $("#form_accept").modal("show");
            $("#acceptEnter").click({name: js1.name, eml: email},function(event){
              var js4 = '{\
                      msg_id: "enter_board",\
                      email: "'+ event.data.eml + '",\
                      name:"'+ event.data.name + '"\
                      }';
              socket.send(js4);
            localStorage.name_of_check_board = event.data.name;
            location.replace("http://localhost:8880/demo-client/game-caro.do?name=" + event.data.name + "&email=" + email);
          })
          }
         
          else {
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
            // location.replace('http://localhost:8880/demo-client/login.do');
            // alert('[close] Connection died');
          }
          socket.close();
        };

        socket.onerror = function (error) {
          alert(`[error] ${error.message}`);
          socket.close();
        };

      }
      function create_form() {
        var fm = $('<form>');
        var i1 = $('<input>');
        i1.attr("type", "text");
        fm.append(i1);
      }
      function load_ch(socket) {
        var js5 = '{\
               msg_id: "load_list_chess_board" \
              }';
        socket.send(js5);
      }

    </script>
  </div>

</body>

</html>