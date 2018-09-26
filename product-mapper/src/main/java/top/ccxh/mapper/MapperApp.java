package top.ccxh.mapper;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan("top.ccxh.mapper.port")
public class MapperApp {
    public static void main(String[] args) {
        SpringApplication.run(MapperApp.class, args);
    }


}
