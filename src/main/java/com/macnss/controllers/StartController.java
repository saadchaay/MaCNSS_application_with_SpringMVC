package com.macnss.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("test")
public class StartController {

    @RequestMapping("sessionTest")
    public String test(Map<String, Object> model){
        model.put("session", "sssssssssssss");
        return "/testSpring";
    }
}
