package pers.pika.center.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pers.pika.center.service.util.SpringContextUtil;

/**
 * @author Jere
 * @create 2018-04-12 23:29
 */

public class UserService_Main {

    private static final Log LOG = LogFactory.getLog(UserService_Main.class);

    public static void main(String[] args) {
        try {
            ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(new String[] { "application/spring-context.xml" });
            // 初始化SpringContextUtil
            SpringContextUtil ctxUtil = new SpringContextUtil();
            ctxUtil.setApplicationContext(context);

            context.start();
            LOG.info("UserService Dubbo Service == context start");

        } catch (Exception e) {
            LOG.error("[pika-center-service-user] == application start error:", e);
            e.printStackTrace();
            return;
        }

        synchronized (UserService_Main.class) {
            while (true) {
                try {
                    UserService_Main.class.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                    LOG.error("== synchronized error:", e);
                }
            }
        }
    }

}
