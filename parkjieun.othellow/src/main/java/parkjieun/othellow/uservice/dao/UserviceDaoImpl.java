package parkjieun.othellow.uservice.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import parkjieun.othellow.user.domain.User;
import parkjieun.othellow.uservice.dao.mapper.UserviceMapper;
@Repository
public class UserviceDaoImpl implements UserviceDao{
	@Autowired UserviceMapper userviceMapper;
	//1.랭킹페이지
	@Override
	public List<User> rankUsers() {
		return userviceMapper.rankUsers();
	}
	@Override
	public List<User> searchUser(String userNickname) {
		return userviceMapper.searchUser(userNickname);
	}
	
	//2.마이페이지
	@Override
	public int nicknameUpdate(User user) {
		return userviceMapper.nicknameUpdate(user);
	}

	@Override
	public int passwordUpdate(User user) {
		return userviceMapper.passwordUpdate(user);
	}

	@Override
	public int emailUpdate(User user) {
		return userviceMapper.emailUpdate(user);
	}
	
	@Override
	public int characterUpdate(User user) {
		return userviceMapper.characterUpdate(user);
	}

	@Override
	public int nicknameVerify(String userNickname) {
		return userviceMapper.nicknameVerify(userNickname);
	}
	

	@Override
	public int passwordVerify(String userPassword) {
		int result = 1;
		if(userviceMapper.passwordVerify(userPassword)!=null){
			result = 0;
		}
		return result;
	}
	
}
