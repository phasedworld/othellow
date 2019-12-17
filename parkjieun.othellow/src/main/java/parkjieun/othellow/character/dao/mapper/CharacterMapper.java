package parkjieun.othellow.character.dao.mapper;

import java.util.List;

import parkjieun.othellow.character.domain.Character;

public interface CharacterMapper {
	int addCharacter(Character character);
	List<Character> getCharacters();
	int deleteCharacter(int characterNo);
}
