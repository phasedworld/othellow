package parkjieun.othellow.community.service;

import java.util.List;

import parkjieun.othellow.community.domain.Community;

public interface CommunityService {
	List<Community> getPosts();
	Community findViewPost(int seq);
	Community findMyPost(int seq);
	boolean register(Community community);
	boolean updatePost(Community community);
	boolean delPost(int seq);
	
}
