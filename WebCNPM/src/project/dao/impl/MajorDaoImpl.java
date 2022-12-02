package project.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.DBConnection;
import project.dao.IMajorDao;
import project.model.Major;

public class MajorDaoImpl extends DBConnection implements IMajorDao{

	@Override
	public List<Major> findAll() {
		List<Major> majors = new ArrayList<Major>();
		String sql = "SELECT * FROM MAJOR";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Major major = new Major();
				major.setId(rs.getString("ID"));
				major.setName(rs.getString("NAME"));

				majors.add(major);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return majors;
	}

	@Override
	public Major findOne(String id) {
		
		String sql = "SELECT * FROM MAJOR INNER JOIN PRJ_MAJ ON MAJOR.ID = PRJ_MAJ.MAJOR WHERE PRJ_MAJ.PROJECT = ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Major major = new Major();
				major.setId(rs.getString("ID"));
				major.setName(rs.getString("NAME"));
				return major;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
