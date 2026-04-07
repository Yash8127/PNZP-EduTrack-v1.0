package com.school.controller;

import java.io.IOException;

import com.school.DAO.NoticeDAO;
import com.school.model.Notice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/NoticeServlet")
public class NoticeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String title = req.getParameter("title");
		String desc = req.getParameter("description");

		Notice n = new Notice();

		n.setTitle(title);
		n.setDescription(desc);

		NoticeDAO dao = new NoticeDAO();

		if (dao.addNotice(n)) {

			res.sendRedirect("admin/viewNotices.jsp?msg=added");

		} else {

			res.sendRedirect("admin/addNotice.jsp?msg=error");

		}
	}
}