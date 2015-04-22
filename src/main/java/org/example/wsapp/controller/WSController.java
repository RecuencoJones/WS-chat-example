package org.example.wsapp.controller;

import org.example.wsapp.vo.Message;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by david on 21/04/2015.
 */
@Controller
public class WSController {
    @MessageMapping("/say")
    @SendTo("/topic/said")
    public Message say(Message message) throws Exception {
        return message;
    }
    
    @RequestMapping("/start")
    public String start() {
        return "start";
    }
}
