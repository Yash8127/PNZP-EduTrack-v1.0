package com.school.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

import com.school.DAO.FeesDAO;
import com.school.model.Fees;

@WebServlet("/FeesServlet")
public class FeesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int studentId = Integer.parseInt(req.getParameter("studentId"));
		double amount = Double.parseDouble(req.getParameter("amount"));
		String date = req.getParameter("feeDate");
		String status = req.getParameter("status");

		Fees f = new Fees();

		f.setStudentId(studentId);
		f.setAmount(amount);
		f.setFeeDate(date);
		f.setStatus(status);

		FeesDAO dao = new FeesDAO();

		if (dao.addFees(f)) {

			res.sendRedirect("fees/viewFees.jsp?msg=added");

		} else {

			res.sendRedirect("fees/viewFees.jsp?msg=error");

		}

	}

}