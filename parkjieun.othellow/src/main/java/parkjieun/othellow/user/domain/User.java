package parkjieun.othellow.user.domain;

public class User {
	private String userId;
	private String userPassword;
	private String userNickname;
	private String userEmail;
	private String userPic;
	private int userWin;
	private int userLose;
	private int userExp;
	private String userRank;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPic() {
		return userPic;
	}
	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}
	public int getUserWin() {
		return userWin;
	}
	public void setUserWin(int userWin) {
		this.userWin = userWin;
	}
	public int getUserLose() {
		return userLose;
	}
	public void setUserLose(int userLose) {
		this.userLose = userLose;
	}
	public int getUserExp() {
		return userExp;
	}
	public void setUserExp(int userExp) {
		this.userExp = userExp;
	}
	public String getUserRank() {
		return userRank;
	}
	public void setUserRank(String userRank) {
		this.userRank = userRank;
	}
}
