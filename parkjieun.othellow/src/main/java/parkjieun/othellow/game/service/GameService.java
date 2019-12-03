package parkjieun.othellow.game.service;

import java.util.List;

import parkjieun.othellow.game.domain.Gamer;
import parkjieun.othellow.game.domain.Lobby;

public interface GameService {
	List<Lobby> listLobby();
	int makeRoom(Lobby lobby, Gamer gamer);
	int joinRoom(int roomId, Gamer gamer);
}
