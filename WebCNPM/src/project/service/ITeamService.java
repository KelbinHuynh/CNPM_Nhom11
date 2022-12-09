<<<<<<< HEAD:src/project/service/ITeamService.java
package project.service;

import java.util.List;

import project.model.Team;

public interface ITeamService {
	Team findTeamToProject(String projectid);
	void insertTeam(Team team);
	void insertSTD_TEAM(String idstd, String idteam);
	List<Team> findAll();
	Team findTeamToStudent(String idstd);
}
=======
package project.service;

import java.util.List;

import project.model.Team;

public interface ITeamService {
	Team findTeamToProject(String projectid);
	void insertTeam(Team team);
	void insertSTD_TEAM(String idstd, String idteam);
	List<Team> findAll();
	Team findTeamToStudent(String idstd);
}
>>>>>>> 8cab83567cce0d9cf315728e307c6914940660b5:WebCNPM/src/project/service/ITeamService.java
