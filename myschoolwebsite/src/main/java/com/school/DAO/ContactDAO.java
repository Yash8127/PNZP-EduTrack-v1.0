package com.school.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.school.model.Contact;
import com.school.utility.DBConnection;

public class ContactDAO {

	public boolean saveContact(Contact c) {
		boolean status = false;

		try {
			Connection con = DBConnection.getConnection();

			String sql = "INSERT INTO contact(name, email, message) VALUES (?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getMessage());

			int row = ps.executeUpdate();

			if (row > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public List<Contact> getAllContacts() {
		List<Contact> list = new ArrayList<>();

		try {
			Connection con = DBConnection.getConnection();
			String sql = "SELECT * FROM contact ORDER BY id DESC";
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Contact c = new Contact();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setEmail(rs.getString("email"));
				c.setMessage(rs.getString("message"));

				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

// DELETE
	public boolean deleteContact(int id) {
		boolean status = false;

		try {
			Connection con = DBConnection.getConnection();
			String sql = "DELETE FROM contact WHERE id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);

			int row = ps.executeUpdate();
			if (row > 0)
				status = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	// PAGINATION FETCH
	public List<Contact> getContactsByPage(int start, int total) {

		List<Contact> list = new ArrayList<>();

		try {
			Connection con = DBConnection.getConnection();

			String sql = "SELECT * FROM contact ORDER BY id DESC LIMIT ?, ?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, start);
			ps.setInt(2, total);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Contact c = new Contact();

				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setEmail(rs.getString("email"));
				c.setMessage(rs.getString("message"));

				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// TOTAL COUNT
	public int getContactCount() {

		int count = 0;

		try {
			Connection con = DBConnection.getConnection();

			String sql = "SELECT COUNT(*) FROM contact";
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