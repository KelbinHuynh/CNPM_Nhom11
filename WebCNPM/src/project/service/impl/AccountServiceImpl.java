package project.service.impl;

import project.dao.IAccountDao;
import project.dao.impl.AccountDaoImpl;
import project.model.Account;
import project.service.IAccountService;

public class AccountServiceImpl implements IAccountService{

	IAccountDao accountDao = new AccountDaoImpl();
	@Override
	public Account loginAccount(String username, String password) {
		Account account = this.findbyUsername(username);
		if (account != null && password.equals(account.getPassword())) {
			return account;
		}
		return null;
	}


	@Override
	public boolean checkExistUsername(String username) {
		return accountDao.checkExistUsername(username);
	}


	@Override
	public Account findbyUsername(String username) {
		return accountDao.findbyUsername(username);
	}


}
