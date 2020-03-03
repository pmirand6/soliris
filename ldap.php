<!DOCTYPE html>
<html>
<head>
  <title>Webslesson Tutorial | Search HTML Table Data by using JQuery</title>
  <script type="text/javascript" src="resources/JQuery/jquery-2.1.3.min.js"></script>
</head>
<body>
 <form action="" method="post">
    <input id="city" name="city" type="text" onkeyup="getResults(this.value)"/>
    <input type="text" id="result" value=""/>
    <select id="myselect" name="myselect" ><option selected="selected">blank</option></select>
</form>
</div>
<script>
    function getResults(str) {
      $.ajax({
        url:'https://192.168.0.106/u_ad_js/',
        type: "GET",
        crossDomain: true,
        contentType: 'application/json',
        data: 'q=' + str,
        success: function( json ) {
           $.each(json, function(i, optionHtml){
              $('#myselect').append(optionHtml);
          });
       }
   });
  };
</script>
</body>
</html>



