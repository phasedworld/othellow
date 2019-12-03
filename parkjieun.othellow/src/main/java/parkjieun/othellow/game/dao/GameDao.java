package parkjieun.othellow.game.dao;

import java.util.List;

import parkjieun.othellow.game.domain.Gamer;
import parkjieun.othellow.game.domain.Lobby;

public interface GameDao {
	List<Lobby> getLobby();
	int makeRoom(Lobby lobby);
	int gamerIn(Gamer gamer);
	int joinRoom(int roomId);
	int gamerOut(Gamer gamer);
	int deleteRoom(Gamer gamer);
}
