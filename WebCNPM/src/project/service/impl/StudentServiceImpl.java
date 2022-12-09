<<<<<<< HEAD:src/project/service/impl/StudentServiceImpl.java
package project.service.impl;

import java.util.List;

import project.dao.IStudentDao;
import project.dao.impl.StudentDaoImpl;
import project.model.Student;
import project.service.IStudentService;

public class StudentServiceImpl implements IStudentService{

	IStudentDao studentDao = new StudentDaoImpl();

	@Override
	public Student findaccount(String id) {
		return studentDao.findaccount(id);
	}

	@Override
	public List<Student> findStudentToTeam(String idteam) {
		return studentDao.findStudentToTeam(idteam);
	}

	@Override
	public Student findStudent(String studentid) {
		return studentDao.findStudent(studentid);
	}

	@Override
	public List<Student> findStudentToProject(String projectid) {
		return studentDao.findStudentToProject(projectid);
	}


}
=======
package project.service.impl;

import java.util.List;

import project.dao.IStudentDao;
import project.dao.impl.StudentDaoImpl;
import project.model.Student;
import project.service.IStudentService;

public class StudentServiceImpl implements IStudentService{

	IStudentDao studentDao = new StudentDaoImpl();

	@Override
	public Student findaccount(String id) {
		return studentDao.findaccount(id);
	}

	@Override
	public List<Student> findStudentToTeam(String idteam) {
		return studentDao.findStudentToTeam(idteam);
	}

	@Override
	public Student findStudent(String studentid) {
		return studentDao.findStudent(studentid);
	}

	@Override
	public List<Student> findStudentToProject(String projectid) {
		return studentDao.findStudentToProject(projectid);
	}


}
>>>>>>> 8cab83567cce0d9cf315728e307c6914940660b5:WebCNPM/src/project/service/impl/StudentServiceImpl.java
