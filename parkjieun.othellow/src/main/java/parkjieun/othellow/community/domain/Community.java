package parkjieun.othellow.community.domain;

import java.sql.Date;

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
	
	public Community(){}
	public Community(String userId){
		super();
		this.userId = userId;
	}
	
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
	public User getUserNickname() {
		return user;
	}
	public void setUserNickname(User user) {
		this.user = user;
	}
	public User getUserRank(){
		return user;
	}
	public void setUserRank(User user){
		this.user = user;
	}
}
