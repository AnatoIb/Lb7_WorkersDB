<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Поиск по имени</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div style="text-align: center;">
    <table border="1">
        <%
            response.setCharacterEncoding("Windows-1251");

            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            try {
                Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres",
                        "postgres", "postgres");

                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("select * from postgres_scheme.\"workers_lb7\" du where \"Имя сотрудника\"" +
                        " = '" + request.getParameter("inputName") + "'");

                while (resultSet.next()) {
        %>
        <tr>
            <td><%= resultSet.getString("Номер сотрудника")%>
            </td>
            <td><%= resultSet.getString("Имя сотрудника")%>
            </td>
            <td><%= resultSet.getString("Должность сотрудника")%>
            </td>
            <td><%= resultSet.getString("Дата принятия на работу")%>
            </td>
            <td><%= resultSet.getString("Департамент")%>
            </td>
        </tr>
        <%
                }

                statement.close();
            } catch (SQLException throwables) {
                response.sendRedirect("error.jsp");
                throwables.printStackTrace();
            }
        %>
    </table>
</div>
</body>
</html>
