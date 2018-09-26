package top.ccxh.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;


import java.util.concurrent.CountDownLatch;

/**
 * Hello world!
 *
 */
@SpringBootApplication
@MapperScan("top.ccxh.mapper.port")
public class ApplicationAction {

    public static void main(String[] args) {
        SpringApplication.run(ApplicationAction.class, args);
    }


}
