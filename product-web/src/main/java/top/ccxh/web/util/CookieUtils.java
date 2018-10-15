package top.ccxh.web.util;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;


/**
 * cookieUtils 操作
 * @author admin
 */
public class CookieUtils {
    /**
     *  获取当前
     * @param name
     * @return
     */
    public static String getCookie(String name){
        RequestAttributes ra = RequestContextHolder.currentRequestAttributes();
        ServletRequestAttributes sra = (ServletRequestAttributes) ra;
        HttpServletRequest request = sra.getRequest();
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie:cookies){
            if (name.equals(cookie.getName())){
                return cookie.getValue();
            }
        }
        return null;
    }
}
