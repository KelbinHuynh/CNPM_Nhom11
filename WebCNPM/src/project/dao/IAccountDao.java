package project.dao;


import project.model.Account;

public interface IAccountDao {
	Account findbyUsername(String username);
	boolean checkExistUsername(String username);
}
