package project.service;

import java.util.List;

import project.model.Major;

public interface IMajorService {
	List<Major> findAll();
	Major findOne(String id);
	Major findMajorToStudent(String idstu);
}
