package parkjieun.othellow.uservice.service;

import java.util.List;


import org.springframework.stereotype.Service;


import parkjieun.othellow.user.domain.User;

@Service
public interface RankService {
	List<User> rankUsers();
	List<User> searchUser(String userNickname);
	
}
