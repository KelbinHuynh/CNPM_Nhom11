package project.service.impl;

import java.util.List;

import project.dao.ILecturerDao;
import project.dao.impl.LecturerDaoImpl;
import project.model.Lecturer;
import project.service.ILecturerService;

public class LecturerServiceImpl implements ILecturerService{

	ILecturerDao lecturerDao = new LecturerDaoImpl();

	@Override
	public Lecturer findaccount(String id) {
		return lecturerDao.findaccount(id);
	}

	@Override
	public Lecturer findProjectOne(String idproject) {
		return lecturerDao.findProjectOne(idproject);
	}

	@Override
	public List<Lecturer> findAll() {
		return lecturerDao.findAll();
	}


}
