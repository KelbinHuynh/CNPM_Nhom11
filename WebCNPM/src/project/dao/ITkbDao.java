package project.dao;

import java.util.List;

import project.model.Tkb;

public interface ITkbDao {
	List<Tkb> findAllTkb();
	void insertLecturerToTkb(String lecturerid, String tkbid);
	void insertTeamToTkb(String teamid, String tkbid);
	void insertTkb(Tkb tkb);
	
}
