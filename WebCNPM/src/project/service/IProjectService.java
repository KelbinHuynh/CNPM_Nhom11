package project.service;

import java.util.List;

import project.model.Project;

public interface IProjectService {
	List<Project> findAll();
	List<Project> findAllToMajor(String idmajor);
	List<Project> findAllPageProjectToMajor(String idmajor, int indexp);
	List<Project> findAllPage(int indexp);
	List<Project> findProjectOfLecturer(String lecturerid);
	int countAllProject();
	int countProjectToMajor(String idmajor);
	Project findOne(String projectId);
	Project findProjectToTeam(String idteam);
	void insertProject(Project project);
	void insertPRJ_MAJ(String idprj, String idmaj);
	void insertLEC_PRJ(String idlec, String idprj);
	void insertTEAM_PRJ(String idprj, String idteam);
	void updateProject(Project project);
	int countProjectOfLecturer(String lecturerid);
}
