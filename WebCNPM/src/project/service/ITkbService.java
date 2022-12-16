package project.service;

import java.util.List;

import project.model.Tkb;

public interface ITkbService {
	List<Tkb> findAllTkb();
	void insertLecturerToTkb(String lecturerid, String tkbid);
	void insertTeamToTkb(String teamid, String tkbid);
	void insertTkb(Tkb tkb);
}
