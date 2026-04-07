package com.school.controller;

import java.io.IOException;
import com.school.DAO.StudentDAO;
import com.school.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String name = req.getParameter("studentName");
		String gender = req.getParameter("gender");
		int age = Integer.parseInt(req.getParameter("age"));
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		int classId = Integer.parseInt(req.getParameter("classId"));
		String date = req.getParameter("admissionDate");

		Student s = new Student();

		s.setStudentName(name);
		s.setGender(gender);
		s.setAge(age);
		s.setPhone(phone);
		s.setAddress(address);
		s.setClassId(classId);
		s.setAdmissionDate(date);

		StudentDAO dao = new StudentDAO();

		if (dao.addStudent(s)) {

			res.sendRedirect("student/viewStudents.jsp?msg=added");

		} else {

			res.sendRedirect("student/addStudent.jsp?msg=error");

		}

	}
}