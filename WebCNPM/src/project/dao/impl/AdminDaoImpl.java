package project.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Connection.DBConnection;
import project.dao.IAdminDao;
import project.model.Admin;

public class AdminDaoImpl extends DBConnection implements IAdminDao{

	@Override
	public Admin findaccount(String id) {
		String sql = "SELECT * FROM AD_ACC INNER JOIN ADMIN ON ADMIN.ID = AD_ACC.ADMIN WHERE ACCOUNT = ?";
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Admin admin = new Admin();
				admin.setId(rs.getString("ID"));
				admin.setFullname(rs.getString("NAME"));
				return admin;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
