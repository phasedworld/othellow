package parkjieun.othellow.community.service;

import java.util.List;

import parkjieun.othellow.community.domain.Community;
import parkjieun.othellow.community.domain.Paging;

public interface CommunityService {
	public List<Community> communityList();
	public List<Community> informList();
	public List<Community> chatList();
	public List<Community> artList();
	public Community viewPost(int seq);
	public void insertPost(Community community);
	public boolean updatePost(Community community);
	public boolean delPost(int seq);
	public boolean hitCountUpdate(int seq);
	// 게시물 총 갯수
	public int countPost();
	// 페이징 처리 게시글 조회
	public List<Community> selectPost(Paging paging);
	public List<Community> bestPost();
	

	public Community updateForm(int seq);
}
