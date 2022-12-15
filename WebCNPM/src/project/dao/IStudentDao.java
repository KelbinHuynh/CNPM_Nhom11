package project.dao;

import java.util.List;

import project.model.Student;

public interface IStudentDao {
	Student findaccount(String id);
	List<Student> findStudentToTeam(String idteam);
	Student findStudent(String studentid);
	List<Student> findStudentToKey(String key);
	List<Student> findStudentToProject(String projectid);
	void insertToProject(String studentid, String projectid);
	void deleteStdCarePrj(String studentid, String projectid);
	boolean checkStdWithPrjCare(String studentid, String projectid);
	void updateToStudent(Student student);
	boolean checkStudent(String studentid);
	Student findStudentToMSSV(String mssv);
}
