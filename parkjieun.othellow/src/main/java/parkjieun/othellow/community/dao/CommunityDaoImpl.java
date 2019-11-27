package parkjieun.othellow.community.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import parkjieun.othellow.community.dao.mapper.CommunityMapper;
import parkjieun.othellow.community.domain.Community;

@Repository
public class CommunityDaoImpl implements CommunityDao{
	@Autowired private CommunityMapper communityMapper;
	
	@Override
	public List<Community> getPosts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Community getViewPost(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Community getMyPost(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addPost(Community community) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePost(Community community) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delPost(int seq) {
		// TODO Auto-generated method stub
		return 0;
	}

}
