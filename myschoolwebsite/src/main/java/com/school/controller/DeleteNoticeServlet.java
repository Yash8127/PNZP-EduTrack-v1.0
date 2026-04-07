package com.school.controller;

import java.io.IOException;

import com.school.DAO.NoticeDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteNoticeServlet")
public class DeleteNoticeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		NoticeDAO dao = new NoticeDAO();
		dao.deleteNotice(id);

		res.sendRedirect("admin/viewNotices.jsp");
	}
}