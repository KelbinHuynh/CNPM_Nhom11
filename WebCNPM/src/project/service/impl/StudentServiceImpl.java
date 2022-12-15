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

	@Override
	public void insertToProject(String studentid, String projectid) {
		studentDao.insertToProject(studentid, projectid);
		
	}

	@Override
	public boolean checkStdWithPrjCare(String studentid, String projectid) {
		return studentDao.checkStdWithPrjCare(studentid, projectid);
	}

	@Override
	public void deleteStdCarePrj(String studentid, String projectid) {
		studentDao.deleteStdCarePrj(studentid, projectid);
		
	}

	@Override
	public void updateToStudent(Student student) {
		studentDao.updateToStudent(student);
		
	}

	@Override
	public List<Student> findStudentToKey(String key) {
		return studentDao.findStudentToKey(key);
	}

	@Override
	public boolean checkStudent(String studentid) {
		return studentDao.checkStudent(studentid);
	}

	@Override
	public Student findStudentToMSSV(String mssv) {
		return studentDao.findStudentToMSSV(mssv);
	}


}
