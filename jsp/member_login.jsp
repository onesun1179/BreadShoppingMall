<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">

<title>Read DataBase </title>
</head>
<body>
<%@ page import = "java.sql.*, java.util.*" %>

<%
  request.setCharacterEncoding("utf-8");

  String id = request.getParameter("loginID");
  String pwd = request.getParameter("loginPWD");

  String DB_URL = "jdbc:mysql://localhost:3306/cku";
  // DB URL Format = "jdbc:mysql://'DB IP':'Connector Port'/'DB_Name'";

  String DB_USER = "cku";
  String DB_PASSWORD= "1234";

  String sql = null;
  Connection conn = null;
  Statement st = null;
  ResultSet rs = null;


  try {
    Class.forName("com.mysql.jdbc.Driver");
  } catch(ClassNotFoundException e) {
    out.println(e.getMessage());
  }
  try {
    conn = DriverManager.getConnection("jdbc:mysql://localhost/cku?serverTimezone=UTC&useUnicode=true&characterEncoding=euc-kr&User=cku&Password=1234");
    st = conn.createStatement();

    rs = st.executeQuery("select * from members where id='" + id + "' and pwd='" + pwd + "'");


    if(!(rs.next())) {
      %>
      <script>
        alert("아이디 확인");
        location.href="../sliderTest.jsp"; 
      </script>
      <%


    } else {
      %>
      <script>
        alert("로그인 성공");
        var id = "<%=id%>"; 
        location.href="../sliderTest.jsp?id="+id+""; 
        
      </script>
      <%      
    }
    st.close();
    conn.close();
  } catch(SQLException e) {
    out.println(e.getMessage());
  }
%>

