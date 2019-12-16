package parkjieun.othellow.game.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import parkjieun.othellow.game.domain.Gamer;
import parkjieun.othellow.game.domain.Lobby;
import parkjieun.othellow.game.service.GameService;

@Controller
public class GameController {
	@Autowired GameService gameService;
	
	@RequestMapping("game/lobby")
	public String lobby(){
		return "game/lobby";
	}
	
	@RequestMapping("game/room/{roomNo}")
	public String room(@PathVariable("roomNo")String roomNo,Model model){
		model.addAttribute("roomNo", roomNo);
		return "game/room";
	}
	
	@RequestMapping("game/listlobby")
	@ResponseBody
	public List<Lobby> listLobby(){
		return gameService.listLobby();
	}
	
	@RequestMapping("game/makeRoom")
	@ResponseBody
	public int makeRoom(Lobby lobby, Gamer gamer){
		return gameService.makeRoom(lobby, gamer);
	}
	
	@RequestMapping("game/joinRoom")
	@ResponseBody
	public int joinRoom(int roomId, Gamer gamer){
		return gameService.joinRoom(roomId, gamer);
	}
	
	@RequestMapping("game/startGame")
	@ResponseBody
	public int startGame(int roomNo){
		return gameService.startGame(roomNo);
	}
	
}
