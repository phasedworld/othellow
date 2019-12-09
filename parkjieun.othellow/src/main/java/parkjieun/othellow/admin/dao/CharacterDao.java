package parkjieun.othellow.admin.dao;

import java.util.List;

import parkjieun.othellow.admin.domain.Character;

public interface CharacterDao {
	int addCharacter(Character character);
	List<Character> getCharacters();

}
