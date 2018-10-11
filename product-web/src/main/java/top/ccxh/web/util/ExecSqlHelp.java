package top.ccxh.web.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.jdbc.ScriptRunner;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 * 用于执行sql 文件
 * @author admin
 */
public class ExecSqlHelp {
    private final static Logger LOGGER= LoggerFactory.getLogger(ExecSqlHelp.class);
  public static void exec(String url,String driver,String userName,String pwd,String sqlFilePath){
      LOGGER.info("startExecSql:{}",sqlFilePath);
      Connection conn=null;
      try {
          Class.forName(driver);
           conn = DriverManager.getConnection(url, userName, pwd);
          ScriptRunner runner = new ScriptRunner(conn);
          runner.setAutoCommit(true);
          runner.setFullLineDelimiter(false);
          //间隔符号
          runner.setDelimiter(";");
          //设置是否输出日志
          runner.setLogWriter(new PrintWriter(System.out));
          //设置异常日志
          runner.setErrorLogWriter(new PrintWriter(System.err));
          //出现error中断
          runner.setStopOnError(false);
          //设置字符集
          Resources.setCharset(Charset.forName("utf-8"));
          runner.runScript(new InputStreamReader(new FileInputStream(sqlFilePath),"utf-8"));
      } catch (SQLException e) {
          LOGGER.error("getConnection error");
          throw new RuntimeException(e);
      } catch (UnsupportedEncodingException e) {
          LOGGER.error("sql Encoding error");
          throw new RuntimeException(e);
      } catch (FileNotFoundException e) {
          LOGGER.error("sqlFile not found");
          throw new RuntimeException(e);
      } catch (ClassNotFoundException e) {
          LOGGER.error("sqlDriver not found");
          throw new RuntimeException(e);
      }finally {
          if (conn != null) {
              try {
                  conn.close();
              } catch (SQLException e) {
                  conn=null;
              }
          }
      }
      LOGGER.info("endExecSql");
  }

    public static void main(String[] args) {
      String url="jdbc:mysql://47.52.70.180:3306/erp?characterEncoding=utf8&useSSL=false";
      String driver="com.mysql.jdbc.Driver";
        String userName="root";
        String pwd="sunjiaqing";
        ExecSqlHelp.exec(url,driver,userName,pwd,"D:\\weidian_git\\product-lib\\product-web\\src\\main\\resources\\init.sql");
    }

}
