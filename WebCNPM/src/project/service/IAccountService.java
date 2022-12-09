package project.service;

import project.model.Account;

public interface IAccountService {
	Account loginAccount(String username, String password);
	Account findbyUsername(String username);
	boolean checkExistUsername(String username);
}
