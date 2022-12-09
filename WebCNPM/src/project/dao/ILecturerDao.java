package project.dao;

import java.util.List;

import project.model.Lecturer;

public interface ILecturerDao {
	Lecturer findaccount(String id);
	Lecturer findProjectOne(String idproject);
	List<Lecturer> findAll();
}
