package parkjieun.othellow.community.service;

import java.util.List;

import parkjieun.othellow.community.domain.Community;

public interface CommunityService {
	public List<Community> communityList();
	public List<Community> informList();
	public List<Community> chatList();
	public List<Community> artList();
	public Community viewPost(int seq);
	public void insertPost(Community community);
	public boolean updatePost(Community community);
	public boolean delPost(int seq);
	
}
