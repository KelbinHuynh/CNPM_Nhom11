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


}
