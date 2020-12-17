<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>

<%@ include file="db.jsp" %>
<html>

<body>
    <%
        DB db = new DB();
        Connection conn = db.getConn();
        Statement stmt = conn.createStatement();
        String sql = "SELECT * FROM user";
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            int userId = rs.getInt("user_id");
            String username = rs.getString("user_name");
            String password = rs.getString("password");
            out.println("<br>");
            out.println(username);
        }
    %>
</body>

</html>