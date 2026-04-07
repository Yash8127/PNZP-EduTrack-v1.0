package com.school.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

import com.school.DAO.TeacherDAO;
import com.school.model.Teacher;

@WebServlet("/TeacherServlet")
public class TeacherServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String name = req.getParameter("teacherName");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String hireDate = req.getParameter("hireDate");
		int deptId = Integer.parseInt(req.getParameter("deptId"));

		Teacher t = new Teacher();

		t.setTeacherName(name);
		t.setPhone(phone);
		t.setEmail(email);
		t.setHireDate(hireDate);
		t.setDeptId(deptId);

		TeacherDAO dao = new TeacherDAO();

		if (dao.addTeacher(t)) {

			res.sendRedirect("teacher/viewTeachers.jsp?msg=added");

		} else {

			res.sendRedirect("teacher/viewTeachers.jsp?msg=error");

		}

	}

}