package project.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.DBConnection;
import project.dao.ILecturerDao;
import project.model.Lecturer;

public class LecturerDaoImpl extends DBConnection implements ILecturerDao{

	@Override
	public Lecturer findaccount(String id) {
		String sql = "SELECT * FROM LEC_ACC INNER JOIN LECTURER ON LECTURER.ID = LEC_ACC.LECTURER WHERE ACCOUNT = ?";
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Lecturer lecturer = new Lecturer();
				lecturer.setId(rs.getString("ID"));
				lecturer.setFullname(rs.getString("FULLNAME"));
				lecturer.setMale(rs.getBoolean("MALE"));
				lecturer.setLevel(rs.getString("LEVEL"));
				return lecturer;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Lecturer findProjectOne(String idproject) {
		String sql = "SELECT * FROM LEC_PRJ INNER JOIN LECTURER ON LECTURER.ID = LEC_PRJ.LECTURER WHERE LEC_PRJ.PROJECT = ?";
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, idproject);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Lecturer lecturer = new Lecturer();
				lecturer.setId(rs.getString("ID"));
				lecturer.setFullname(rs.getString("FULLNAME"));
				lecturer.setMale(rs.getBoolean("MALE"));
				lecturer.setLevel(rs.getString("LEVEL"));
				return lecturer;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Lecturer> findAll() {
		List<Lecturer> lecturers = new ArrayList<Lecturer>();
		String sql = "SELECT * FROM LECTURER";
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Lecturer lecturer = new Lecturer();
				lecturer.setId(rs.getString("ID"));
				lecturer.setFullname(rs.getString("FULLNAME"));
				lecturer.setMale(rs.getBoolean("MALE"));
				lecturer.setLevel(rs.getString("LEVEL"));
				
				lecturers.add(lecturer);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lecturers;
	}
	
}
