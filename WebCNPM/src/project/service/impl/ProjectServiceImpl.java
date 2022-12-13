package project.service.impl;

import java.util.List;

import project.dao.IProjectDao;
import project.dao.impl.ProjectDaoImpl;
import project.model.Project;
import project.service.IProjectService;

public class ProjectServiceImpl implements IProjectService{

	IProjectDao projectDao = new ProjectDaoImpl();
	@Override
	public List<Project> findAll() {
		return projectDao.findAll();
	}
	@Override
	public List<Project> findAllToMajor(String idmajor) {
		return projectDao.findAllToMajor(idmajor);
	}
	@Override
	public int countAllProject() {
		return projectDao.countAllProject();
	}
	@Override
	public int countProjectToMajor(String idmajor) {
		return projectDao.countProjectToMajor(idmajor);
	}
	@Override
	public Project findOne(String projectId) {
		return projectDao.findOne(projectId);
	}
	@Override
	public void insertProject(Project project) {
		projectDao.insertProject(project);
	}
	@Override
	public void insertPRJ_MAJ(String idprj, String idmaj) {
		projectDao.insertPRJ_MAJ(idprj, idmaj);
		
	}
	@Override
	public void insertLEC_PRJ(String idlec, String idprj) {
		projectDao.insertLEC_PRJ(idlec, idprj);
		
	}
	@Override
	public void insertTEAM_PRJ(String idprj, String idteam) {
		projectDao.insertTEAM_PRJ(idprj, idteam);
	}
	@Override
	public Project findProjectToTeam(String idteam) {
		return projectDao.findProjectToTeam(idteam);
	}
	@Override
	public void updateProject(Project project) {
		projectDao.updateProject(project);
		
	}

}