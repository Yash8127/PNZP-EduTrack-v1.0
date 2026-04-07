package com.school.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.school.model.Student;
import com.school.model.Subject;
import com.school.utility.DBConnection;

public class SubjectDAO {

	public boolean addSubject(Subject s) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "INSERT INTO Subject(subject_name,teacher_id,class_id) VALUES(?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, s.getSubjectName());
			ps.setInt(2, s.getTeacherId());
			ps.setInt(3, s.getClassId());

			int rows = ps.executeUpdate();

			if (rows > 0)
				status = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public List<Subject> getAllSubjects() {

		List<Subject> list = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String sql = "SELECT s.*,t.teacher_name,c.class_name " + "FROM Subject s "
					+ "JOIN Teacher t ON s.teacher_id=t.teacher_id " + "JOIN Classes c ON s.class_id=c.class_id";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Subject s = new Subject();

				s.setSubjectId(rs.getInt("subject_id"));
				s.setSubjectName(rs.getString("subject_name"));
				s.setTeacherName(rs.getString("teacher_name"));
				s.setClassName(rs.getString("class_name"));

				list.add(s);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public boolean deleteSubject(int id) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "DELETE FROM Subject WHERE subject_id=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, id);

			int rows = ps.executeUpdate();

			if (rows > 0)
				status = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;

	}

}