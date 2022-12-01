package com.macnss.controllers;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

@Controller
public class TestSpring {

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String pageSpring(ModelMap modelMap){
        JSONParser jsParser = new JSONParser();
        try(FileReader reader = new FileReader("C:\\Users\\ssaad_chaay\\Desktop\\JAVA Briefs\\SpringMaCNSS\\medications.json")){
            Object obj = jsParser.parse(reader);

            JSONArray medList = (JSONArray) obj;
            System.out.println(medList);
//            medList.forEach(
//                    med -> parseEmployeeObject((JSONObject) med)
//            );
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        modelMap.addAttribute("message", "hello first message");
        return "testSpring";
    }

}
