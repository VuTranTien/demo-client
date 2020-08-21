<!doctype html>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Play</title>
    <meta name="description" content="GihOt Admin">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

    <style>
        body {
            /* background-image: linear-gradient(to right, #c4e0e5, #4ca1af ); */
            background-image: linear-gradient(90deg, #74EBD5 0%, #9FACE6 100%);

        }

        td {
            border: 1px solid #000;
            
        }
        p{
            text-align: center !important;
        }

        button:hover {
            border: 3px solid blue !important;

        }
       
     
    
    </style>
</head>

<body>

    <div class="container" style="margin-top: 20px;">
        <div class="row justify-content-center ">
            <h1> Game Board </h1>
           
           
        </div><br><br>
        <div class="row justify-content-center">
            <h4 class="text-success">YOUR TURN</h4>
        </div>
        <div class="row justify-content-center" id="frame0">
            <!-- <button onclick="test()" id = "test_click">clickME</button> -->
            <table id="gameBoard">
                <tbody></tbody>
            </table>
        </div>
    </div>


    <script>
        var checkerBoard = [];
        var size = 17;
        var turn = size**2;
        var matrix =[[]];
        var maskOf_X = '<svg width="2em" height="2em" viewBox="6 6 16 16" class="bi bi-x align-center" fill="currentColor" xmlns="http://www.w3.org/2000/svg">\
                <path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z"/>\
                <path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z"/>\
                </svg>';
        // var maskOf_O = '<svg width="1.8em" height="1.8em" viewBox="0.4 0.7 45 35" class="bi bi-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">\
        //         <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>\
        //         </svg>';
        var maskOf_O = '<svg width="1.8em" height="1.8em" viewBox="0.4 0.7 45 35" class="bi bi-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">\
                        <circle cx="10" cy="10" r="10"/>\
                        </svg>';




        $(function () {

            for (var i = 0; i < size; i++) {

                var trOdd = $('<tr>').addClass('odd');//le
                var trEven = $('<tr>').addClass('even');//chan
                matrix[i]=[];
                if (i % 2 !== 0) { checkerBoard.push(trEven); }
                else { checkerBoard.push(trOdd); }

                for (var j = 0; j < size; j++) {

                    var tdEle = $('<td>');
                    tdEle.addClass('cell');
                    var btn = $('<button>');
                    btn.addClass('btn btn-light');
                    matrix[i][j] = -1;
                    // btn.append("x");
                    btn.click({vi: i,vj: j},function (event) {
                        // var p_tag = $('<p>');
                        console.log(String(matrix));
                        if(turn--%2==0){
                            $(this).html(maskOf_O);
                            matrix[event.data.vi][event.data.vj] = 0;
                        }
                        else{
                            $(this).html(maskOf_X);
                            matrix[event.data.vi][event.data.vj] = 1;
                        }
                        
                        $(this).css("pointer-events","none");        
                        console.log(matrix.toString());                
                        

                        
                    });
                    tdEle.append(btn);
                    checkerBoard[i].append(tdEle);
                }
            }

            $('tbody').append(checkerBoard);
            $(".odd td:odd").css("background-color", "white");
            $(".odd td:even").css("background-color", "white");
            $(".even td:odd").css("background-color", "white");
            $(".even td:even").css("background-color", "white");

            $('#gameBoard').css({
                'border-collapse': 'collapse',
                'border': 'solid 1px black'
            });

            $('.btn').css({
                'width': '30px',
                'height': '30px',
                'background-color': 'azure',
                // 'border' : '1px solid black'

            });


        });
        function test (){
            $('#test_click').css("pointer-events","none");
            alert("disable");

        }

    </script>

</body>