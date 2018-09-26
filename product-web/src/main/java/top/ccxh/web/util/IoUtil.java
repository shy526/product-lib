package top.ccxh.web.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import sun.nio.ch.IOUtil;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;

/**
 * @author admin
 */
public class IoUtil {
    private static final Logger LOGGER=LoggerFactory.getLogger(IoUtil.class);
    public static String imgOut(MultipartFile file,String root) {
        if (isImage(file)) {
            try {
                swapOut(file.getInputStream(),getDatePath(root,file.getOriginalFilename()));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return null;
    }

    /**
     * 判断是否为 图片
     *
     * @param file
     * @return
     */
    public static boolean isImage(MultipartFile file) {
        boolean flag = true;
        try {
            if (file == null || file.getSize() <= 0) {
                flag = false;
            }
            InputStream inputStream = file.getInputStream();
            BufferedImage bi = ImageIO.read(inputStream);
            if (bi == null) {
                flag = false;
            }
        } catch (IOException e) {
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }


    /**
     *  in->out 输出转换
     * @param in
     * @param outPath
     * @throws IOException
     */
    public  static  void swapOut(InputStream in, String outPath) throws IOException {
        try ( BufferedInputStream bufIn =new BufferedInputStream(in);OutputStream out=new BufferedOutputStream(new FileOutputStream(outPath))) {
            byte[] data = new byte[1024];
            while (bufIn.read(data) != -1) {
                out.write(data);
            }
        } catch(IOException e) {
          throw e;
        }
    }

    public static String getDatePath(String root, String fileName) {
        LocalDateTime now = LocalDateTime.now();

        Path path = Paths.get(root, String.valueOf(now.getYear()), String.valueOf(now.getMonthValue()), String.valueOf(now.getDayOfMonth()), String.valueOf(now.getHour()), String.valueOf(now.getMinute()));
        File file = path.toFile();
        if (!file.exists()){
            if (!file.mkdirs()){
                LOGGER.error("path create is error");
                return null;
            }
        }
        return Paths.get(path.toString(),reNanoName(fileName)).toString();
    }

    /**
     * 获取一个纳秒级别的名称
     * @param fileName
     * @return
     */
    public  static String reNanoName(String fileName){
        String  suffix = fileName.substring(fileName.lastIndexOf("."));
        StringBuilder name=new StringBuilder(String.valueOf(System.nanoTime()));
         return name.append("-").append(((int) Math.random() * 100)).append(suffix).toString();
    }
    /**
     * 关闭流
     * @param steam
     */
    public static void close(Closeable steam){
        try {
            if (steam != null) {
                steam.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            steam=null;
        }
    }
}
