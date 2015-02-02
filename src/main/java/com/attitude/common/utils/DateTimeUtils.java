package com.attitude.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Smomo on 15-2-1.
 */
public class DateTimeUtils {

    public static Date toDate(String dateString) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = sdf.parse(dateString);
            return date;
        } catch (Exception ex) {
            try{
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                Date date = sdf.parse(dateString);
                return date;
            }catch (Exception e){
                return null;
            }
        }
    }

    public static Date toDateTime(String dateString) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = sdf.parse(dateString);

            return date;
        } catch (Exception ex) {
            return null;
        }
    }

    public static String convertToDateTimeString(Date date){
        try{
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String str=sdf.format(date);

            return str;
        }catch (Exception ex) {
            return "";
        }
    }

    public static  String convertToDateString(Date date){
        try{
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String str=sdf.format(date);

            return str;
        }catch (Exception ex) {
            return "";
        }
    }
}
