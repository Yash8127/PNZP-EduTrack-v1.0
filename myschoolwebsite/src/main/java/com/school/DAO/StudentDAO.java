package com.school.DAO;

import java.sql.*;
import java.util.*;

import com.school.model.*;
import com.school.utility.*;

public class StudentDAO {

	/* ADD STUDENT */

	public boolean addStudent(Student s) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "INSERT INTO Student(student_name,gender,age,phone,address,class_id,admission_date) VALUES(?,?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, s.getStudentName());
			ps.setString(2, s.getGender());
			ps.setInt(3, s.getAge());
			ps.setString(4, s.getPhone());
			ps.setString(5, s.getAddress());
			ps.setInt(6, s.getClassId());
			ps.setString(7, s.getAdmissionDate());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;

	}

	/* VIEW STUDENTS (JOIN WITH CLASSES) */

	public List<Student> getAllStudents() {

		List<Student> list = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String sql = "SELECT s.*,c.class_name FROM Student s " + "JOIN Classes c ON s.class_id = c.class_id";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Student s = new Student();

				s.setStudentId(rs.getInt("student_id"));
				s.setStudentName(rs.getString("student_name"));
				s.setGender(rs.getString("gender"));
				s.setAge(rs.getInt("age"));
				s.setPhone(rs.getString("phone"));
				s.setAddress(rs.getString("address"));
				s.setClassId(rs.getInt("class_id"));
				s.setClassName(rs.getString("class_name"));
				s.setAdmissionDate(rs.getString("admission_date"));

				list.add(s);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	/* DELETE STUDENT */

	public boolean deleteStudent(int id) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "DELETE FROM Student WHERE student_id=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, id);

			int rows = ps.executeUpdate();

			if (rows > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;

	}

	/* COUNT STUDENTS (FOR DASHBOARD) */

	public int getStudentCount() {

		int count = 0;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "SELECT COUNT(*) FROM Student";

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

	public List<Student> getStudentsByClass(int classId) {

		List<Student> list = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String sql = "SELECT * FROM Student WHERE class_id=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, classId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Student s = new Student();

				s.setStudentId(rs.getInt("student_id"));
				s.setStudentName(rs.getString("student_name"));

				list.add(s);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

}