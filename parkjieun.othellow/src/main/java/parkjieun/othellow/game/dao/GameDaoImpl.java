package parkjieun.othellow.game.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import parkjieun.othellow.game.dao.mapper.GameMapper;
import parkjieun.othellow.game.domain.Gamer;
import parkjieun.othellow.game.domain.Lobby;
import parkjieun.othellow.user.domain.User;

@Repository
public class GameDaoImpl implements GameDao{
	@Autowired GameMapper gameMapper;
	
	@Override
	public List<Lobby> getLobby() {
		return gameMapper.getLobby();
	}

	@Override
	public int makeRoom(Lobby lobby) {
		gameMapper.makeRoom(lobby);
		return lobby.getRoomId();
	}

	@Override
	public int gamerIn(Gamer gamer) {
		return gameMapper.gamerIn(gamer);
	}

	@Override
	public int joinRoom(int roomId) {
		return gameMapper.joinRoom(roomId);
	}

	@Override
	public int gamerOut(Gamer gamer) {
		gameMapper.gamerOut(gamer);
		return gameMapper.secedeRoom(gamer.getRoomId());
	}

	@Override
	public int deleteRoom(Gamer gamer) {
		gameMapper.gamerOut(gamer);
		return gameMapper.deleteRoom(gamer.getRoomId());
	}

	@Override
	public int gainExp(User user) {
		return gameMapper.gainExp(user);
	}

	@Override
	public List<Gamer> getCurGamer(int roomId) {
		return gameMapper.getCurGamer(roomId);
	}


}
