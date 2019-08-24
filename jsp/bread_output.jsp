<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<meta content='width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0' name='viewport'>
<link rel="stylesheet" href="../assets/bread_list.css">


<title>Read DataBase </title>
<style>
   @import url('https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap');

   body{
      margin: 0px;
      font-family: 'Nanum Pen Script', cursive;
      font-size: 30px;
   }
   .add{
      font-family: Arial, Helvetica, sans-serif;
      width: 10%;
      font-size: 14px;
      color: #ffffff;
      padding: 10px 20px;
      background: -moz-linear-gradient(
      top,
      #ffe4d6 0%,
      #f59a6a 20%,
      #b86233 56%,
      #ffac7f 94%,
      #ffab7d);
      background: -webkit-gradient(
      linear, left top, left bottom,
      from(#ffe4d6),
      color-stop(0.20, #f59a6a),
      color-stop(0.56, #b86233),
      color-stop(0.94, #ffac7f),
      to(#ffab7d));
      -moz-border-radius: 7px;
      -webkit-border-radius: 7px;
      border-radius: 7px;
      border: 1px solid #c77c54;
      -moz-box-shadow:
      0px 3px 0px rgba(171,074,022,1),
      inset 0px 1px 1px rgba(255,255,255,1);
      -webkit-box-shadow:
      0px 3px 0px rgba(171,074,022,1),
      inset 0px 1px 1px rgba(255,255,255,1);
      box-shadow:
      0px 3px 0px rgba(171,074,022,1),
      inset 0px 1px 1px rgba(255,255,255,1);
      text-shadow:
      0px -1px 0px rgba(097,042,012,0.5),
      0px 1px 0px rgba(255,255,255,0.3);

   }
   .add:hover{
      border: 1px solid;
      box-shadow: inset 0 0 20px rgba(255, 255, 255, 0.5), 0 0 20px rgba(255, 255, 255, 0.2);
      outline-color: rgba(255, 255, 255, 0);
      outline-offset: 15px;
      text-shadow: 1px 1px 2px #427388;
   }
   input[name=count]{
      border-radius : 3px;
      border: 2px solid black;
   }
</style>
<script>
  String.prototype.trim = function() { return this.replace(/^\s+|\s+$/g,""); }


function output_bread(num, name, imgType, type, price){

    var div = document.createElement("div");
    div.id = "bread" + num;
    div.setAttribute("class", "bread");

    switch(type) {
      case "1" : type = "발효빵"; break;
      case "2" : type = "무발효빵"; break;
      case "3" : type = "빵을 이용한 2차 가공"; break;
    }
    div.innerHTML = "<form action='add.jsp'><img src='../images/"+type+"/"+num+"."+imgType+"' ' /><span class='name' id='name"+num+"'>"+name+
      "</span><span class='type' id='type"+num+"'>"+type+"</span><span class='price' id='price"+num+"'>"+ price+
      "<input type='hidden' name='name' value='"+name+"' /><input type='hidden' name='price' value='"+price+"' /><input type='hidden' name='type' value='"+type+
      "' /></span><input type='text' class='count' name='count'id='count"+num+"' placeholder='수량'><input type='submit' class='add' value='add'></form>";

    document.getElementById('bread_list').appendChild(div);
}







</script>

</head>
<body>


  <div id="bread_list"></div>


<%
  request.setCharacterEncoding("utf-8");


  String type_num = request.getParameter("bread_type_button");

  String DB_URL = "jdbc:mysql://localhost:3306/cku";

  String DB_USER = "cku";
  String DB_PASSWORD= "1234";

  String sql = null;
  Connection conn = null;
  Connection conn_default = null;
  Statement st = null;
  ResultSet rs = null;

  try {
    Class.forName("com.mysql.jdbc.Driver");
  } catch(ClassNotFoundException e) {
    out.println(e.getMessage());
  }
  try {
    conn = DriverManager.getConnection("jdbc:mysql://localhost/cku?serverTimezone=UTC&useUnicode=true&characterEncoding=euc-kr&User=cku&Password=1234");
    // conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    st = conn.createStatement();

    if("0".equals(type_num) || type_num==null) {
      rs = st.executeQuery("select * from breads");

    } else {
      rs = st.executeQuery("select * from breads where type='" + type_num + "'");
    }


    while((rs.next())) {
        String num = rs.getString("num");
        String name = rs.getString("name");
        String imgType = rs.getString("imgType");
        String type = rs.getString("type");
        String price = rs.getString("price");
        %>

        <script>
            output_bread("<%=num%>", "<%=name%>", "<%=imgType%>", "<%=type%>", "<%=price%>");

        </script>



        <%
    }
      st.close();
      conn.close();
  } catch(SQLException e) {
    out.println(e.getMessage());
  }

%>
