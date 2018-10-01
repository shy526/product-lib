package top.ccxh.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.context.annotation.ApplicationScope;
import tk.mybatis.spring.annotation.MapperScan;


import java.util.concurrent.CountDownLatch;

/**
 * Hello world!
 *
 */
@SpringBootApplication
@MapperScan("top.ccxh.mapper.port")

@ComponentScan(value={"top.ccxh.service","top.ccxh.web"})
public class ApplicationAction {

    public static void main(String[] args) {
        SpringApplication.run(ApplicationAction.class, args);
    }


}
