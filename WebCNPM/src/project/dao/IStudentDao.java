<<<<<<< HEAD:src/project/dao/IStudentDao.java
package project.dao;

import java.util.List;

import project.model.Student;

public interface IStudentDao {
	Student findaccount(String id);
	List<Student> findStudentToTeam(String idteam);
	Student findStudent(String studentid);
	List<Student> findStudentToProject(String projectid);
}
=======
package project.dao;

import java.util.List;

import project.model.Student;

public interface IStudentDao {
	Student findaccount(String id);
	List<Student> findStudentToTeam(String idteam);
	Student findStudent(String studentid);
	List<Student> findStudentToProject(String projectid);
}
>>>>>>> 8cab83567cce0d9cf315728e307c6914940660b5:WebCNPM/src/project/dao/IStudentDao.java
