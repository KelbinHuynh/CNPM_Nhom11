package project.dao;

import java.util.List;

import project.model.Student;

public interface IStudentDao {
	Student findaccount(String id);
	List<Student> findStudentToTeam(String idteam);
}
