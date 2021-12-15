package com.example.Lb7_WorkersDB;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "DatabaseConnectServlet", value = "/DatabaseConnectServlet")
public class DatabaseConnectServlet extends HttpServlet {
    @Resource(name = "jdbc/db")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter printWriter = response.getWriter();
        response.setCharacterEncoding("Windows-1251");

        try (Connection connection = dataSource.getConnection()) {
            try (PreparedStatement statement = connection.prepareStatement("select * from postgres_scheme.\"workers_lb7\" du")) {
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        printWriter.println(resultSet.getString("Номер сотрудника") + " | " +
                                resultSet.getString("Имя сотрудника") + " | " +
                                resultSet.getString("Должность сотрудника") + " | " +
                                resultSet.getString("Дата принятия на работу") + " | " +
                                resultSet.getString("Департамент"));
                    }
                    statement.close();
                }
            }
        } catch (SQLException throwables) {
            response.sendRedirect("error.jsp");
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
