package parkjieun.othellow.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import parkjieun.othellow.admin.dao.mapper.CharacterMapper;
import parkjieun.othellow.admin.domain.Character;

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
