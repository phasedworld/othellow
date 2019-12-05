package parkjieun.othellow.uservice.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import parkjieun.othellow.user.domain.User;
import parkjieun.othellow.uservice.dao.UserviceDao;

@Service
public class MypageServiceImpl implements MypageService{
	@Autowired 
	private UserviceDao userviceDao;

	@Override
	public int nicknameUpdate(User user) {
		return userviceDao.nicknameUpdate(user);
	}

	@Override
	public int passwordUpdate(User user) {
		return userviceDao.passwordUpdate(user);
	}

	@Override
	public int emailUpdate(User user) {
		return userviceDao.emailUpdate(user);
	}

	@Override
	public int nicknameVerify(String userNickname) {
		return userviceDao.nicknameVerify(userNickname);
	}

	@Override
	public int passwordVerify(String userPassword) {
		return userviceDao.passwordVerify(userPassword);
	}
}
