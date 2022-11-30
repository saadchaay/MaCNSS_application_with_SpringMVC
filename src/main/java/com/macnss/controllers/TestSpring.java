package com.macnss.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestSpring {

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String pageSpring(ModelMap modelMap){
        modelMap.addAttribute("message", "hello first message");
        return "testSpring";
    }

}
