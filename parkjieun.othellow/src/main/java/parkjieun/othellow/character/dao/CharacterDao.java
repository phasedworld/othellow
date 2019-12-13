package parkjieun.othellow.character.dao;

import java.util.List;

import parkjieun.othellow.character.domain.Character;

public interface CharacterDao {
	int addCharacter(Character character);
	List<Character> getCharacters();

}
