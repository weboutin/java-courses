<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<html>

<body>
    <h2>数据列表</h2>
        <%
        String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost:3306/blog?useSSL=false";
        String USER = "root";
        String PASS = "root";
        Connection conn = null;
        Statement stmt = null;

        String query = request.getParameter("username");

        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            stmt = conn.createStatement();
            String sql;
            sql = "SELECT * FROM user";
            if (query != null && query.length() > 0) {
                sql = sql + " where user_name='" + query + "'";
            }
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int userId = rs.getInt("user_id");
                String username = rs.getString("user_name");
                String password = rs.getString("password");
        %>
        <form action="update.jsp" method="post">
            <input type="hidden" name="userId" value="<%=userId%>" />
            <p>username: <input type="text" name="username" value="<%=username%>" /></p>
            <p>password: <input type="text" name="password" value="<%=password%>" /></p>
            <input type="submit" value="update" />
        </form>
        <form action="remove.jsp" method="post">
            <input type="hidden" name="userId" value="<%=userId%>" />
            <input type="submit" value="delete" />
        </form>
        <%
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
                se2.printStackTrace();
            }
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }            
        %>
    <hr>
    <h2>用户名搜索</h2>
    <form action="index.jsp" method="get">
        <p>username: <input type="text" name="username" /></p>
        <input type="submit" value="search" />
    </form>
    <form action="index.jsp" method="get">
        <input type="hidden" name="username" />
        <input type="submit" value="refresh" />
    </form>

    <hr>
    <h2>创建数据</h2>
    <form action="create.jsp" method="post">
        <p>username: <input type="text" name="username" /></p>
        <p>password: <input type="text" name="password" /></p>
        <input type="submit" value="create" />
    </form>
</body>

</html>