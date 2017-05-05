package cn.wdn.obf.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.jdbc.log.LogFactory;

//登陆拦截器
public class MyInterceptor implements HandlerInterceptor{ 
	private static Logger logger = Logger.getLogger("userTrack");
    @Override  
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,  
            Object handler) throws Exception {  
          
        //获取请求的url  
        String url=request.getRequestURI();  
        //判断url是否是公开地址
        if(url.indexOf("LoginUI")>=0||url.indexOf("checkUser")>=0||url.indexOf("register")>=0||url.indexOf("salerLogin")>=0||url.indexOf("adminLogin")>=0){  
            //如果要进行登录提交，放行  
            return true;  
        }  
        //判断session  
        HttpSession session=request.getSession();  
        //从session中取出用户份信息  
        String userName=(String)session.getAttribute("userName");  
        if(userName==null){  
        	if (request.getHeader("x-requested-with") != null && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")){ 
                //如果是ajax请求响应头会有，x-requested-with  
                System.out.print("发生ajax请求...");
                return true;
        	}
        } else {
        	logger.info("the user " + userName + " using "+ url + " page");
        	return true;
        }
          
        //执行这里表示用户身份需要验证，跳转到登录界面  
        response.sendRedirect(request.getContextPath() + "/LoginUI");  
        return false;  
    }  
      
    @Override  
    public void postHandle(HttpServletRequest request, HttpServletResponse response,  
            Object handler, ModelAndView modelAndView) throws Exception {  
          
//        System.out.println("postHandle");  
          
    }  
      
    //执行Handler完成执行此方法  
    //应用场景：统一异常处理，统一日志处理  
    @Override  
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,  
            Object handler, Exception ex)  
            throws Exception {  
          
//        System.out.println("afterHandle");  
          
    }

}  