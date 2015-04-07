package com.attitude.common.utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

/**
 * Created by zh.xu on 14-6-10.
 * HttpResponse http相应流工具
 */
public class HttpResponseUtil {

    /**
     * 向http响应流中写入AsyncResponseJson对象
     */
    public static void writeAsyncResponseJsonToResponse(HttpServletResponse response, AsyncResponseJson asyncResponseJson){
        Gson gson = new GsonBuilder().create();
        String json = gson.toJson(asyncResponseJson);

        writeTextToResponse(response, json);
    }

    /**
     * 将文本信息写入http响应流
     *
     * @param response http响应流
     * @param text 写入的信息
     */
    public static void writeTextToResponse(HttpServletResponse response, String text){

        try {
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(text);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }
    }

    public static void writeImageToResponse(HttpServletResponse response, byte[] dataImg){
        response.setContentType("image/jpeg");
        try{
            OutputStream os = response.getOutputStream();
            os.write(dataImg);
            os.flush();
        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }
    }

    /**
     * 向响应流中写入表示错误的文本（设置响应流的状态码为900，同时写入错误文本）
     *
     * @param response 响应流
     * @param error 待写入的错误文本
     */
    public static void writeErrorTextToResponse(HttpServletResponse response, String error){
        try {
            response.setStatus(900);
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(error);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }
    }

    /**
     * 向响应流中写入html页面
     *
     * @param response 响应流
     * @param html 页面
     */
    public static void writeHtmlToResponse(HttpServletResponse response, String html){
        try {
            response.setCharacterEncoding("UTF-8");
            StringBuilder builder = new StringBuilder();
            builder.append("<html>");
            builder.append("<head>");
            builder.append("<body>");
            builder.append(html);
            builder.append("</body>");
            builder.append("</html>");
            response.getWriter().write(builder.toString());
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }
    }
}
