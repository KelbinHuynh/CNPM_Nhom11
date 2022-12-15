package project.dao.impl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.DBConnection;
import project.dao.IAccountDao;
import project.model.Account;
import project.service.IAdminService;
import project.service.ILecturerService;
import project.service.IStudentService;
import project.service.impl.AdminServiceImpl;
import project.service.impl.LecturerServiceImpl;
import project.service.impl.StudentServiceImpl;


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
				IStudentService stservice = new StudentServiceImpl();
				account.setStudent(stservice.findaccount(rs.getString("ID")));
				
				ILecturerService leservice = new LecturerServiceImpl();
				account.setLecturer(leservice.findaccount(rs.getString("ID")));
				
				IAdminService adservice = new AdminServiceImpl();
				account.setAdmin(adservice.findaccount(rs.getString("ID")));
				
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

	@Override
	public List<Account> findAll() {
		List<Account> accountList = new ArrayList<Account>();
		String sql = "SELECT * FROM ACCOUNT";
		try {
			conn = new DBConnection().getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {				
				Account account = new Account();
				IStudentService stservice = new StudentServiceImpl();
				account.setStudent(stservice.findaccount(rs.getString("ID")));
				
				ILecturerService leservice = new LecturerServiceImpl();
				account.setLecturer(leservice.findaccount(rs.getString("ID")));
				
				IAdminService adservice = new AdminServiceImpl();
				account.setAdmin(adservice.findaccount(rs.getString("ID")));
				
				account.setId(rs.getString("ID"));
				account.setUsername(rs.getString("USERNAME"));
				account.setPassword(rs.getString("PASSWORD"));
				account.setRole(rs.getInt("ROLE"));
				
				accountList.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return accountList;
	}
	
	
}
