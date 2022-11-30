package project.dao.impl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;


import Connection.DBConnection;
import project.dao.IAccountDao;
import project.model.Account;


public class AccountDaoImpl extends DBConnection implements IAccountDao{
	
	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;

	@Override
	public Account findbyUsername(String username) {
		String sql = "SELECT * FROM ACCOUNT WHERE USERNAME = ?";
		try {
			conn = new DBConnection().getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				Account account = new Account();
				account.setId(rs.getString("ID"));
				account.setUsername(rs.getString("USERNAME"));
				account.setPassword(rs.getString("PASSWORD"));
				account.setRole(rs.getInt("ROLE"));
				return account;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean checkExistUsername(String username) {
		boolean duplicate = false;
		String query = "select * from ACCOUNT where USERNAME = ?";
		try {
			conn = new DBConnection().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				duplicate = true;
			}
			ps.close();
			conn.close();
		} catch (Exception ex) {
		}
		return duplicate;
	}
	
	
}
