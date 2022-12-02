package project.service;

import java.util.List;

import project.model.Student;

public interface IStudentService{
	Student findaccount(String id);
	List<Student> findStudentToTeam(String idteam);
}
