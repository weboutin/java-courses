<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>

<%
final class DB {
    private String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    private String DB_URL = "jdbc:mysql://localhost:3306/blog?useSSL=false";

    private String USER = "root";
    private String PASS = "root";

    private Connection conn = null;

    public synchronized Connection getConn() {
        try {
            Class.forName(JDBC_DRIVER);
            if (conn == null) {
                conn = DriverManager.getConnection(DB_URL, USER, PASS);
            }
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
%>