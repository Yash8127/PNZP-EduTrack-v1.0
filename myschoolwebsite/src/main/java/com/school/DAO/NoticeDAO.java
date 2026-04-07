package com.school.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.school.model.Notice;
import com.school.utility.DBConnection;

public class NoticeDAO {

	public boolean addNotice(Notice n) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "INSERT INTO notice(title,description) VALUES(?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, n.getTitle());
			ps.setString(2, n.getDescription());

			int rows = ps.executeUpdate();

			if (rows > 0)
				status = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public List<Notice> getAllNotices() {

		List<Notice> list = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String sql = "SELECT * FROM notice ORDER BY id DESC";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Notice n = new Notice();

				n.setId(rs.getInt("id"));
				n.setTitle(rs.getString("title"));
				n.setDescription(rs.getString("description"));

				list.add(n);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean deleteNotice(int id) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "DELETE FROM notice WHERE id=?";

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