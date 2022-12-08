package com.macnss;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.macnss.helpers.JsonManagement;

public class App {
    public static void main(String[] args) {
        System.out.println(JsonManagement.readFile("531239789"));
    }
}
