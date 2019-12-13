package parkjieun.othellow.character.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import parkjieun.othellow.character.dao.mapper.CharacterMapper;
import parkjieun.othellow.character.domain.Character;

@Repository
public class CharacterDaoImpl implements CharacterDao{
	@Autowired CharacterMapper characterMapper;
	@Override
	public int addCharacter(Character character) {
		return characterMapper.addCharacter(character);
	}
	@Override
	public List<Character> getCharacters() {
		return characterMapper.getCharacters();
	}

}
