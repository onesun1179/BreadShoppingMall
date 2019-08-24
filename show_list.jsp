<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
        <center>
    <%
        ArrayList<String> arr =(ArrayList)(session.getAttribute("arr"));
        if(arr==null){
            %>
            <script>
                alert("장바구니에 상품이 없습니다.");
                history.go(-1);
            </script>
            <%
        }
    %>

    
    상품 목록<br><hr>
    <table>
        <tr>
            <th>순번</th>
            <th>이름</th>
            <th>가격</th>
            <th>개수</th>
            <th>합계</th>
        </tr>    
    <%
        int count = 0;
        int total_sum = 0;
        for(String i : arr ){
            if(i.charAt(i.length()-1) == ',') {
                i += "1";
                
            }
            String[] str = i.split(",");
            count++;
            
            int sum = Integer.parseInt(str[1]) * Integer.parseInt(str[2]);
            total_sum += sum;
        %>
            <tr id=<%=count%>>
                <td><%=count%></td><td><%=str[0]%></td><td><%=str[1]%></td><td><%=str[2]%></td><td><%=sum%></td><td><button onclick='remove_tr("<%=count%>")' value="<%=count%>">삭제</button></td>                
            </tr>
            
       <%
       
        }
        %>
        <tr >
                <td colspan="5">총 합계 : <%=total_sum%></td>                
            </tr>
        <%
    %>
</table>
    <br>
    
    <input type="button" value="돌아가기" onClick="location.href='sliderTest.jsp'">

    </form>
    </center>
</body>
</html>
<style>
    table {
        text-align: center;
    }
</style>

<script>
        function remove_tr(num) {
            var elem = document.getElementById(num);            
            
            elem.parentNode.removeChild(elem);
            location.href = 'remove_content.jsp?num='+num+'';
        }
</script>

    
