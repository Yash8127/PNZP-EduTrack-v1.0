package com.school.DAO;

import java.sql.*;
import java.util.*;

import com.school.model.Teacher;
import com.school.utility.DBConnection;

public class TeacherDAO {

	public boolean addTeacher(Teacher t) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "INSERT INTO Teacher(teacher_name,phone,email,hire_date,dept_id) VALUES(?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, t.getTeacherName());
			ps.setString(2, t.getPhone());
			ps.setString(3, t.getEmail());
			ps.setString(4, t.getHireDate());
			ps.setInt(5, t.getDeptId());

			int rows = ps.executeUpdate();

			if (rows > 0)
				status = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public List<Teacher> getAllTeachers() {

		List<Teacher> list = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String sql = "SELECT t.*,d.dept_name FROM Teacher t " + "JOIN Department d ON t.dept_id=d.dept_id";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Teacher t = new Teacher();

				t.setTeacherId(rs.getInt("teacher_id"));
				t.setTeacherName(rs.getString("teacher_name"));
				t.setPhone(rs.getString("phone"));
				t.setEmail(rs.getString("email"));
				t.setHireDate(rs.getString("hire_date"));
				t.setDeptName(rs.getString("dept_name"));

				list.add(t);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean deleteTeacher(int id) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "DELETE FROM Teacher WHERE teacher_id=?";

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

	public int getTeacherCount() {

		int count = 0;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "SELECT COUNT(*) FROM Teacher";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

}