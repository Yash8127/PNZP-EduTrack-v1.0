package com.school.controller;

import java.io.IOException;

import com.school.DAO.StudentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		StudentDAO dao = new StudentDAO();


		if (dao.deleteStudent(id)) {

			res.sendRedirect("student/viewStudents.jsp?msg=deleted");

		} else {

			res.sendRedirect("student/viewStudents.jsp?msg=error");

		}

	}

}
