<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<html>

<body>
    <h2>
        <% 
    String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/blog?useSSL=false";

    out.println("Index"); 
    String USER = "root";
    String PASS = "root";
    Connection conn = null;
        Statement stmt = null;
        try {
            // 注册 JDBC 驱动
            Class.forName(JDBC_DRIVER);

            // 打开链接
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // 执行查询
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT * FROM user";
            ResultSet rs = stmt.executeQuery(sql);

            // 展开结果集数据库
            while (rs.next()) {
                // 通过字段检索
                int userId = rs.getInt("user_id");
                String username = rs.getString("user_name");
                String password = rs.getString("password");
                // 输出数据
        %>
    <form action="update.jsp" method="post">
        <input type="hidden" name="userId" value="<%=userId%>"/>
        <p>username: <input type="text" name="username" value="<%=username%>"/></p>
        <p>password: <input type="text" name="password" value="<%=password%>"/></p>
        <input type="submit" value="update" />
    </form>
    <form action="remove.jsp" method="post">
        <input type="hidden" name="userId" value="<%=userId%>"/>
        <input type="submit" value="delete" />
    </form>
        <%
            }
            // 完成后关闭
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            // 处理 JDBC 错误
            se.printStackTrace();
        } catch (Exception e) {
            // 处理 Class.forName 错误
            e.printStackTrace();
        } finally {
            // 关闭资源
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
            } // 什么都不做
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
%>
    </h2>

    <form action="create.jsp" method="post">
        <p>username: <input type="text" name="username" /></p>
        <p>password: <input type="text" name="password" /></p>
        <input type="submit" value="create" />
    </form>
</body>

</html>