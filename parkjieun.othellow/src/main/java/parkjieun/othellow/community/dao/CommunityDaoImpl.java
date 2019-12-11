package parkjieun.othellow.community.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import parkjieun.othellow.community.dao.mapper.CommunityMapper;
import parkjieun.othellow.community.domain.Community;

@Repository
public class CommunityDaoImpl implements CommunityDao{
	@Autowired private CommunityMapper communityMapper;
	
	// 게시글 목록을 얻는다
	// return: 게시글 목록
	@Override
	public List<Community> communityList() {
		return communityMapper.communityList();
	}

	// 게시글 목록을 얻는다
	// return: 게시글 목록
	@Override
	public List<Community> informList() {
		return communityMapper.informList();
	}

	// 게시글 목록을 얻는다
	// return: 게시글 목록
	@Override
	public List<Community> chatList() {
		return communityMapper.chatList();
	}

	// 게시글 목록을 얻는다
	// return: 게시글 목록
	@Override
	public List<Community> artList() {
		return communityMapper.artList();
	}

	// 게시글 하나를 찾는다.
	// param: 게시글 번호
	@Override
	public Community getViewPost(int seq) {
		return communityMapper.getViewPost(seq);
	}
	

	// 게시글 하나를 찾는다.
	// param: 게시글 번호
	@Override
	public Community getMyPost(int seq){
		return communityMapper.getMyPost(seq);
	}

	// 게시글을 추가한다.
	// return: 추가한 게시글 수
	// param: 회원 아이디
	@Override
	public void addPost(Community community){
		communityMapper.addPost(community);
	}
	
	@Override
	public void insertSelectKey(Community community){
		communityMapper.insertSelectKey(community);
	}

	// 게시글을 수정한다.
	// return: 수정한 게시글 수
	// param : community
	@Override
	public int updatePost(Community community){
		return communityMapper.updatePost(community);
	}

	// 게시글을 삭제한다.
	// return: 삭제한 게시글수
	// param: 삭제할 게시글 번호
	@Override
	public int delPost(int seq){
		return communityMapper.delPost(seq);
	}

}
