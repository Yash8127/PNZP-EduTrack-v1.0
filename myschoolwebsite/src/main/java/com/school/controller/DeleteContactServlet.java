package com.school.controller;

import java.io.IOException;

import com.school.DAO.ContactDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteContactServlet")
public class DeleteContactServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		ContactDAO dao = new ContactDAO();
		dao.deleteContact(id);

		response.sendRedirect("contact/messages.jsp");
	}
}
