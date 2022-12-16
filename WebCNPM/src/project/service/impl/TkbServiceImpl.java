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

	@Override
	public void insertLecturerToTkb(String lecturerid, String tkbid) {
		tkbDao.insertLecturerToTkb(lecturerid, tkbid);
		
	}

	@Override
	public void insertTeamToTkb(String teamid, String tkbid) {
		tkbDao.insertTeamToTkb(teamid, tkbid);
		
	}

	@Override
	public void insertTkb(Tkb tkb) {
		tkbDao.insertTkb(tkb);
		
	}

}
