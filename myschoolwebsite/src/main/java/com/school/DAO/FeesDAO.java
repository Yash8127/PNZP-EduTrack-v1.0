package com.school.DAO;

import java.sql.*;
import java.util.*;

import com.school.model.Fees;
import com.school.utility.DBConnection;

public class FeesDAO {

	public boolean addFees(Fees f) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "INSERT INTO Fees(student_id,amount,payment_date,status) VALUES(?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, f.getStudentId());
			ps.setDouble(2, f.getAmount());
			ps.setString(3, f.getFeeDate());
			ps.setString(4, f.getStatus());

			int rows = ps.executeUpdate();

			if (rows > 0)
				status = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public List<Fees> getAllFees() {

		List<Fees> list = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String sql = "SELECT f.*,s.student_name FROM Fees f " + "JOIN Student s ON f.student_id=s.student_id";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Fees f = new Fees();

				f.setFeeId(rs.getInt("fee_id"));
				f.setStudentName(rs.getString("student_name"));
				f.setAmount(rs.getDouble("amount"));
				f.setFeeDate(rs.getString("payment_date"));
				f.setStatus(rs.getString("status"));

				list.add(f);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public boolean deleteFees(int id) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "DELETE FROM Fees WHERE fee_id=?";

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