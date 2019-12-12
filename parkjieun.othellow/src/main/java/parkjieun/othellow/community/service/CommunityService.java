package parkjieun.othellow.community.service;

import java.util.List;

import parkjieun.othellow.community.domain.Community;

public interface CommunityService {
	List<Community> communityList();
	List<Community> informList();
	List<Community> chatList();
	List<Community> artList();
	public Community get(int seq);
	public void insertPost(Community community);
	boolean updatePost(Community community);
	boolean delPost(int seq);
	
}
