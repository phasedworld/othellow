package parkjieun.othellow.community.dao.mapper;

import java.util.List;

import parkjieun.othellow.community.domain.Community;

public interface CommunityMapper {
	List<Community> communityList();	//커뮤니티 목록
	List<Community> informList();	//커뮤니티 목록
	List<Community> chatList();	//커뮤니티 목록
	List<Community> artList();	//커뮤니티 목록
	public Community read(int seq); //타인 게시글 상세보기
	public void addPost(Community community);	//게시글 등록
	public void insertSelectKey(Community community);
	int updatePost(Community community);	//게시글 수정
	int delPost(int seq);	//게시글 삭제
}
