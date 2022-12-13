package project.service;

import java.util.List;

import project.model.Student;

public interface IStudentService{
	Student findaccount(String id);
	List<Student> findStudentToTeam(String idteam);
	Student findStudent(String studentid);
	List<Student> findStudentToProject(String projectid);
	void insertToProject(String studentid, String projectid);
	void deleteStdCarePrj(String studentid, String projectid);
	boolean checkStdWithPrjCare(String studentid, String projectid);
}
