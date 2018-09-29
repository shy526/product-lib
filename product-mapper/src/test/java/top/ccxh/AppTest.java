package top.ccxh;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.ccxh.mapper.port.ImgResourceMapper;

/**
 * Unit test for simple App.
 */
public class AppTest extends BaseTest{
    /**
     * Rigorous Test :-)
     */
    @Autowired
    ImgResourceMapper erpImgMapper;
    @Test
    public void shouldAnswerWithTrue() {
        System.out.println("erpImgMapper = " + erpImgMapper);
    }
}
