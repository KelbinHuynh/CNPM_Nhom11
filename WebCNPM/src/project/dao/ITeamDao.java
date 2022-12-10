<<<<<<< HEAD:src/project/dao/ITeamDao.java
package project.dao;

import java.util.List;

import project.model.Team;

public interface ITeamDao {
	List<Team> findAll();
	Team findTeamToProject(String projectid);
	void insertTeam(Team team);
	void insertSTD_TEAM(String idstd, String idteam);
	Team findTeamToStudent(String idstd);
}
=======
package project.dao;

import java.util.List;

import project.model.Team;

public interface ITeamDao {
	List<Team> findAll();
	Team findTeamToProject(String projectid);
	void insertTeam(Team team);
	void insertSTD_TEAM(String idstd, String idteam);
	Team findTeamToStudent(String idstd);
}
>>>>>>> 8cab83567cce0d9cf315728e307c6914940660b5:WebCNPM/src/project/dao/ITeamDao.java
