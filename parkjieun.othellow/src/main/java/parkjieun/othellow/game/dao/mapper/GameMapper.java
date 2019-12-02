package parkjieun.othellow.game.dao.mapper;

import java.util.List;

import parkjieun.othellow.game.domain.Lobby;

public interface GameMapper {
	List<Lobby> getLobby();
	int makeRoom(Lobby lobby);
}
