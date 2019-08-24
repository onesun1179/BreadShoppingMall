<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <%
    try {
        String num = request.getParameter("num");
        ArrayList<String> arr =(ArrayList)(session.getAttribute("arr"));

         arr.remove(Integer.parseInt(num)-1);
         session.setAttribute("arr", arr);
    } catch(NumberFormatException e) {

    }
   %>
   <script>location.href = "show_list.jsp"; </script>


</body>
</html>