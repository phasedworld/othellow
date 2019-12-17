package parkjieun.othellow.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import parkjieun.othellow.community.dao.CommunityDao;
import parkjieun.othellow.community.domain.Community;
import parkjieun.othellow.community.domain.Paging;

@Service
public class CommunityServiceImpl implements CommunityService{
	@Autowired private CommunityDao communityDao;
	
	//게시글 목록을 얻는다.
	@Override
	public List<Community> communityList() {
		return communityDao.communityList();
	}
	
	// 게시글 목록을 얻는다
	// return: 게시글 목록
	@Override
	public List<Community> informList() {
		return communityDao.informList();
	}

	// 게시글 목록을 얻는다
	// return: 게시글 목록
	@Override
	public List<Community> chatList() {
		return communityDao.chatList();
	}

	// 게시글 목록을 얻는다
	// return: 게시글 목록
	@Override
	public List<Community> artList() {
		return communityDao.artList();
	}

	//게시글 상세보기를 얻는다.
	@Override
	public Community viewPost(int seq) {
		return communityDao.read(seq);
	}
	
	//게시글을 등록한다.
	//return: 추가 성공 여부
	//param: 회원 아이디
	@Transactional
	@Override
	public void insertPost(Community community) {
		communityDao.insertSelectKey(community);
	}

	//게시글을 수정한다.
	//return: 수정 성공 여부
	//param: 수정할 게시글의 번호
	@Transactional
	@Override
	public boolean updatePost(Community community) {
		return communityDao.updatePost(community);
	}

	//게시글을 삭제한다.
	//return: 삭제 성공 여부
	//param: 삭제할 게시글의 번호
	@Transactional
	@Override
	public boolean delPost(int seq) {
		return communityDao.delPost(seq);
	}
	
	@Override
	public boolean hitCountUpdate(int seq){
		return communityDao.hitCountUpdate(seq);
	}
	

	@Override
	public int countPost() {
		return communityDao.countPost();
	}

	@Override
	public List<Community> selectPost(Paging paging) {
		return communityDao.selectPost(paging);
	}

	@Override
	public List<Community> bestPost() {
		return communityDao.bestPost();
	}
	
	@Override
	public Community updateForm(int seq){
		return communityDao.updateForm(seq);
	}
}
