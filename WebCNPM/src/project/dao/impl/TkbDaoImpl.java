package project.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.DBConnection;
import project.dao.ITkbDao;
import project.model.Tkb;
import project.service.ILecturerService;
import project.service.ITeamService;
import project.service.impl.LecturerServiceImpl;
import project.service.impl.TeamServiceImpl;

public class TkbDaoImpl extends DBConnection implements ITkbDao{


	@Override
	public List<Tkb> findAllTkb() {
		List<Tkb> tkbList = new ArrayList<Tkb>();
		String sql = "SELECT * FROM TKB";
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Tkb tkb = new Tkb();
				ILecturerService lecturerService = new LecturerServiceImpl();
				tkb.setLecturer(lecturerService.findLecturerToTKB(rs.getString("ID")));
				
				ITeamService teamService = new TeamServiceImpl();
				tkb.setTeam(teamService.findTeamToTkb(rs.getString("ID")));
				
				tkb.setId(rs.getString("ID"));
				tkb.setRoom(rs.getString("ROOM"));
				tkb.setDate(rs.getDate("DAY"));
				tkb.setTimeofday(rs.getTime("TIMEOFDAY"));

				tkbList.add(tkb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tkbList;
	}

	@Override
	public void insertLecturerToTkb(String lecturerid, String tkbid) {
		String sql = "EXEC INS_TKB_LEC ?, ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, tkbid);
			ps.setString(2, lecturerid);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertTeamToTkb(String teamid, String tkbid) {
		String sql = "EXEC INS_TEAM_TKB ?, ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, tkbid);
			ps.setString(2, teamid);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertTkb(Tkb tkb) {
		String sql = "EXEC INS_TKB ?, ?, ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, tkb.getRoom());
			ps.setDate(2, tkb.getDate());
			ps.setTime(3, tkb.getTimeofday());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
