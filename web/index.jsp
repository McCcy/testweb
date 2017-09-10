<%--
  Created by IntelliJ IDEA.
  User: ccy
  Date: 2017/7/21
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>生成二维码</title>
      <script type="text/javascript" src="js/jquery.js"></script>
      <script type="text/javascript" src="js/jquery.qrcode.min.js"></script>
  </head>
  <body>
    <h1 style="text-align: center"> This is ccy and pbh first Web!! </h1>
  <div style="margin-left:30% ">

       <input style="width: 50%" name="content" value="" placeholder="请输入您要生成二维码的内容"/>&nbsp;&nbsp;
      <button>生成二维码</button>
  </div>
    <div id="qrcode" style="margin-left:40%;margin-top: 10px"></div>
  <script>
//      function createCode() {
//          var content = $('input[name="content"]').val();
//          if(content!=""){
//              $('#qrcode').qrcode(content);
//          }else {
//              alert("请输入内容");
//          }
//      }
$(document).ready(function(){
    $("button").click(function(){

        var content = $('input[name="content"]').val();
          if(content!=""){
              $("#qrcode").empty();
              $('#qrcode').qrcode(utf16to8(content));

          }else{
              alert("请输入内容");
          }
    });
});

function utf16to8(str) {
  var out, i, len, c;
  out = "";
  len = str.length;
  for(i = 0; i < len; i++) {
    c = str.charCodeAt(i);
    if ((c >= 0x0001) && (c <= 0x007F)) {
      out += str.charAt(i);
    } else if (c > 0x07FF) {
      out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
      out += String.fromCharCode(0x80 | ((c >>  6) & 0x3F));
      out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));
    } else {
      out += String.fromCharCode(0xC0 | ((c >>  6) & 0x1F));
      out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));
    }
  }
  return out;
}

  </script>
  </body>
</html>
