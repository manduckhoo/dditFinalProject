package kr.or.onesome.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@GetMapping("/chatRoom")
	public String chatRoom() {
		return "chat/chatting/chatRoom";
	}
}
