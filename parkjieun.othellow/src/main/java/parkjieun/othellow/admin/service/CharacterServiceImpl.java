package parkjieun.othellow.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import parkjieun.othellow.admin.dao.CharacterDao;
import parkjieun.othellow.admin.domain.Character;

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
