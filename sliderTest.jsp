<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html>

<head>
  <meta content='IE=edge' http-equiv='X-UA-Compatible'>
  <meta charset='utf-8'>
  <meta content='width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0' name='viewport'>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>simpler-sidebar dynamic-left</title>
  <script src=sidebar.js></script>
  <link href='https://cdnjs.cloudflare.com/ajax/libs/normalize/3.0.3/normalize.min.css' rel='stylesheet' type='text/css'>
  <link href='assets/style.css' rel='stylesheet' type='text/css'>


          <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">


  <script type="text/javascript">


    // 주소창 자동 닫힘
    window.addEventListener("load", function() {
      setTimeout(loaded, 100);
    }, false);

    function loaded() {
      window.scrollTo(0, 1);
    }
  </script>
  <!--[if lt IE 9]>
      <script src='https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js'></script>
    <![endif]-->
</head>

<body>
    <div id="page">

        <div id="main">
       <div class="slider_img">
        <div ><img class="simg"src="images/bread_main/bread1.jpg"  alt="빵1"></div>
        <div ><img class="simg"src="images/bread_main/bread2.jpg" alt="빵1"></div>
        <div ><img class="simg"src="images/bread_main/bread3.jpg"  alt="빵1"></div>
        <div ><img class="simg"src="images/bread_main/bread4.jpg" alt="빵1"></div>
    </div>
   <p><img src="images/bread_main/logo.JPG" alt="로고"></p>
        </div>

        <div id="article">
              <article>

  </article>
        </div>



    <center>
        <link href="https://fonts.googleapis.com/css?family=Single+Day&display=swap" rel="stylesheet">
  <form id="bread_output_form" action="./jsp/bread_output.jsp" target="bread_list" method="post">
    <button class="submit2_button" name="bread_type_button" type="submit" value="0">전체보기</button>
    <button class="submit2_button"name="bread_type_button" type="submit" value="1">발효빵</button>
    <button class="submit2_button"name="bread_type_button" type="submit" value="2">무발효빵</button>
    <button class="submit2_button"name="bread_type_button" type="submit" value="3">빵을 이용한<br> 2차 가공</button>
    <button class="submit2_button"onclick="location.href='show_list.jsp'">장바구니<br> 보기</button>
  </form>
</center>
  <style>


form#bread_output_form {
  align-items: center;
  justify-content: center;
}

button.submit2_button {
  display: inline;
  width : 17%;
  height : 100%;
  font-family: 'Single Day', cursive;
  font-size: 1em;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: sandybrown;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

button.submit2_button:hover {
  background-color: goldenrod;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}
  </style>





    </div>

        <iframe id="bread_list_iframe"  name="bread_list" src="jsp/bread_output.jsp"  frameborder="0" onload="iframeAutoResize(this)"scrolling="no" ></iframe>



<style type="text/css">

  </style>



  <script type="text/javascript">

  function iframeAutoResize(h){
  if(h == null){
  return false;
  }
  (h).height = "0px";
   var iframeHeight= (h).contentWindow.document.body.scrollHeight;
   (h).height=iframeHeight + 15;
  }




</script>


  <div class='main-navbar main-navbar-fixed-top' id='main-navbar'>
    <div class='main-navbar-content'>
      <div class='icon left' id='toggle-sidebar'>
        <img alt='menu' height='24px' src='assets/menu32@64.png' width='24px'>
      </div>
    </div>
  </div>
  <!-- div#main-navbar -->
  <div class='main-sidebar main-sidebar-left' id='main-sidebar'>

    <div class='main-sidebar-wrapper' id='main-sidebar-wrapper'></div>


  </div>
  <!-- div#main-sidebar -->
  <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>
  <script src='https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js'></script>
  <script src='simple-sidebar/dist/jquery.simple-sidebar.min.js'></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  <script>








      function getParam(key){
          var _parammap = {};
          document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function () {
              function decode(s) {
                  return decodeURIComponent(s.split("+").join(" "));
              }

              _parammap[decode(arguments[1])] = decode(arguments[2]);
          });

          return _parammap[key];
      };

      var connect_url;

      if(getParam("id")==undefined) {
        connect_url = 'ajax/sidebar.html';
      } else {
        connect_url = 'ajax/sidebar.html?id='+getParam("id");
      }




      $(document).ready(function() {
        $('#bread_output_form_default').submit(function() {  return false; });
        $(document).ready(function(){
              $('.slider_img').bxSlider({
                   auto:true,
         controls:false
                 });
            });
        $.ajaxSetup({
          cache: false
        });




        $('#main-sidebar-wrapper').load(connect_url, function() {
          $('#main-sidebar').simpleSidebar({
            wrapper: '#main',
            opener: '#toggle-sidebar',
            animation: {
              easing: 'easeOutQuint'
            },
            sidebar: {
              align: 'left',
              closingLinks: '.close-sb'
            },
            sbWrapper: {
              display: false
            }
          });
        });
      });
    </script>
</body>

</html>
<!-- <script>

</script>-->