<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">

<title>Read DataBase </title>
</head>
<body>
    <div id="shopping_cart_div">
        <span>바구니</span>
    </div>
    <%@ page import = "java.sql.*, java.util.*" %>
<%
request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
String type = request.getParameter("type");
String price = request.getParameter("price");


%>

<script>
    var count=0;
    function add_shopping_cart(name, type, price) {

       var div = document.createElement("div");
        div.id = count + "added_bread";
        div.innerHTML = "<span>"+count.toString()+name+"</span><span>"+type+"</span><span>"+price+"원</span>";
        document.getElementById('shopping_cart_div').appendChild(div);
        count++;
    }

    add_shopping_cart("<%=name%>", "<%=type%>", "<%=price%>");

    document.write(count++);
    document.write("ddd");
</script>

</body>
</html>
