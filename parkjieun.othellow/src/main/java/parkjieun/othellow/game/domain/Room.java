package parkjieun.othellow.game.domain;

import org.springframework.web.socket.WebSocketSession;

public class Room {
	private WebSocketSession blackUser;
	private WebSocketSession whiteUser;
	private int[][] matrix;
	private int[][] clickable;
	private int turn;
	private int gameStatus;
	private String blackNick;
	private String whiteNick;
	
	public Room(WebSocketSession blackUser, String blackNick, int gameStatus) {
		this.blackUser = blackUser;
		this.blackNick = blackNick;
		this.gameStatus = gameStatus;
	}
	public WebSocketSession getBlackUser() {
		return blackUser;
	}
	public void setBlackUser(WebSocketSession blackUser) {
		this.blackUser = blackUser;
	}
	public WebSocketSession getWhiteUser() {
		return whiteUser;
	}
	public void setWhiteUser(WebSocketSession whiteUser) {
		this.whiteUser = whiteUser;
	}
	public int[][] getMatrix() {
		return matrix;
	}
	public void setMatrix(int[][] matrix) {
		this.matrix = matrix;
	}
	public int[][] getClickable() {
		return clickable;
	}
	public void setClickable(int[][] clickable) {
		this.clickable = clickable;
	}
	public int getTurn() {
		return turn;
	}
	public void setTurn(int turn) {
		this.turn = turn;
	}
	public int getGameStatus() {
		return gameStatus;
	}
	public void setGameStatus(int gameStatus) {
		this.gameStatus = gameStatus;
	}
	public String getBlackNick() {
		return blackNick;
	}
	public void setBlackNick(String blackNick) {
		this.blackNick = blackNick;
	}
	public String getWhiteNick() {
		return whiteNick;
	}
	public void setWhiteNick(String whiteNick) {
		this.whiteNick = whiteNick;
	}
}
