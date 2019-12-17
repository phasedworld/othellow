package parkjieun.othellow.character.service;

import java.util.List;

import parkjieun.othellow.character.domain.Character;

public interface CharacterService {
	int addCharacter(Character character);
	List<Character> getCharacters();
	boolean deleteCharacter(int characterNo);
}
