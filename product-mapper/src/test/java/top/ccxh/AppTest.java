package top.ccxh;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.ccxh.mapper.port.ErpImgMapper;

/**
 * Unit test for simple App.
 */
public class AppTest extends BaseTest{
    /**
     * Rigorous Test :-)
     */
    @Autowired
    ErpImgMapper erpImgMapper;
    @Test
    public void shouldAnswerWithTrue() {
        System.out.println("erpImgMapper = " + erpImgMapper);
    }
}
