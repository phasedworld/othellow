package parkjieun.othellow.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import parkjieun.othellow.community.dao.CommunityDao;
import parkjieun.othellow.community.domain.Community;

@Service
public class CommunityServiceImpl implements CommunityService{
	@Autowired private CommunityDao communityDao;
	
	//게시글 목록을 얻는다.
	@Override
	public List<Community> communityList() {
		return communityDao.communityList();
	}

	//게시글 상세보기를 얻는다.
	@Override
	public Community findViewPost(int seq) {
		return communityDao.getViewPost(seq);
	}

	//게시글 상세보기를 얻는다.
	@Override
	public Community findMyPost(int seq) {
		return communityDao.getMyPost(seq);
	}
	
	//게시글을 등록한다.
	//return: 추가 성공 여부
	//param: 회원 아이디
	@Transactional
	@Override
	public boolean register(Community community) {
		return communityDao.addPost(community)>0;
	}

	//게시글을 수정한다.
	//return: 수정 성공 여부
	//param: 수정할 게시글의 번호
	@Transactional
	@Override
	public boolean updatePost(Community community) {
		return communityDao.updatePost(community)>0;
	}

	//게시글을 삭제한다.
	//return: 삭제 성공 여부
	//param: 삭제할 게시글의 번호
	@Transactional
	@Override
	public boolean delPost(int seq) {
		return communityDao.delPost(seq)>0;
	}
}
