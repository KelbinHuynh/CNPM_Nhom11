package project.service.impl;

import project.dao.IAdminDao;
import project.dao.impl.AdminDaoImpl;
import project.model.Admin;
import project.service.IAdminService;

public class AdminServiceImpl implements IAdminService{

	IAdminDao adminDao = new AdminDaoImpl();

	@Override
	public Admin findaccount(String id) {
		return adminDao.findaccount(id);
	}


}
