package project.dao;


import java.util.List;

import project.model.Account;

public interface IAccountDao {
	Account findbyUsername(String username);
	boolean checkExistUsername(String username);
	List<Account> findAll();
}
