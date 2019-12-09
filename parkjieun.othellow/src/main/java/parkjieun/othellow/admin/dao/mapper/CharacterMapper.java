package parkjieun.othellow.admin.dao.mapper;

import java.util.List;

import parkjieun.othellow.admin.domain.Character;

public interface CharacterMapper {
	int addCharacter(Character character);
	List<Character> getCharacters();
}
