package parkjieun.othellow.game.dao.mapper;

import java.util.List;

import parkjieun.othellow.character.domain.Character;
import parkjieun.othellow.game.domain.Gamer;
import parkjieun.othellow.game.domain.Lobby;
import parkjieun.othellow.user.domain.User;

public interface GameMapper {
	List<Lobby> getLobby();
	int makeRoom(Lobby lobby);
	int gamerIn(Gamer gamer);
	int joinRoom(int roomId);
	int gamerOut(Gamer gamer);
	int secedeRoom(int roomNo);
	int deleteRoom(int roomNo);
	int gainExp(User user);
	List<Gamer> getCurGamer(int roomId);
	String getCharacter(int characterNo);
}
