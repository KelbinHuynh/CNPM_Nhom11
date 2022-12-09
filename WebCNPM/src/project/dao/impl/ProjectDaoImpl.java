package project.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.DBConnection;
import project.dao.IProjectDao;
import project.model.Major;
import project.model.Project;
import project.service.ILecturerService;
import project.service.IMajorService;
import project.service.ITeamService;
import project.service.impl.LecturerServiceImpl;
import project.service.impl.MajorServiceImpl;
import project.service.impl.TeamServiceImpl;

public class ProjectDaoImpl extends DBConnection implements IProjectDao{

	@Override
	public List<Project> findAll() {
		List<Project> projects = new ArrayList<Project>();
		String sql = "SELECT * FROM PROJECT LEFT JOIN TEAM_PRJ ON PROJECT.ID = TEAM_PRJ.PROJECT ";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				IMajorService majorService = new MajorServiceImpl();
				Major major = majorService.findOne(rs.getString("ID"));
				ILecturerService lecturerService = new LecturerServiceImpl();
				ITeamService teamService = new TeamServiceImpl();
				
				Project project = new Project();
				project.setId(rs.getString("ID"));
				project.setName(rs.getString("NAME"));
				project.setDetails(rs.getString("DETAILS"));
				project.setCompletion_time(rs.getDate("COMPLETION_TIME"));
				project.setIs_graduate(rs.getBoolean("IS_GRADUATE"));
				project.setScore(rs.getFloat("SCORE"));
				project.setProtecte(rs.getBoolean("PROTECTED"));
				project.setMajor(major);
				project.setLecturer(lecturerService.findProjectOne(rs.getString("ID")));
				project.setTeam(teamService.findTeamToProject(rs.getString("ID")));

				projects.add(project);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return projects;
	}

	@Override
	public List<Project> findAllToMajor(String idmajor) {
		List<Project> projects = findAll();
		List<Project> projectToMajor = new ArrayList<Project>();
		for(Project project : projects) {
			if(project.getMajor().getId().equals(idmajor)) {
				projectToMajor.add(project);
			}
		}
		return projectToMajor;
	}

	@Override
	public int countAllProject() {
		String sql = "SELECT count(*) FROM PROJECT";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int countProjectToMajor(String idmajor) {
		String sql = "SELECT count(*) FROM PROJECT INNER JOIN PRJ_MAJ ON PROJECT.ID = PRJ_MAJ.PROJECT WHERE PRJ_MAJ.MAJOR = ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, idmajor);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Project findOne(String projectId) {
		Project project = new Project();
		String sql = "SELECT * FROM PROJECT LEFT JOIN TEAM_PRJ ON PROJECT.ID = TEAM_PRJ.PROJECT WHERE PROJECT.ID = ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, projectId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				IMajorService majorService = new MajorServiceImpl();
				Major major = majorService.findOne(rs.getString("ID"));
				ILecturerService lecturerService = new LecturerServiceImpl();
				ITeamService teamService = new TeamServiceImpl();

				project.setId(rs.getString("ID"));
				project.setName(rs.getString("NAME"));
				project.setDetails(rs.getString("DETAILS"));
				project.setCompletion_time(rs.getDate("COMPLETION_TIME"));
				project.setIs_graduate(rs.getBoolean("IS_GRADUATE"));
				project.setScore(rs.getFloat("SCORE"));
				project.setProtecte(rs.getBoolean("PROTECTED"));
				project.setMajor(major);
				project.setLecturer(lecturerService.findProjectOne(rs.getString("ID")));
				project.setTeam(teamService.findTeamToProject(rs.getString("ID")));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return project;
	}

	@Override
	public void insertProject(Project project) {
		String sql = "EXEC INS_PROJECT ?, ?, '12-01-2022', 1";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, project.getName());
			ps.setString(2, project.getDetails());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertPRJ_MAJ(String idprj, String idmaj) {
		String sql = "EXEC INS_PRJ_MAJ ?, ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, idprj);
			ps.setString(2, idmaj);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertLEC_PRJ(String idlec, String idprj) {
		String sql = "EXEC INS_LEC_PRJ ?, ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, idprj);
			ps.setString(2, idlec);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertTEAM_PRJ(String idprj, String idteam) {
		String sql = "EXEC INS_TEAM_PRJ ?, ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, idprj);
			ps.setString(2, idteam);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Project findProjectToTeam(String idteam) {
		Project project = new Project();
		String sql = "SELECT * FROM PROJECT LEFT JOIN TEAM_PRJ ON PROJECT.ID = TEAM_PRJ.PROJECT WHERE TEAM_PRJ.TEAM = ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, idteam);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				IMajorService majorService = new MajorServiceImpl();
				Major major = majorService.findOne(rs.getString("ID"));
				ILecturerService lecturerService = new LecturerServiceImpl();
				ITeamService teamService = new TeamServiceImpl();

				project.setId(rs.getString("ID"));
				project.setName(rs.getString("NAME"));
				project.setDetails(rs.getString("DETAILS"));
				project.setCompletion_time(rs.getDate("COMPLETION_TIME"));
				project.setIs_graduate(rs.getBoolean("IS_GRADUATE"));
				project.setScore(rs.getFloat("SCORE"));
				project.setProtecte(rs.getBoolean("PROTECTED"));
				project.setMajor(major);
				project.setLecturer(lecturerService.findProjectOne(rs.getString("ID")));
				project.setTeam(teamService.findTeamToProject(rs.getString("ID")));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return project;
	}
	
	

}
