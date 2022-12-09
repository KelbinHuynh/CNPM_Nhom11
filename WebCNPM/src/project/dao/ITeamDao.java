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
