package parkjieun.othellow.game.dao;

import java.util.List;

import parkjieun.othellow.game.domain.Lobby;

public interface GameDao {
	List<Lobby> getLobby();
	int makeRoom(Lobby lobby);
}
