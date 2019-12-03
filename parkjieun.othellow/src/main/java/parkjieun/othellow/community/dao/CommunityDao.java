package parkjieun.othellow.community.dao;

import java.util.List;

import parkjieun.othellow.community.domain.Community;

public interface CommunityDao {
	List<Community> communityList();	//커뮤니티 목록
	Community getViewPost(int seq); //타인 게시글 상세보기
	Community getMyPost(int seq); //내 게시글 상세보기
	int addPost(Community community);	//게시글 등록
	int updatePost(Community community);	//게시글 수정
	int delPost(int seq);	//게시글 삭제
}
