package project.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.DBConnection;
import project.dao.IStudentDao;
import project.model.Student;
import project.service.IMajorService;
import project.service.impl.MajorServiceImpl;

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
				IMajorService majorService = new MajorServiceImpl();
				majorService.findMajorToStudent(id);
				student.setId(rs.getString("ID"));
				student.setFullname(rs.getString("FULLNAME"));
				student.setMale(rs.getBoolean("MALE"));
				student.setDateofbirth(rs.getDate("DATEOFBIRTH"));
				student.setPhonenumber(rs.getString("PHONENUMBER"));
				student.setMajor(majorService.findMajorToStudent(rs.getString("ID")));
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
				IMajorService majorService = new MajorServiceImpl();
				student.setId(rs.getString("ID"));
				student.setFullname(rs.getString("FULLNAME"));
				student.setMale(rs.getBoolean("MALE"));
				student.setDateofbirth(rs.getDate("DATEOFBIRTH"));
				student.setPhonenumber(rs.getString("PHONENUMBER"));
				student.setMajor(majorService.findMajorToStudent(rs.getString("ID")));
				students.add(student);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return students;
	}

	@Override
	public Student findStudent(String studentid) {
		String sql = "SELECT * FROM STUDENT WHERE ID = ?";
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, studentid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Student student = new Student();
				IMajorService majorService = new MajorServiceImpl();
				majorService.findMajorToStudent(studentid);
				student.setId(rs.getString("ID"));
				student.setFullname(rs.getString("FULLNAME"));
				student.setMale(rs.getBoolean("MALE"));
				student.setDateofbirth(rs.getDate("DATEOFBIRTH"));
				student.setPhonenumber(rs.getString("PHONENUMBER"));
				student.setMajor(majorService.findMajorToStudent(rs.getString("ID")));
				return student;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Student> findStudentToProject(String projectid) {
		List<Student> students = new ArrayList<Student>();
		String sql = "SELECT * FROM STUDENT INNER JOIN STD_PRJ ON STUDENT.ID = STD_PRJ.STUDENT WHERE STD_PRJ.PROJECT = ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,projectid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Student student = new Student();
				IMajorService majorService = new MajorServiceImpl();
				student.setId(rs.getString("ID"));
				student.setFullname(rs.getString("FULLNAME"));
				student.setMale(rs.getBoolean("MALE"));
				student.setDateofbirth(rs.getDate("DATEOFBIRTH"));
				student.setPhonenumber(rs.getString("PHONENUMBER"));
				student.setMajor(majorService.findMajorToStudent(rs.getString("ID")));
				students.add(student);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return students;
	}
	
}
