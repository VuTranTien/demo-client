<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Play</title>
    <meta name="description" content="GihOt Admin">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/check_token.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
    integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
    crossorigin="anonymous"></script>

    <script>
        var email = localStorage.email;
        var name_of_chess_board = localStorage.name_of_chess_board;

        checkToken('http://localhost:8880/demo-client/login.do', false);
    </script>

    <style>
        button.cell:hover {
            border: 3px solid blue !important;

        }

        body {
            background-image: url("${pageContext.request.contextPath}/images/backgroundGame.jpeg");
            font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji"
        }

        p {
            text-align: center !important;
        }
    </style>
</head>

<body onload="load()">

    <div class="container-fluid" style="margin-top: 20px;">
        <div class="row justify-content-center">
            <h1> GAME BOARD </h1>
        </div>

        <div class="row justify-content-end">
            <div class="col-3">
                <div class="row justify-content-center">
        
                    <button id="btnInvite" style="margin: 10px;" type="button" data-target="#form_invite" data-toggle="modal"
                        class="btn btn-primary btn-lg active">Invite</button>
        
                    <div class="modal fade" id="form_invite" tabindex="-1" role="dialog"
                        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">List User Online</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div>
                                        <div class="form-group">
                                            <table id="listOnline" class="table">
        
        
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                </div>
              </div>
                        </div>

                </div>
            </div>
            <div class='col-3' >
                <div class="row justify-content-center">
                    <button style="margin: 10px;" type="button" class="btn btn-secondary btn-lg active" id="call_back">BACK</button>                    
                </div>
            </div>

        </div>
        <br>
        <div class="row">

            <div class="col-12">
                <div class="row justify-content-center">
                    <div class="col-4">
                        <div class="row">
                            <div class="col-8"><button style="width: 8em;" id="btnStart" type="button"
                                    class="btn btn-warning">Start Game</button></div>
                            <div class="col-4"><button id="btnRestart" style="width: 8em;" type="button"
                                    class="btn btn-warning">Restart</button></div>
                            
                        </div>
                    </div>
                </div>

                <br>
            </div>

            <!----------------------------------------------------------------------letf----------------------------------------------------------------->
            <div class="col-3 background-left">
                <br>
                <div class="row justify-content-center">
                    <h3 id="nameUser1">USER1</h3>
                </div>
                <div class="row justify-content-center">
                    <span style="font-size: 18px;" id="scoreUser1"></span>
                </div>
                <div class="row justify-content-center">
                    <span style="font-size: 18px;" id="historyUser1"></span>
                </div>
                <div class="row justify-content-center">
                    <span id="timerUser1" , style="color: red; font-size: 25px;">0:00</span>
                </div>
                <br>
                <br>
                <div class="row justify-content-center">
                    <svg width="6em" height="6em" viewBox="0 0 16 16" class="bi bi-x align-center btn-outline-danger"
                        fill="currentColor" xmlns="http://www.w3.org/2000/svg">\
                        <path fill-rule="evenodd"
                            d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z" />\
                        <path fill-rule="evenodd"
                            d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z" />\
                    </svg>
                </div>

            </div>
            <!----------------------------------------------------------------------center----------------------------------------------------------------->
            <div class="col-6">
                <div class="row justify-content-left" id="frame0">
                    <table id="gameBoard">
                        <tbody></tbody>
                    </table>
                </div>
            </div>
            <!----------------------------------------------------------------------right----------------------------------------------------------------->
            <div class="col-3 background-right">

                <br>
                
                <div class="row justify-content-center">
                    <h3 id="nameUser2">User2</h3>
                </div>

                <div class="row justify-content-center">
                    <span style="font-size: 18px;" id="scoreUser2"></span>
                </div>
                <div class="row justify-content-center">
                    <span style="font-size: 18px;" id="historyUser2"></span>
                </div>
                <div class="row justify-content-center">
                    <span id="timerUser2" , style="color: red; font-size: 25px;">0:00</span>
                </div>
                <br>
                <br>
                <div class="row justify-content-center">
                    <svg width="5em" height="5em" viewBox="0 0 16 16" class="bi bi-circle-fill" fill="currentColor"
                        xmlns="http://www.w3.org/2000/svg">
                        <circle cx="8" cy="8" r="8" />
                    </svg>
                </div>


            </div>
        </div>
        <div class="row">
            <!-- <button onclick="test()" id = "test_click">clickME</button> -->

        </div>
    </div>


    <script>
        var chessBoard = [];
        var x, y;
        var size = 23;
        var turn = size ** 2;
        var matrix = [[]];
        var dataMatrix = [[]];
        var url = "ws://192.168.100.138:";
        var maskOf_X = '<svg width="2em" height="2em" viewBox="6 6 16 16" class="bi bi-x align-center btn-outline-danger" fill="currentColor" xmlns="http://www.w3.org/2000/svg">\
                <path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z"/>\
                <path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z"/>\
                </svg>';
        var maskOf_O = '<svg width="1.8em" height="1.8em" viewBox="0.4 0.7 45 35" class="bi bi-circle-fill text-dark" fill="currentColor" xmlns="http://www.w3.org/2000/svg">\
                        <circle cx="10" cy="10" r="10"/>\
                        </svg>';
        var t1, t2, t3, t4;
        var seconds1 = 20, $seconds1 = document.querySelector('#timerUser1');
        var seconds2 = 20, $seconds2 = document.querySelector('#timerUser2');
        function countdown3() {
            $seconds1.textContent = '0:' + seconds1;
            if (seconds1-- > 0) t3 = setTimeout(countdown3, 1000)
        };

        function countdown4() {
            $seconds2.textContent = '0:' + seconds2;
            if (seconds2-- > 0) t4 = setTimeout(countdown4, 1000)
        };

        //-------------------------------------------------------------------------------
        function load() {
            $("#btnRestart").css("pointer-events", "none", "important");


            //Connection Server
            let socket = new WebSocket(url + "9000");
            function countdown1() {
                $seconds1.textContent = '0:' + seconds1;
                if (seconds1-- > 0) t1 = setTimeout(countdown1, 1000)
                if (seconds1 == 0) {
                    for (var k = 0; k < size; k++) {
                        for (var l = 0; l < size; l++) {
                            if (dataMatrix[k][l] == -1) {
                                matrix[k][l].css("pointer-events", "auto");
                            }
                        }
                    }
                    sendState(socket);
                }
            };
            function sendState(socket) {
                var state_count_down = '{\
                    msg_id: "game_state",\
                    name: "'+ localStorage.name_of_chess_board + '",\
                    x: '+ -1 + ',\
                    y: '+ -1 + '\
                    }';
                socket.send(state_count_down);
            }
            function countdown2() {
                $seconds2.textContent = '0:' + seconds2;
                if (seconds2-- > 0) t2 = setTimeout(countdown2, 1000)
                if (seconds2 == 0) {
                    for (var k = 0; k < size; k++) {
                        for (var l = 0; l < size; l++) {
                            if (dataMatrix[k][l] == -1) {
                                matrix[k][l].css("pointer-events", "auto");
                            }
                        }
                    }
                    sendState(socket);
                }
            };

            socket.onopen = function (e) {
                console.log("-------------Room Connection------------");

                $("#call_back").click(function () {
                    var back = '{\
                msg_id: "call_back",\
                name: "'+ localStorage.name_of_chess_board + '",\
                }';
                    socket.send(back);
                    location.replace('http://localhost:8880/demo-client/chat.do');
                });

                $("#btnInvite").click(function () {
                    $("#listOnline").empty();
                    $("#listOnline").append('<tr>\
                                        <th>Number</th>\
                                        <th>Name</th>\
                                        <th>Invite</th>\
                                    </tr>');
                    var getUser = '{\
                msg_id: "user_online"\
                }';
                    socket.send(getUser);

                });
                overide_channel_reload(socket);
                $("#btnStart").click(function () {
                    var startgame = '{\
                msg_id: "game_start",\
                name:"'+ localStorage.name_of_chess_board + '",\
                email:"'+ email + '"\
                }';
                    socket.send(startgame);
                });
                // TODO load score user
                var getScoreOwner = '{\
                    msg_id:"load_score",\
                    name: "'+ localStorage.name_of_chess_board + '"\
                    }';

                socket.send(getScoreOwner);

                $("#btnRestart").click(function () {
                    clearTimeout(t1);
                    clearTimeout(t2);
                    clearTimeout(t3);
                    clearTimeout(t4);
                    $("#timerUser1").text("0:20");
                    $("#timerUser2").text("0:20");
                    for (var k = 0; k < size; k++) {
                        for (var l = 0; l < size; l++) {
                            dataMatrix[k][l] = -1;
                            matrix[k][l].html("").css("pointer-events", "auto");
                        }
                    }
                    //TODO: reset turn ve 0
                    turn = 0;

                    var js2 = '{\
                    msg_id: "restart_game",\
                    name: "'+ localStorage.name_of_chess_board + '"\
                     }';

                    //TODO: reset matrix
                    socket.send(js2);
                });


                socket.onmessage = function (event) {

                    var json = JSON.parse(event.data);
                    console.log(json);
                    if (json.msg_id === "load_score") {
                        if (json.msg_type === "c1") {
                            $("#nameUser1").text(json.email);
                            $("#scoreUser1").text('Score: ' + json.score);
                            $("#historyUser1").text('W:' + json.win + ' L:' + json.lose);
                        }
                        else if (json.msg_type === "c2") {
                            $("#nameUser2").text(json.email);
                            $("#scoreUser2").text('Score: ' + json.score);
                            $("#historyUser2").text('W:' + json.win + ' L:' + json.lose);
                            $("#btnInvite").css("pointer-events", "none");
                        }
                    }
                    else if (json.msg_id === "update_score") {
                        var list_score = JSON.parse(json.list);
                        $("#scoreUser1").text('Score: ' + list_score[0].score);
                        $("#historyUser1").text('W:' + list_score[0].win + ' L:' + list_score[0].lose);

                        $("#scoreUser2").text('Score: ' + list_score[1].score);
                        $("#historyUser2").text('W:' + list_score[1].win + ' L:' + list_score[1].lose);
                    }
                    else if (json.msg_id === "game_state_win") {
                        clearTimeout(t1);
                        clearTimeout(t2);
                        clearTimeout(t3);
                        clearTimeout(t4);
                        $("#timerUser1").text("0:20");
                        $("#timerUser2").text("0:20");
                        alert(json.winner);
                        $("#btnRestart").css("pointer-events", "auto", "important");
                        //TODO: restart game
                        for (var k = 0; k < size; k++) {
                            for (var l = 0; l < size; l++) {
                                matrix[k][l].html("").css("pointer-events", "none", "important");
                            }
                        }

                    }
                    else if (json.msg_id === "is_start") {
                        if (json.ret == 0) {
                            $('.isClick').css("pointer-events", "auto");
                            $("#btnStart").css("pointer-events", "none");
                        }
                        else {
                            $("#btnStart").css("pointer-events", "auto");
                            alert("Waiting another player...");

                        }
                    }
                    else if(json.msg_id === "not_ready"){
                        alert("Wait a minute!\nYour friend is not ready");
                    }
                    else if (json.msg_id === "game_state") {
                        if (json.user === "c1") {
                            clearTimeout(t1);
                            clearTimeout(t3);
                            countdown2();
                            seconds1 = 20;
                        }
                        else if (json.user === "c2") {
                            clearTimeout(t2);
                            clearTimeout(t4);
                            countdown1();
                            seconds2 = 20;
                        }
                        var ix = json.x;
                        var jy = json.y;
                        if (json.x != -1) {
                            matrix[ix][jy].html(json.label == 0 ? maskOf_O : maskOf_X).css("pointer-events", "none", "important");
                            dataMatrix[ix][jy] = json.label;
                        }
                        for (var k = 0; k < size; k++) {
                            for (var l = 0; l < size; l++) {
                                if (dataMatrix[k][l] == -1) {
                                    matrix[k][l].css("pointer-events", "auto");
                                }
                            }
                        }
                    }
                    else if (json.msg_id === "game_state_from_me") {
                        if (json.user === "c1") {
                            clearTimeout(t1);
                            countdown4();
                            seconds1 = 20;
                        }
                        else if (json.user === "c2") {
                            clearTimeout(t2);
                            countdown3();
                            seconds2 = 20;
                        }
                        var ix = json.x;
                        var jy = json.y;
                        if (json.x != -1) {
                            matrix[ix][jy].html(json.label == 0 ? maskOf_O : maskOf_X).css("pointer-events", "none", "important");
                            dataMatrix[ix][jy] = json.label;
                        }
                        else {
                            for (var k = 0; k < size; k++) {
                                for (var l = 0; l < size; l++) {
                                    if (dataMatrix[k][l] == -1) {
                                        matrix[k][l].css("pointer-events", "none");
                                    }
                                }
                            }
                        }

                    }
                    else if (json.msg_id === "restart_game") {
                        for (var k = 0; k < size; k++) {
                            for (var l = 0; l < size; l++) {
                                dataMatrix[k][l] = -1;
                                matrix[k][l].html("").css("pointer-events", "auto");
                            }
                        }
                        clearTimeout(t1);
                        clearTimeout(t2);
                        $("#timerUser1").text("0:20");
                        $("#timerUser2").text("0:20");
                        $("#btnRestart").css("pointer-events", "none", "important");
                        //TODO: reset turn ve 0
                    }
                    else if (json.msg_id === "reload_data_matrix") {
                        dataMatrix = json.matrix;
                        console.log(dataMatrix);
                        // $("#gameBoard").css("pointer-events", "auto");
                        for (var k = 0; k < size; k++) {
                            for (var l = 0; l < size; l++) {
                                if (json.is_your_turn == -1) {
                                    matrix[k][l].css("pointer-events", "none");
                                    if (dataMatrix[k][l] != -1) {
                                        matrix[k][l].html(dataMatrix[k][l] == 0 ? maskOf_O : maskOf_X);
                                    }

                                }
                                else {
                                    if (dataMatrix[k][l] != -1) {
                                        matrix[k][l].css("pointer-events", "none", "important");
                                        matrix[k][l].html(dataMatrix[k][l] == 0 ? maskOf_O : maskOf_X);
                                        continue;
                                    }
                                    matrix[k][l].css("pointer-events", "auto");


                                }

                            }
                        }



                    }

                    else if (json.msg_id === "watch_match") {
                        $("#btnStart").css("pointer-events", "none", "important");
                        $("#btnRestart").css("pointer-events", "none", "important");
                        for (var k = 0; k < size; k++) {
                            for (var l = 0; l < size; l++) {
                                if (dataMatrix[k][l] == -1) {
                                    matrix[k][l].css("pointer-events", "none");
                                }
                            }
                        }
                    }
                    else if (json.msg_id === "game_state_watch") {

                        if (json.user === "c1") {
                            clearTimeout(t3);
                            countdown4();
                            seconds1 = 20;
                        }
                        else if (json.user === "c2") {
                            clearTimeout(t4);
                            countdown3();
                            seconds2 = 20;
                        }
                        var ix = json.x;
                        var jy = json.y;
                        if (json.x != -1) {
                            matrix[ix][jy].html(json.label == 0 ? maskOf_O : maskOf_X).css("pointer-events", "none", "important");
                            dataMatrix[ix][jy] = json.label;
                        }
                    }
                    else if (json.msg_id === "restart_game_watch") {
                        clearTimeout(t3);
                        clearTimeout(t4);
                        $("#timerUser1").text("0:20");
                        $("#timerUser2").text("0:20");
                        for (var k = 0; k < size; k++) {
                            for (var l = 0; l < size; l++) {
                                dataMatrix[k][l] = -1;
                                matrix[k][l].html("");
                            }
                        }
                    }
                    else if (json.msg_id === "reset_user2") {
                        clearTimeout(t1);
                        clearTimeout(t2);
                        clearTimeout(t3);
                        clearTimeout(t4);
                        for (var k = 0; k < size; k++) {
                            for (var l = 0; l < size; l++) {
                                dataMatrix[k][l] = -1;
                                matrix[k][l].html("");
                            }
                        }
                        $("#btnInvite").css("pointer-events", "auto");
                        $("#nameUser2").text("USER2");
                        $("#scoreUser2").empty();
                        $("#historyUser2").empty();
                        $("#timerUser1").text("0:00");
                        $("#timerUser2").text("0:00");
                    }
                    else if (json.msg_id === "is_ready") {
                        var rd_content = $('#frame0');
                        var ready_btn = $('<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ready_modal">');
                        var ready_modal = $('<div class="modal fade" id="ready_modal">');

                        var md_dialog = $('<div class="modal-dialog modal-sm">');

                        var md_content = $('<div class="modal-content">').html('<div class="modal-header">\
                                                <h4 class="modal-title"><i style="color: crimson;">'+json.msg_from+'</i> want to start game!</h4>\
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>\
                                                </div>\
                                                <div class="modal-body">\
                                                Combat now!\
                                                </div>');
                        var rd_footer = $('<div class="modal-footer">');
                            var btn_accept = $('<button type="button" class="btn btn-secondary" data-dismiss="modal">')
                                            .html('Yes')
                                            .click({s:socket},function(event){
                                                event.data.s.send('{\
                                                    msg_id:"ready_response",\
                                                    ret: 0,\
                                                    name:"'+name_of_chess_board+'"\
                                                }');
                                            });
                            var btn_not_accept = $('<button type="button" class="btn btn-secondary" data-dismiss="modal">')
                                            .html('No')
                                            .click({s:socket},function(event){
                                                event.data.s.send('{\
                                                    msg_id:"ready_response",\
                                                    ret: -1,\
                                                    name:"'+name_of_chess_board+'"\
                                                }');
                                            });
                        rd_footer.append(btn_accept).append(btn_not_accept);
                        md_content.append(rd_footer);
                        md_dialog.html(md_content);
                        ready_modal.html(md_dialog);
                        rd_content.append(ready_modal);
                        $(ready_modal).modal('show');
                        // rd_content.children("#")
                    }

                    else if (json.msg_id === "online"){
                        $("#listOnline").empty();
                        $("#listOnline").append('<tr>\
                                        <th>Number</th>\
                                        <th>Name</th>\
                                        <th>Invite</th>\
                                    </tr>');
                       var list_user = json.list_user;
                       for (var i = 0; i < list_user.length; i++) {
                        var temp = list_user[i].email.split("@")[0];
                        var row = $('<tr>');
                        var num = $('<td>');
                        var name = $('<td>');
                        num.html(i+1);
                        name.html(temp);
                        var invite = $('<td>');
                        var buttonInvite = $('<button>');
                        buttonInvite.addClass("btn btn-success btn-sm rounded-0");
                        buttonInvite.html("Invite");
                        buttonInvite.click({ip_port: list_user[i].ip_port, email: list_user[i].email},function(event){
                            var inviteUser = '{\
                                msg_id: "invite_game",\
                                ip_port: "'+event.data.ip_port+'",\
                                email: "'+event.data.email+'",\
                                name: "'+localStorage.name_of_chess_board+'"\
                            }';
                            socket.send(inviteUser);
                        })
                        invite.html(buttonInvite);
                        row.append(num);
                        row.append(name);
                        row.append(invite);
                        $("#listOnline").append(row);
                       }
                    }
                };

                socket.onclose = function (event) {

                    if (event.wasClean) {
                        alert(`[close] Connection closed cleanly, code=${event.code} reason=${event.reason}`);
                    } else {
                        // e.g. server process killed or network down
                        // event.code is usually 1006 in this case
                        alert('[close] Connection died');
                    }
                    socket.close();
                };

                socket.onerror = function (error) {
                    alert(`[error] ${error.message}`);
                    socket.close();
                };

                create_chessBoard(socket);


            }
        }
        //-------------------------------------------------------------------------------

        function create_chessBoard(s) {

            for (var i = 0; i < size; i++) {

                var trOdd = $('<tr>').addClass('odd');//le
                var trEven = $('<tr>').addClass('even');//chan
                matrix[i] = [];
                dataMatrix[i] = [];
                if (i % 2 !== 0) {
                    chessBoard.push(trEven);
                }
                else {
                    chessBoard.push(trOdd);
                }

                for (var j = 0; j < size; j++) {

                    var tdEle = $('<td>');
                    tdEle.addClass('cell');
                    var btn = $('<button>');
                    btn.addClass('cell btn btn-outline-primary isClick');
                    btn.css("pointer-events", "none");
                    matrix[i][j] = btn;
                    dataMatrix[i][j] = -1;
                    // btn.append("x");
                    btn.click({ vi: i, vj: j }, function (event) {
                        // var p_tag = $('<p>');
                        // console.log(matrix);
                        // clearTimeout(t1);
                        var state = '{\
                            msg_id: "game_state",\
                            name: "'+ localStorage.name_of_chess_board + '",\
                            x: '+ event.data.vi + ',\
                            y: '+ event.data.vj + '\
                        }';
                        s.send(state);
                        // if (turn % 2 == 0) {
                        //     $(this).html(maskOf_O);

                        $(this).css("pointer-events", "none", "!important");
                        for (var k = 0; k < size; k++) {
                            for (var l = 0; l < size; l++) {
                                if (dataMatrix[k][l] == -1) {
                                    matrix[k][l].css("pointer-events", "none");
                                }
                            }
                        }

                    });
                    tdEle.append(btn);
                    chessBoard[i].append(tdEle);
                }
            }


            $('tbody').append(chessBoard);
            $(".odd td:odd").css("background-color", "white");
            $(".odd td:even").css("background-color", "white");
            $(".even td:odd").css("background-color", "white");
            $(".even td:even").css("background-color", "white");

            $('#gameBoard').css({
                'border-collapse': 'collapse',
                'border': 'solid 1px black'
            });

            $('.cell').css({
                'width': '30px',
                'height': '30px',
                'background-color': 'azure',
                // 'border' : '1px solid black'

            });


        };

        function overide_channel_reload(socket) {
            var js1 = '{\
            msg_id: "overide_channel",\
            email:"'+ localStorage.email + '",\
            name: "'+ localStorage.name_of_chess_board + '"\
            }';
            socket.send(js1);

        }
        function inviteUser(channel, socket){
            var inviteUser = '{\
                msg_id: "invite_user",\
                channel: '+channel+',\
            }';
            socket.send(inviteUser);
        }
        function test(ip){
            alert(ip);
        }
    </script>


</body>