package parkjieun.othellow.game.domain;

public class Gamer {
	private int roomId;
	private String userId;
	private String userSide;
	
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserSide() {
		return userSide;
	}
	public void setUserSide(String userSide) {
		this.userSide = userSide;
	}
	
}
