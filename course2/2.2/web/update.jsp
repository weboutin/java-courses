<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>

<% 
    String userId=request.getParameter("userId");
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/blog?useSSL=false";

    String USER = "root";
    String PASS = "root";
    Connection conn = null;
    Statement stmt = null;
    try {
        Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(DB_URL, USER, PASS);

        stmt = conn.createStatement();
        String sql;
        sql = "update user set user_name='"+username+"',password='"+password+"' where user_id="+userId;
        out.println(sql);
        stmt.executeUpdate(sql);

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
    response.sendRedirect("index.jsp");
%>