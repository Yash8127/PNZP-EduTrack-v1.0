package com.school.DAO;

import java.sql.*;
import java.util.*;

import com.school.model.Exam;
import com.school.utility.DBConnection;

public class ExamDAO {

	public boolean addExam(Exam e) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "INSERT INTO Exam(exam_name,exam_date) VALUES(?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, e.getExamName());
			ps.setString(2, e.getExamDate());

			int rows = ps.executeUpdate();

			if (rows > 0)
				status = true;

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public List<Exam> getAllExams() {

		List<Exam> list = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String sql = "SELECT * FROM Exam";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Exam e = new Exam();

				e.setExamId(rs.getInt("exam_id"));
				e.setExamName(rs.getString("exam_name"));
				e.setExamDate(rs.getString("exam_date"));

				list.add(e);

			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return list;

	}

	public boolean deleteExam(int id) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "DELETE FROM Exam WHERE exam_id=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, id);

			int rows = ps.executeUpdate();

			if (rows > 0)
				status = true;

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;

	}

}