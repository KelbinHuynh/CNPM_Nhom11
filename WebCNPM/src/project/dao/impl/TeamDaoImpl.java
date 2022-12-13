package project.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.DBConnection;
import project.dao.ITeamDao;
import project.model.Team;
import project.service.IStudentService;
import project.service.impl.StudentServiceImpl;

public class TeamDaoImpl extends DBConnection implements ITeamDao{

	@Override
	public Team findTeamToProject(String projectid) {
		String sql = "SELECT * FROM TEAM INNER JOIN TEAM_PRJ ON TEAM.ID = TEAM_PRJ.TEAM WHERE TEAM_PRJ.PROJECT = ?";
		Team team = new Team();
		team.setId("-1");
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, projectid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				IStudentService studentService = new StudentServiceImpl();
				
				team.setId(rs.getString("ID"));
				team.setLeader(rs.getString("LEADER"));
				team.setStudent(studentService.findStudentToTeam(rs.getString("ID")));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return team;
	}

	@Override
	public List<Team> findAll() {
		List<Team> teams = new ArrayList<Team>();
		String sql = "SELECT * FROM TEAM ";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				Team team = new Team();
				team.setId(rs.getString("ID"));
				team.setLeader(rs.getString("LEADER"));
			
				teams.add(team);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return teams;
	}

	@Override
	public void insertTeam(Team team) {
		String sql = "EXEC INS_TEAM ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, team.getLeader());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertSTD_TEAM(String idstd, String idteam) {
		String sql = "EXEC INS_STD_TEAM ?, ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, idstd);
			ps.setString(2, idteam);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Team findTeamToStudent(String idstd) {
		String sql = "SELECT TEAM.ID, TEAM.LEADER FROM TEAM INNER JOIN STD_TEAM ON TEAM.ID = STD_TEAM.TEAM WHERE STD_TEAM.STUDENT = ?";
		Team team = new Team();
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, idstd);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				IStudentService studentService = new StudentServiceImpl();			
				team.setId(rs.getString("ID"));
				team.setLeader(rs.getString("LEADER"));
				team.setStudent(studentService.findStudentToTeam(rs.getString("ID")));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return team;
	}
	
}
