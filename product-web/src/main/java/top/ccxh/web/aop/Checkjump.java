package top.ccxh.web.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import top.ccxh.mapper.pojo.Accesskey;
import top.ccxh.service.AccessKeyService;
import top.ccxh.web.pojo.Result;
import top.ccxh.web.util.CookieUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * 检查跳转页面时 检查 是否拥有 拥有权限 没有权限 转发至首页
 * @author admin
 */
@Aspect
@Component
public class Checkjump {
    @Autowired
    AccessKeyService accessKeyService;
    @Pointcut("execution(public * top.ccxh.web.controller.jump.*.*(..)) )")
    public void pointcut(){}

    @Around("pointcut()")
    public Object jump(ProceedingJoinPoint joinPoint){
        Object result = "redirect:/";
        try {
            String access = CookieUtils.getCookie("access");
            if (StringUtils.isEmpty(access)){
                return result;
            }
            Accesskey accesskey = accessKeyService.selectById(Integer.parseInt(access));
            if (accesskey!=null){
                //拥有用执行权限
                if (accesskey.getManagerPower()==1){
                    result=joinPoint.proceed();
                }
            }
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        return result;
    }


}
