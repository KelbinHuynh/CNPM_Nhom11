package project.dao;

import java.util.List;

import project.model.Major;

public interface IMajorDao {
	List<Major> findAll();
	Major findOne(String id);
	Major findMajorToStudent(String idstu);
	Major findMajorToLecturer(String idle);
}

