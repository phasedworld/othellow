package parkjieun.othellow.game.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import parkjieun.othellow.character.domain.Character;
import parkjieun.othellow.game.dao.GameDao;
import parkjieun.othellow.game.domain.Gamer;
import parkjieun.othellow.game.domain.Lobby;

@Service
public class GameServiceImpl implements GameService{
	@Autowired GameDao gameDao;
	
	@Override
	public List<Lobby> listLobby() {
		return gameDao.getLobby();
	}

	@Transactional
	public int makeRoom(Lobby lobby, Gamer gamer) {
		gamer.setRoomId(gameDao.makeRoom(lobby));
		gameDao.gamerIn(gamer);
		return gamer.getRoomId();
	}

	@Transactional
	public int joinRoom(int roomId, Gamer gamer) {
		gameDao.gamerIn(gamer);
		return gameDao.joinRoom(roomId);
	}

	@Override
	public String getCharacter(int characterNo) {
		return gameDao.getCharacter(characterNo);
	}

}
