package project.service;

import java.util.List;

import project.model.Team;

public interface ITeamService {
	Team findTeamToProject(String projectid);
	void insertTeam(Team team);
	void insertSTD_TEAM(String idstd, String idteam);
	List<Team> findAll();
	Team findTeamToStudent(String idstd);
	List<Team> findTeamToTkb(String idtkb);
}

