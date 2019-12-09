package parkjieun.othellow.admin.service;

import java.util.List;

import parkjieun.othellow.admin.domain.Character;

public interface CharacterService {
	int addCharacter(Character character);
	List<Character> getCharacters();

}
