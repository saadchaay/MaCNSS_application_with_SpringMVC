package com.macnss.helpers;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicReference;

public class JsonManagement {

    public static Double readFile(String codeMed){
        AtomicReference<String> price = new AtomicReference<>("0.0");
        JSONParser jsParser = new JSONParser();
        try(FileReader reader = new FileReader("/env/medications.json")){
            Object obj = jsParser.parse(reader);
            JSONArray medList = (JSONArray) obj;
            System.out.println(medList);
            medList.forEach(
                    med -> {
                        if (Objects.equals(getNumber((JSONObject) med), codeMed))
                            price.set(getPrice((JSONObject) med));
                    }
            );
            return Double.valueOf(price.get());
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    public static String getPrice(JSONObject obj){
        JSONObject meds = (JSONObject) obj.get("medication");
        return (String) meds.get("price");
    }

    public static String getNumber(JSONObject obj){
        JSONObject meds = (JSONObject) obj.get("medication");
        return (String) meds.get("number");
    }

}
