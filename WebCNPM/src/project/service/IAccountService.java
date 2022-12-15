package project.service;

import java.util.List;

import project.model.Account;

public interface IAccountService {
	Account loginAccount(String username, String password);
	Account findbyUsername(String username);
	boolean checkExistUsername(String username);
	List<Account> findAll();
}
