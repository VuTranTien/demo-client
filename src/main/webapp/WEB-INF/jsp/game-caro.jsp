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
        svg{
            margin:auto;
            padding: 0;
        }
     
    
    </style>
</head>

<body>

    <div class="container" style="margin-top: 20px;">
        <div class="row justify-content-center ">
            <h1> Game Board </h1>

        </div>
        <div class="row justify-content-center ">
            <table id="gameBoard">
                <tbody></tbody>
            </table>
        </div>
    </div>


    <script>
        var checkerBoard = [];
        var size = 20;
        var maskOf_X = '<svg width="2em" height="2em" viewBox="6 6 16 16" class="bi bi-x align-center" fill="currentColor" xmlns="http://www.w3.org/2000/svg">\
                <path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z"/>\
                <path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z"/>\
                </svg>';
        var maskOf_O = '<svg width="1.8em" height="1.8em" viewBox="0.4 0.7 45 35" class="bi bi-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">\
                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>\
                </svg>';
      
        $(function () {


            for (var i = 0; i < size; i++) {

                var trOdd = $('<tr>').addClass('odd');//le
                var trEven = $('<tr>').addClass('even');//chan

                if (i % 2 !== 0) { checkerBoard.push(trEven); }
                else { checkerBoard.push(trOdd); }

                for (var j = 0; j < size; j++) {

                    var tdEle = $('<td>');
                    tdEle.addClass('cell');
                    var btn = $('<button>');
                    btn.addClass('btn btn-light');
                    // btn.append("x");
                    btn.click(function () {
                        // btn.add
                        var p_tag = $('<p>');
                            p_tag.html(maskOf_O);
                        // $(this).html(maskOf_X);
                        $(this).append(p_tag);
                        // btn.wrap(maskOf_O);
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

            // $('td').css({
            //     'width': '30px',
            //     'height': '30px'
            // });
            $('.btn').css({
                'width': '30px',
                'height': '30px',
                'background-color': 'azure',
                // 'border' : '1px solid black'

            });
            // $('.cell').css({

            // });

        });

    </script>

</body>