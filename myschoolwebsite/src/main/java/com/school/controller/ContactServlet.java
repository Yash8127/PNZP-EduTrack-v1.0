package com.school.controller;

import java.io.IOException;

import com.school.DAO.ContactDAO;
import com.school.model.Contact;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String message = request.getParameter("message");

		Contact c = new Contact();
		c.setName(name);
		c.setEmail(email);
		c.setMessage(message);

		ContactDAO dao = new ContactDAO();

		if (dao.saveContact(c)) {
			response.sendRedirect("contact.jsp?success=true");
		} else {
			response.sendRedirect("contact.jsp?error=true");
		}
	}
}