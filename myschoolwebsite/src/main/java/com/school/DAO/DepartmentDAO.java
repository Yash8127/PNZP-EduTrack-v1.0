package com.school.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.school.model.Department;
import com.school.utility.DBConnection;

public class DepartmentDAO {

	public boolean addDepartment(Department d) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "insert into Department(dept_name) values(?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, d.getDeptName());

			int n = ps.executeUpdate();

			if (n > 0)
				status = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public List<Department> getAllDepartments() {

		List<Department> list = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String sql = "select * from Department";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Department d = new Department();

				d.setDeptId(rs.getInt("dept_id"));
				d.setDeptName(rs.getString("dept_name"));

				list.add(d);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean deleteDepartment(int id) {
		boolean status = false;
		try {

			Connection con = DBConnection.getConnection();

			String sql = "delete from Department where dept_id=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, id);

			int n = ps.executeUpdate();
			if (n > 0) {
				status = true;
				;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public int getDepartmentCount() {

		int count = 0;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "SELECT COUNT(*) FROM Department";

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
