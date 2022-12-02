package project.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.DBConnection;
import project.dao.IStudentDao;
import project.model.Student;

public class StudentDaoImpl extends DBConnection implements IStudentDao{

	@Override
	public Student findaccount(String id) {
		String sql = "SELECT * FROM STD_ACC INNER JOIN STUDENT ON STUDENT.ID = STD_ACC.STUDENT WHERE ACCOUNT = ?";
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Student student = new Student();
				student.setId(rs.getString("ID"));
				student.setFullname(rs.getString("FULLNAME"));
				student.setMale(rs.getBoolean("MALE"));
				student.setDateofbirth(rs.getDate("DATEOFBIRTH"));
				return student;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Student> findStudentToTeam(String idteam) {
		List<Student> students = new ArrayList<Student>();
		String sql = "SELECT * FROM STUDENT INNER JOIN STD_TEAM ON STUDENT.ID = STD_TEAM.STUDENT WHERE STD_TEAM.TEAM = ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,idteam);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Student student = new Student();
				student.setId(rs.getString("ID"));
				student.setFullname(rs.getString("FULLNAME"));
				student.setMale(rs.getBoolean("MALE"));
				student.setDateofbirth(rs.getDate("DATEOFBIRTH"));

				students.add(student);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return students;
	}
	
}
