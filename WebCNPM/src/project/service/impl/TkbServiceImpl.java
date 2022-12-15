package project.service.impl;

import java.util.List;

import project.dao.ITkbDao;
import project.dao.impl.TkbDaoImpl;
import project.model.Tkb;
import project.service.ITkbService;

public class TkbServiceImpl  implements ITkbService {
	ITkbDao tkbDao = new TkbDaoImpl();
	
	@Override
	public List<Tkb> findAllTkb(){
		return tkbDao.findAllTkb();
	}

}
