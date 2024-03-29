package parkjieun.othellow.community.dao;

import java.util.List;

import parkjieun.othellow.community.domain.Community;

public interface CommunityDao {
	public List<Community> communityList();	//커뮤니티 목록
	public List<Community> informList();	//커뮤니티 목록
	public List<Community> chatList();	//커뮤니티 목록
	public List<Community> artList();	//커뮤니티 목록
	public Community read(int seq); //타인 게시글 상세보기
	public void addPost(Community community);	//게시글 등록
	public void insertSelectKey(Community community);
	public boolean updatePost(Community community);	//게시글 수정
	public boolean delPost(int seq);	//게시글 삭제
	public boolean hitCountUpdate(int seq);
	// 게시물 총 갯수
	public int countPost();
	public List<Community> bestPost();
	
	public Community updateForm(int seq);
}
