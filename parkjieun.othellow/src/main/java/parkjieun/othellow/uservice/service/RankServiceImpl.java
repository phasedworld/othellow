package parkjieun.othellow.uservice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import parkjieun.othellow.user.domain.User;
import parkjieun.othellow.uservice.dao.UserviceDao;
@Service
public class RankServiceImpl implements RankService{
	@Autowired private UserviceDao userviceDao;
	
	@Override
	public List<User> rankUsers() {
		return userviceDao.rankUsers();
	}

	/*@Override
	public User searchUser(String userNickname) {
		return userviceDao.searchUser(userNickname);
	}
*/
}
