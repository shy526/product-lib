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
import top.ccxh.service.LegalEnum;
import top.ccxh.web.pojo.Result;
import top.ccxh.web.util.CookieUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 检查权限切面
 * @author admin
 */
@Aspect
@Component
public class CheckPower {
    @Autowired
    AccessKeyService accessKeyService;
    @Pointcut("execution(public * top.ccxh.web.controller.restful.*.*(..)) )")
    public void pointcut(){}

    @Around("pointcut()")
    public Object restful(ProceedingJoinPoint joinPoint){
        Object result =null;
        try {
            String access = CookieUtils.getCookie("access");
            if (StringUtils.isEmpty(access)){
                return Result.error();
            }
            Accesskey accesskey = accessKeyService.selectById(Integer.parseInt(access));
            if (accesskey!=null){
                //拥有用执行权限
                if (accesskey.getManagerPower().equals(LegalEnum.VALID.getCode())){
                    result=joinPoint.proceed();
                }
            }
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        return result;
    }


}
