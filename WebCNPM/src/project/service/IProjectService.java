<<<<<<< HEAD:src/project/service/IProjectService.java
package project.service;

import java.util.List;

import project.model.Project;

public interface IProjectService {
	List<Project> findAll();
	List<Project> findAllToMajor(String idmajor);
	int countAllProject();
	int countProjectToMajor(String idmajor);
	Project findOne(String projectId);
	Project findProjectToTeam(String idteam);
	void insertProject(Project project);
	void insertPRJ_MAJ(String idprj, String idmaj);
	void insertLEC_PRJ(String idlec, String idprj);
	void insertTEAM_PRJ(String idprj, String idteam);
}
=======
package project.service;

import java.util.List;

import project.model.Project;

public interface IProjectService {
	List<Project> findAll();
	List<Project> findAllToMajor(String idmajor);
	int countAllProject();
	int countProjectToMajor(String idmajor);
	Project findOne(String projectId);
	Project findProjectToTeam(String idteam);
	void insertProject(Project project);
	void insertPRJ_MAJ(String idprj, String idmaj);
	void insertLEC_PRJ(String idlec, String idprj);
	void insertTEAM_PRJ(String idprj, String idteam);
}
>>>>>>> 8cab83567cce0d9cf315728e307c6914940660b5:WebCNPM/src/project/service/IProjectService.java
