package project.service;

import java.util.List;

import project.model.Lecturer;

public interface ILecturerService {
	Lecturer findaccount(String id);
	Lecturer findProjectOne(String idproject);
	List<Lecturer> findAll();
	List<Lecturer> findLecturerToTKB(String tkbid);
}
