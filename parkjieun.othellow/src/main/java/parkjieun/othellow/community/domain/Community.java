package parkjieun.othellow.community.domain;

import java.sql.Date;

import parkjieun.othellow.admin.domain.Character;
import parkjieun.othellow.user.domain.User;

public class Community {
	private int seq;
	private String title;
	private String userId;
	private Date regDate;
	private int hitCount;
	private String sort;
	private String image;
	private String contents;
	private int likeCount;
	private String likeUser;
	private User user;
	private String userNickname;
	private String userRank;
	private Character character;
	private String imageLink;

	public Community(){}



	//getter&setter
	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public int getHitCount() {
		return hitCount;
	}


	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}


	public String getSort() {
		return sort;
	}


	public void setSort(String sort) {
		this.sort = sort;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public int getLikeCount() {
		return likeCount;
	}


	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}


	public String getLikeUser() {
		return likeUser;
	}


	public void setLikeUser(String likeUser) {
		this.likeUser = likeUser;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public String getUserNickname() {
		return userNickname;
	}


	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}


	public String getUserRank() {
		return userRank;
	}


	public void setUserRank(String userRank) {
		this.userRank = userRank;
	}


	public String getImageLink() {
		return imageLink;
	}


	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}


	public Character getCharacter() {
		return character;
	}


	public void setCharacter(Character character) {
		this.character = character;
	}
}
