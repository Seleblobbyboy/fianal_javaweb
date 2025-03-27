package com.example.webtoon.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class ThaiDateConverter {
    public static String convertToThaiDate(Date date) {

        SimpleDateFormat thaiDateFormat = new SimpleDateFormat(
            "d MMMM yyyy", 
            new Locale("th", "TH")
        );
        
        return thaiDateFormat.format(date);
    }
}