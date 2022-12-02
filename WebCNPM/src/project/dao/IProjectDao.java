package project.dao;

import java.util.List;

import project.model.Project;

public interface IProjectDao {
	List<Project> findAll();
	List<Project> findAllToMajor(String idmajor);
	int countAllProject();
	int countProjectToMajor(String idmajor);
	Project findOne(String projectId);
	void insertProject(Project project);
	void insertPRJ_MAJ(String idprj, String idmaj);
	void insertLEC_PRJ(String idlec, String idprj);
	void insertTEAM_PRJ(String idprj, String idteam);
}
