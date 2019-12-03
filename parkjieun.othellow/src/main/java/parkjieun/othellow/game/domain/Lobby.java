package parkjieun.othellow.game.domain;

public class Lobby {
	private int roomId;
	private String roomName;
	private int roomHeadcount;
	private int roomStatus;
	
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getRoomHeadcount() {
		return roomHeadcount;
	}
	public void setRoomHeadcount(int roomHeadcount) {
		this.roomHeadcount = roomHeadcount;
	}
	public int getRoomStatus() {
		return roomStatus;
	}
	public void setRoomStatus(int roomStatus) {
		this.roomStatus = roomStatus;
	}
	
}
