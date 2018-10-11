package top.ccxh.web.config.init;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;
import top.ccxh.web.util.ExecSqlHelp;

/**
 *  应用初始化操作
 * @author admin
 */
@Component
public class ApplicationRunnerImpl implements ApplicationRunner {
    @Value("${spring.datasource.url}")
    private String url;
    @Value("${spring.datasource.username}")
    private String userName;
    @Value("${spring.datasource.password}")
    private String password;
   @Value("${spring.datasource.driver-class-name}")
    private String driver;
    @Value("${config.file.local.sql-path}")
    private String sqlPath;
    @Override
    public void run(ApplicationArguments applicationArguments) throws Exception {
        ExecSqlHelp.exec(url,driver,userName,password,sqlPath);
    }
}
