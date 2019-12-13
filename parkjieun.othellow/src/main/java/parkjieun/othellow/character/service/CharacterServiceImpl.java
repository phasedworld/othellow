package parkjieun.othellow.character.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import parkjieun.othellow.character.dao.CharacterDao;
import parkjieun.othellow.character.domain.Character;

@Service
public class CharacterServiceImpl implements CharacterService{
	@Autowired CharacterDao characterDao;
	
	@Override
	public int addCharacter(Character character) {
		return characterDao.addCharacter(character);
	}

	@Override
	public List<Character> getCharacters() {
		return characterDao.getCharacters();
	}

}
