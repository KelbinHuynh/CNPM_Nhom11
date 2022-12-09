<<<<<<< HEAD:src/project/dao/IMajorDao.java
package project.dao;

import java.util.List;

import project.model.Major;

public interface IMajorDao {
	List<Major> findAll();
	Major findOne(String id);
	Major findMajorToStudent(String idstu);
}
=======
package project.dao;

import java.util.List;

import project.model.Major;

public interface IMajorDao {
	List<Major> findAll();
	Major findOne(String id);
	Major findMajorToStudent(String idstu);
}
>>>>>>> 8cab83567cce0d9cf315728e307c6914940660b5:WebCNPM/src/project/dao/IMajorDao.java
