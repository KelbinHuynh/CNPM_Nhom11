package project.service.impl;

import java.util.List;

import project.dao.IMajorDao;
import project.dao.impl.MajorDaoImpl;
import project.model.Major;
import project.service.IMajorService;

public class MajorServiceImpl implements IMajorService{

	IMajorDao majorDao = new MajorDaoImpl();
	@Override
	public List<Major> findAll() {
		return majorDao.findAll();
	}
	@Override
	public Major findOne(String id) {
		return majorDao.findOne(id);
	}
	@Override
	public Major findMajorToStudent(String idstu) {
		return majorDao.findMajorToStudent(idstu);
	}

}
