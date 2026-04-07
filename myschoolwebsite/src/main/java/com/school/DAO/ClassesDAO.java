package com.school.DAO;

import java.sql.*;
import java.util.*;

import com.school.model.Classes;
import com.school.utility.DBConnection;

public class ClassesDAO {

	public boolean addClass(Classes c) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "insert into Classes(class_name,section,dept_id) values(?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, c.getClassName());
			ps.setString(2, c.getSection());
			ps.setInt(3, c.getDeptId());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public List<Classes> getAllClasses() {

		List<Classes> list = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String sql = "SELECT c.class_id, c.class_name, c.section, d.dept_name "
					+ "FROM Classes c JOIN Department d ON c.dept_id = d.dept_id";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Classes c = new Classes();

				c.setClassId(rs.getInt("class_id"));
				c.setClassName(rs.getString("class_name"));
				c.setSection(rs.getString("section"));
				c.setDepartmentName(rs.getString("dept_name"));

				list.add(c);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public boolean deleteClass(int id) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "delete from Classes where class_id=?";

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
	public int getClassesCount(){

		int count = 0;

		try{

		Connection con = DBConnection.getConnection();

		String sql = "SELECT COUNT(*) FROM Classes";

		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();

		if(rs.next()){
		count = rs.getInt(1);
		}

		}catch(Exception e){
		e.printStackTrace();
		}

		return count;

		}
}
