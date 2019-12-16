package parkjieun.othellow.game.service;

import java.util.List;

import parkjieun.othellow.character.domain.Character;
import parkjieun.othellow.game.domain.Gamer;
import parkjieun.othellow.game.domain.Lobby;

public interface GameService {
	List<Lobby> listLobby();
	int makeRoom(Lobby lobby, Gamer gamer);
	int joinRoom(int roomId, Gamer gamer);
	String getCharacter(int characterNo);
	int startGame(int roomNo);
}
