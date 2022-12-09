<<<<<<< HEAD:src/project/service/IStudentService.java
package project.service;

import java.util.List;

import project.model.Student;

public interface IStudentService{
	Student findaccount(String id);
	List<Student> findStudentToTeam(String idteam);
	Student findStudent(String studentid);
	List<Student> findStudentToProject(String projectid);
}
=======
package project.service;

import java.util.List;

import project.model.Student;

public interface IStudentService{
	Student findaccount(String id);
	List<Student> findStudentToTeam(String idteam);
	Student findStudent(String studentid);
	List<Student> findStudentToProject(String projectid);
}
>>>>>>> 8cab83567cce0d9cf315728e307c6914940660b5:WebCNPM/src/project/service/IStudentService.java
