package parkjieun.othellow.game.websocket;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import parkjieun.othellow.game.dao.GameDao;
import parkjieun.othellow.game.domain.Gamer;
import parkjieun.othellow.game.domain.Room;
import parkjieun.othellow.user.domain.User;

@Service
@Component
public class MyHandler extends TextWebSocketHandler{
	@Autowired GameDao gameDao;
	
	HashMap<String,Room> rooms = new HashMap<String, Room>();
	int matrix[][] = {
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0}
	};
	
	@Override
	protected void handleTextMessage(WebSocketSession session,
			TextMessage message) throws Exception {
		//메시지의 유형 [roomNo]:[action]:[value]:...
		String[] received = message.getPayload().split(":");
		if(received[0]!=null&&received[1].equals("enter")){
			//1. action> enter
			Room thisRoom = rooms.get(received[0]);
			if(thisRoom==null){
				//새 방이 없으면, 새 방을 생성 후 흑돌 유저로 지정
				thisRoom = new Room(session, received[2], 0);
				rooms.put(received[0], thisRoom);
				session.sendMessage(new TextMessage("side:black"));
			}else{
				//이미 만들어진 방에 들어가는 경우, 백돌 유저로 지정
				thisRoom.setWhiteUser(session);
				thisRoom.setWhiteNick(received[2]);
				rooms.put(received[0], thisRoom);
				session.sendMessage(new TextMessage("side:white"));
			}
			//해당 room의 키를 가진 전부에게 방장의 닉네임을 메시지로 보냄
			thisRoom.getBlackUser().sendMessage(new TextMessage("enter:blackNick:"+thisRoom.getBlackNick()));
			if(thisRoom.getWhiteUser()!=null){
				thisRoom.getWhiteUser().sendMessage(new TextMessage("enter:blackNick:"+thisRoom.getBlackNick()));
				
			}
		}
		else if(received[0]!=null&&received[1].equals("ready")){
			//2. action> ready(백돌 유저의 게임 레디로 게임을 시작)
			//방 번호를 가져와 기본 배열을 세팅
			Room thisRoom = rooms.get(received[0]);
			int startMatrix[][] = {
					{0,0,0,0,0,0,0,0},
					{0,0,0,0,0,0,0,0},
					{0,0,0,0,0,0,0,0},
					{0,0,0,2,1,0,0,0},
					{0,0,0,1,2,0,0,0},
					{0,0,0,0,0,0,0,0},
					{0,0,0,0,0,0,0,0},
					{0,0,0,0,0,0,0,0}
			};
			thisRoom.setMatrix(startMatrix);
			thisRoom.setGameStatus(1);
			//'ready' 메시지를 보낸 백돌 유저의 아이디와 게임 시작을 알림
			thisRoom.getBlackUser().sendMessage(new TextMessage("enter:whiteNick:"+thisRoom.getWhiteNick()));
			thisRoom.getWhiteUser().sendMessage(new TextMessage("enter:whiteNick:"+thisRoom.getWhiteNick()));
			thisRoom.getBlackUser().sendMessage(new TextMessage("start"));
			thisRoom.getWhiteUser().sendMessage(new TextMessage("start"));
			rooms.put(received[0], thisRoom);
			gameDao.startGame(Integer.parseInt(received[0]));
		}
		else if(received[0]!=null&&received[1].equals("black")){
			//black의 턴 넘김 메시지 받음 ex) 3:black:41
			int idx = Integer.parseInt(received[2]);
			int x = (idx-1)/8; int y = (idx-1)%8;
			Room thisRoom = rooms.get(received[0]);
			matrix = thisRoom.getMatrix();
			//전부 뒤집은 후에 새 돌 삽입
			flipStone(matrix, x, y, "black");
			matrix[x][y] = 1;
			thisRoom.setMatrix(matrix);
			//현재 배열 프린트
			thisRoom.getBlackUser().sendMessage(new TextMessage(boardRecord(matrix)));
			thisRoom.getWhiteUser().sendMessage(new TextMessage(boardRecord(matrix)));
			//black, white의 행동 가능 여부 계산 ->black,white 행동불가시 게임종료, white 행동불가시 black턴, white 행동가능시 white턴
			String turnOverMsg = getClickable(matrix, "white",0);
			if(turnOverMsg.equals("gameend")){
				thisRoom.setGameStatus(2);
				rooms.put(received[0],thisRoom);
				turnOverMsg = turnOverMsg + endGame(received[0]);
			}
			thisRoom.getBlackUser().sendMessage(new TextMessage(turnOverMsg));
			thisRoom.getWhiteUser().sendMessage(new TextMessage(turnOverMsg));
		}
		else if(received[0]!=null&&received[1].equals("white")){
			//white의 턴 넘김 메시지 받음 ex) 3:white:41
			int idx = Integer.parseInt(received[2]);
			int x = (idx-1)/8; int y = (idx-1)%8;
			Room thisRoom = rooms.get(received[0]);
			matrix = thisRoom.getMatrix();
			//전부 뒤집은 후에 새 돌 삽입
			flipStone(matrix, x, y, "white");
			matrix[x][y] = 2;
			thisRoom.setMatrix(matrix);
			//현재 배열 프린트
			thisRoom.getBlackUser().sendMessage(new TextMessage(boardRecord(matrix)));
			thisRoom.getWhiteUser().sendMessage(new TextMessage(boardRecord(matrix)));
			//black, white의 행동 가능 여부 계산 ->black,white 행동불가시 게임종료, black 행동불가시 white턴, black 행동가능시 black턴
			String turnOverMsg = getClickable(matrix, "black",0);
			if(turnOverMsg.equals("gameend")){
				thisRoom.setGameStatus(2);
				rooms.put(received[0],thisRoom);
				turnOverMsg = turnOverMsg + endGame(received[0]);
			}
			thisRoom.getBlackUser().sendMessage(new TextMessage(turnOverMsg));
			thisRoom.getWhiteUser().sendMessage(new TextMessage(turnOverMsg));
		}else if(received[0]!=null&&received[1].equals("character")){
			//3:character:black:1
			Room thisRoom = rooms.get(received[0]);
			String charMsg = "character:"+received[2]+":";
			charMsg = charMsg + gameDao.getCharacter(Integer.parseInt(received[3]));
			thisRoom.getBlackUser().sendMessage(new TextMessage(charMsg));
			thisRoom.getWhiteUser().sendMessage(new TextMessage(charMsg));
		}
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		session.sendMessage(new TextMessage("안녕 성공적으로 서버와 연결되었어!"));
		System.out.println("연결됨");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session,
			CloseStatus status) throws Exception {
		
		//탈주, 방 퇴장 처리
		Set<String> keys = rooms.keySet();
		for(String key:keys){
			if(rooms.get(key).getBlackUser()==session){
				//탈주자가 블랙 [runaway]:[black]
				//[탈주] [게임 시작 전, 종료 후 퇴장] 여부에 따른 처리
				System.out.println(key+"번 방 블랙 유저 퇴장");
				//0,2 ->leave, 1->runaway
				String action="";
				if(rooms.get(key).getGameStatus()==1){
					action = "runaway";
					List<Gamer> gamer = gameDao.getCurGamer(Integer.parseInt(key));
					gameDao.gainExp(new User(gamer.get(0).getUserId(),1));
					gameDao.gainExp(new User(gamer.get(1).getUserId(),10));
				}else{
					action = "leave";
				}
				Gamer gamer = new Gamer();
				gamer.setRoomId(Integer.parseInt(key));
				gamer.setUserSide("black");
				gameDao.deleteRoom(gamer);
				
				if(rooms.get(key).getWhiteUser()!=null){
					rooms.get(key).getWhiteUser().sendMessage(new TextMessage(action+":black"));
				}rooms.remove(key); //흑은 방장이므로 탈주시 방이 깨진다.
				
			}else if(rooms.get(key).getWhiteUser()==session){
				//탈주자가 화이트 [runaway]:[white]
				System.out.println(key+"번 방 화이트 유저 퇴장");
				String action="";
				
				Gamer gamer = new Gamer();
				gamer.setRoomId(Integer.parseInt(key));
				gamer.setUserSide("white");
				
				if(rooms.get(key).getGameStatus()==1){
					action = "runaway";
					List<Gamer> gamers = gameDao.getCurGamer(Integer.parseInt(key));
					gameDao.gainExp(new User(gamers.get(0).getUserId(),10));
					gameDao.gainExp(new User(gamers.get(1).getUserId(),1));
					gamer.setUserSide("black"); //전체 유저를 날리기 위한 조치
					gameDao.gamerOut(gamer);
					gameDao.deleteRoom(gamer);
					System.out.println("냐냐냐냠");
				}else{
					rooms.get(key).setWhiteUser(null);
					action = "leave";
					gameDao.gamerOut(gamer);
				}
				if(rooms.get(key).getBlackUser()!=null){
					rooms.get(key).getBlackUser().sendMessage(new TextMessage(action+":white"));
					if(action.equals("runaway")){
						rooms.remove(key);
					}
				}
				
			}
		}
		System.out.println("연결 끊김");
	}
	
	public String boardRecord(int[][] matrix){
		//백흑 양쪽으로 board:black:1:4:7,... white:3,8,...등을 보낸다.
		String black = "black";
		String white = ":white";
		for(int i=0;i<8;i++){
			for(int j=0;j<8;j++){
				if(matrix[i][j]==1){
					black = black+":"+(i*8+j);
				}else if(matrix[i][j]==2){
					white = white+":"+(i*8+j);
				}
			}
		}
		return black+white;
	}
	
	public String endGame(String roomId){
		matrix = rooms.get(roomId).getMatrix();
		int bScore = 0; int wScore = 0;
		int bExp = 0; int wExp = 0;
		for(int i=0;i<8;i++){
			for(int j=0;j<8;j++){
				if(matrix[i][j]==1){
					bScore++;
				}else if(matrix[i][j]==2){
					wScore++;
				}
			}
		}
		//승패 처리
		if(bScore == wScore){
			bExp = (bScore/10) + 10;
			wExp = (wScore/10) + 10;
		}else if(bScore > wScore){
			bExp = (bScore/10) + 10;
			wExp = 1;
		}else{
			wExp = (bScore/10) + 10;
			bExp = 1;
		}
		List<Gamer> gamer = gameDao.getCurGamer(Integer.parseInt(roomId));
		gameDao.gainExp(new User(gamer.get(0).getUserId(),bExp));
		gameDao.gainExp(new User(gamer.get(1).getUserId(),wExp));
		return ":"+bScore+":"+wScore;
	}
	
	public void flipStone(int[][] matrix, int x, int y, String side){
		if(side.equals("black")){
			
			//left-top
			int counter=0;
			int tempX; int tempY;
			if(x>1&&y>1){
				tempX = x; tempY= y;
				while(tempX-1>=0&&tempY-1>=0&&counter!=-1){
					switch(matrix[tempX-1][tempY-1]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x-k][y-k] = 1;
								} counter=-1;
							} break;
					case 2: counter++; break;
					}
					tempX--; tempY--;
				}
			}
			
			//right-top
			counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
			if(x>1&&y<6){
				tempX = x; tempY= y;
				while(tempX-1>=0&&tempY+1<8&&counter!=-1){
					switch(matrix[tempX-1][tempY+1]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x-k][y+k] = 1;
								} counter=-1;
							} break;
					case 2: counter++; break;
					}
					tempX--; tempY++;
				}
			}
			
			//right-bottom
			counter=0;
			if(x<6&&y<6){
				tempX = x; tempY= y;
				while(tempX+1<8&&tempY+1<8&&counter!=-1){
					switch(matrix[tempX+1][tempY+1]){
					case 0: counter=-1;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x+k][y+k] = 1;
								} counter=-1; break;
							} break;
					case 2: counter++; break;
					}
					tempX++; tempY++;
				}
			}

			//left-bottom
			counter=0;
			if(x<6&&y>1){
				tempX = x; tempY= y;
				while(tempX+1<8&&tempY-1>=0&&counter!=-1){
					switch(matrix[tempX+1][tempY-1]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x+k][y-k] = 1;
								} counter=-1;
							} break;
					case 2: counter++; break;
					}
					tempX++; tempY--;
				}
			}
			
			//left
			counter=0;
			if(y>1){
				tempY= y;
				while(tempY-1>=0&&counter!=-1){
					switch(matrix[x][tempY-1]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x][y-k] = 1;
								} counter=-1;
							} break;
					case 2: counter++; break;
					}
					tempY--;
				}
			}
			
			//right
			counter=0;
			if(y<6){
				tempY= y;
				while(tempY+1<8&&counter!=-1){
					switch(matrix[x][tempY+1]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x][y+k] = 1;
								} counter=-1;
							} break;
					case 2: counter++; break;
					}
					tempY++;
				}
			}
			//top
			counter=0;
			if(x>1){
				tempX= x;
				while(tempX-1>=0&&counter!=-1){
					switch(matrix[tempX-1][y]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x-k][y] = 1;
								} counter=-1;
							} break;
					case 2: counter++; break;
					}
					tempX--;
				}
			}
			//bottom
			counter=0;
			if(x<6){
				tempX= x;
				while(tempX+1<8&&counter!=-1){
					switch(matrix[tempX+1][y]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x+k][y] = 1;
								} counter=-1;
							} break;
					case 2: counter++; break;
					}
					tempX++;
				}
			}
			
		}else if(side.equals("white")){
			
			//left-top
			int counter=0;
			int tempX; int tempY;
			if(x>1&&y>1){
				tempX = x; tempY= y;
				while(tempX-1>=0&&tempY-1>=0&&counter!=-1){
					switch(matrix[tempX-1][tempY-1]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x-k][y-k] = 2;
								} counter=-1;
							} break;
					case 1: counter++; break;
					}
					tempX--; tempY--;
				}
			}
			
			//right-top
			counter=0;
			if(x>1&&y<6){
				tempX = x; tempY= y;
				while(tempX-1>=0&&tempY+1<8&&counter!=-1){
					switch(matrix[tempX-1][tempY+1]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x-k][y+k] = 2;
								} counter=-1;
							} break;
					case 1: counter++; break;
					}
					tempX--; tempY++;
				}
			}
			
			//right-bottom
			counter=0;
			if(x<6&&y<6){
				tempX = x; tempY= y;
				while(tempX+1<8&&tempY+1<8&&counter!=-1){
					switch(matrix[tempX+1][tempY+1]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x+k][y+k] = 2;
								} counter=-1;
							} break;
					case 1: counter++; break;
					}
					tempX++; tempY++;
				}
			}

			//left-bottom
			counter=0;
			if(x<6&&y>1){
				tempX = x; tempY= y;
				while(tempX+1<8&&tempY-1>=0&&counter!=-1){
					switch(matrix[tempX+1][tempY-1]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x+k][y-k] = 2;
								} counter=-1;
							} break;
					case 1: counter++; break;
					}
					tempX++; tempY--;
				}
			}
			
			//left
			counter=0;
			if(y>1){
				tempY= y;
				while(tempY-1>=0&&counter!=-1){
					switch(matrix[x][tempY-1]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x][y-k] = 2;
								} counter=-1;
							} break;
					case 1: counter++; break;
					}
					tempY--;
				}
			}
			
			//right
			counter=0;
			if(y<6){
				tempY= y;
				while(tempY+1<8&&counter!=-1){
					switch(matrix[x][tempY+1]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x][y+k] = 2;
								} counter=-1;
							} break;
					case 1: counter++; break;
					}
					tempY++;
				}
			}
			//top
			counter=0;
			if(x>1){
				tempX= x;
				while(tempX-1>=0&&counter!=-1){
					switch(matrix[tempX-1][y]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x-k][y] = 2;
								} counter=-1;
							} break;
					case 1: counter++; break;
					}
					tempX--;
				}
			}
			//bottom
			counter=0;
			if(x<6){
				tempX= x;
				while(tempX+1<8&&counter!=-1){
					switch(matrix[tempX+1][y]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x+k][y] = 2;
								} counter=-1;
							} break;
					case 1: counter++; break;
					}
					tempX++;
				}
			}
		}
	}//flipStone() end

	
	public String getClickable(int[][] matrix, String side, int endCnt){
		String clickableMsg="clickable";
		//클릭 가능 위치 계산
		int counter=0;
		int tempX; int tempY;
		int clickable[][] = {
				{0,0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0,0}
		};
		
		
		if(side.equals("black")){
			clickableMsg = clickableMsg+":black";
			//left-top
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX-1>=0&&tempY-1>=0&&counter!=-1){
							switch(matrix[tempX-1][tempY-1]){
							case 0: counter =-1;
									break;
							case 1:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 2:
								counter=1;
								break;
							}
							tempX--; tempY--;
						}//end while()
					}
					counter=0;
				}
			}
			//right-top
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX-1>=0&&tempY+1<8&&counter!=-1){
							switch(matrix[tempX-1][tempY+1]){
							case 0: counter =-1;
									break;
							case 1:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 2:
								counter=1;
								break;
							}
							tempX--; tempY++;
						}//end while()
					}
					counter=0;
				}
			}
			//right-bottom
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX+1<8&&tempY+1<8&&counter!=-1){
							switch(matrix[tempX+1][tempY+1]){
							case 0: counter =-1;
									break;
							case 1:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 2:
								counter=1;
								break;
							}
							tempX++; tempY++;
						}//end while()
					}
					counter=0;
				}
			}
			//left-bottom
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX+1<8&&tempY-1>=0&&counter!=-1){
							switch(matrix[tempX+1][tempY-1]){
							case 0: counter =-1;
									break;
							case 1:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 2:
								counter=1;
								break;
							}
							tempX++; tempY--;
						}//end while()
					}
					counter=0;
				}
			}
			
			//left
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempY-1>=0&&counter!=-1){
							switch(matrix[tempX][tempY-1]){
							case 0: counter =-1;
									break;
							case 1:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 2:
								counter=1;
								break;
							}
							tempY--;
						}//end while()
					}
					counter=0;
				}
			}
			//top
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX-1>=0&&counter!=-1){
							switch(matrix[tempX-1][tempY]){
							case 0: counter =-1;
									break;
							case 1:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 2:
								counter=1;
								break;
							}
							tempX--;
						}//end while()
					}
					counter=0;
				}
			}
			//right
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempY+1<8&&counter!=-1){
							switch(matrix[tempX][tempY+1]){
							case 0: counter =-1;
									break;
							case 1:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 2:
								counter=1;
								break;
							}
							tempY++;
						}//end while()
					}
					counter=0;
				}
			}
			//bottom
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX+1<8&&counter!=-1){
							switch(matrix[tempX+1][tempY]){
							case 0: counter =-1;
									break;
							case 1:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 2:
								counter=1;
								break;
							}
							tempX++;
						}//end while()
					}
					counter=0;
				}
			}
			//클릭할 것이 없으면 게임 종료 여부 판정함
			if(clickableMsg.equals("clickable:black")){
				if(endCnt==1){
					clickableMsg = "gameend";
//					for(int i=0;i<8;i++){
//						for(int j=0;j<8;j++){
//							
//						}
//					}
				}else{
					clickableMsg = getClickable(matrix, "white", 1);
				}
			}
		}else if(side.equals("white")){
			clickableMsg = clickableMsg+":white";
			//left-top
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX-1>=0&&tempY-1>=0&&counter!=-1){
							switch(matrix[tempX-1][tempY-1]){
							case 0: counter =-1;
									break;
							case 2:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 1:
								counter=1;
								break;
							}
							tempX--; tempY--;
						}//end while()
					}
					counter=0;
				}
			}
			//right-top
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX-1>=0&&tempY+1<8&&counter!=-1){
							switch(matrix[tempX-1][tempY+1]){
							case 0: counter =-1;
									break;
							case 2:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 1:
								counter=1;
								break;
							}
							tempX--; tempY++;
						}//end while()
					}
					counter=0;
				}
			}
			//right-bottom
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX+1<8&&tempY+1<8&&counter!=-1){
							switch(matrix[tempX+1][tempY+1]){
							case 0: counter =-1;
									break;
							case 2:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 1:
								counter=1;
								break;
							}
							tempX++; tempY++;
						}//end while()
					}
					counter=0;
				}
			}
			//left-bottom
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX+1<8&&tempY-1>=0&&counter!=-1){
							switch(matrix[tempX+1][tempY-1]){
							case 0: counter =-1;
									break;
							case 2:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 1:
								counter=1;
								break;
							}
							tempX++; tempY--;
						}//end while()
					}
					counter=0;
				}
			}
			
			//left
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempY-1>=0&&counter!=-1){
							switch(matrix[tempX][tempY-1]){
							case 0: counter =-1;
									break;
							case 2:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 1:
								counter=1;
								break;
							}
							tempY--;
						}//end while()
					}
					counter=0;
				}
			}
			//top
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX-1>=0&&counter!=-1){
							switch(matrix[tempX-1][tempY]){
							case 0: counter =-1;
									break;
							case 2:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 1:
								counter=1;
								break;
							}
							tempX--;
						}//end while()
					}
					counter=0;
				}
			}
			//right
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempY+1<8&&counter!=-1){
							switch(matrix[tempX][tempY+1]){
							case 0: counter =-1;
									break;
							case 2:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 1:
								counter=1;
								break;
							}
							tempY++;
						}//end while()
					}
					counter=0;
				}
			}
			//bottom
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX+1<8&&counter!=-1){
							switch(matrix[tempX+1][tempY]){
							case 0: counter =-1;
									break;
							case 2:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 1:
								counter=1;
								break;
							}
							tempX++;
						}//end while()
					}
					counter=0;
				}
			}
			if(clickableMsg.equals("clickable:white")){
				if(endCnt==1){
					clickableMsg = "gameend";
				}else{
					clickableMsg = getClickable(matrix, "black", 1);
				}
			}
		}
		return clickableMsg;
	}
}
