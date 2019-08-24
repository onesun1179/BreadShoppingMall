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

  String id = request.getParameter("joinID");
  String pwd = request.getParameter("joinPWD");

  String DB_URL = "jdbc:mysql://localhost:3306/cku";
  // DB URL Format = "jdbc:mysql://'DB IP':'Connector Port'/'DB_Name'";

  String DB_USER = "cku";
  String DB_PASSWORD= "1234";

  String sql = null;
  Connection conn = null;
  Statement st = null;
  ResultSet rs = null;
  int cnt = 0;

  try {
    Class.forName("com.mysql.jdbc.Driver");
  } catch(ClassNotFoundException e) {
    out.println(e.getMessage());
  }
  try {
    conn = DriverManager.getConnection("jdbc:mysql://localhost/cku?serverTimezone=UTC&useUnicode=true&characterEncoding=euc-kr&User=cku&Password=1234");
    st = conn.createStatement();
    out.println(id + pwd);
    rs = st.executeQuery("select * from members where id='" + id + "'");

    if(!(rs.next())) {
      sql="insert into members(id,pwd) values('"+ id +"','"+ pwd +"')";

      cnt = st.executeUpdate(sql);
      if (cnt >0) {
        %>
        <script type="text/javascript">
          alert("회원가입 성공");
          location.href="../sliderTest.jsp"; 
        </script>
        <%
      } else {
        %>
        <script type="text/javascript">
          alert("회원가입 실패");
          location.href="../sliderTest.jsp"; 
        </script>
        <%
      }                       
    } else {
      %>
      <script type="text/javascript">
        alert("이미 등록된 id");
        location.href="../sliderTest.jsp"; 
      </script>
      <%
    }
      st.close();
      conn.close();

  } catch(SQLException e) {
    out.println(e.getMessage());
  }
%>



