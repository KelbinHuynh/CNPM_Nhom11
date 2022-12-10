<<<<<<< HEAD:src/project/service/impl/TeamServiceImpl.java
package project.service.impl;

import java.util.List;

import project.dao.ITeamDao;
import project.dao.impl.TeamDaoImpl;
import project.model.Team;
import project.service.ITeamService;

public class TeamServiceImpl implements ITeamService{
	ITeamDao teamDao = new TeamDaoImpl();

	@Override
	public Team findTeamToProject(String projectid) {
		return teamDao.findTeamToProject(projectid);
	}

	@Override
	public void insertTeam(Team team) {
		teamDao.insertTeam(team);
		
	}

	@Override
	public void insertSTD_TEAM(String idstd, String idteam) {
		teamDao.insertSTD_TEAM(idstd, idteam);
		
	}

	@Override
	public List<Team> findAll() {
		return teamDao.findAll();
	}

	@Override
	public Team findTeamToStudent(String idstd) {
		return teamDao.findTeamToStudent(idstd);
	}
	
}
=======
package project.service.impl;

import java.util.List;

import project.dao.ITeamDao;
import project.dao.impl.TeamDaoImpl;
import project.model.Team;
import project.service.ITeamService;

public class TeamServiceImpl implements ITeamService{
	ITeamDao teamDao = new TeamDaoImpl();

	@Override
	public Team findTeamToProject(String projectid) {
		return teamDao.findTeamToProject(projectid);
	}

	@Override
	public void insertTeam(Team team) {
		teamDao.insertTeam(team);
		
	}

	@Override
	public void insertSTD_TEAM(String idstd, String idteam) {
		teamDao.insertSTD_TEAM(idstd, idteam);
		
	}

	@Override
	public List<Team> findAll() {
		return teamDao.findAll();
	}

	@Override
	public Team findTeamToStudent(String idstd) {
		return teamDao.findTeamToStudent(idstd);
	}
	
}
>>>>>>> 8cab83567cce0d9cf315728e307c6914940660b5:WebCNPM/src/project/service/impl/TeamServiceImpl.java
