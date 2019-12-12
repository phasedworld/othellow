package parkjieun.othellow.game.dao;

import java.util.List;

import parkjieun.othellow.admin.domain.Character;
import parkjieun.othellow.game.domain.Gamer;
import parkjieun.othellow.game.domain.Lobby;
import parkjieun.othellow.user.domain.User;

public interface GameDao {
	List<Lobby> getLobby();
	int makeRoom(Lobby lobby);
	int gamerIn(Gamer gamer);
	int joinRoom(int roomId);
	int gamerOut(Gamer gamer);
	int deleteRoom(Gamer gamer);
	int gainExp(User user);
	List<Gamer> getCurGamer(int roomId);
	String getCharacter(int characterNo);
}
