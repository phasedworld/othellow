package parkjieun.othellow.game.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import parkjieun.othellow.game.dao.GameDao;
import parkjieun.othellow.game.domain.Lobby;

@Service
public class GameServiceImpl implements GameService{
	@Autowired GameDao gameDao;
	
	@Override
	public List<Lobby> listLobby() {
		return gameDao.getLobby();
	}

	@Override
	public int makeRoom(Lobby lobby) {
		return gameDao.makeRoom(lobby);
	}

}
