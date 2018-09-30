package top.ccxh.mapper.port;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import top.ccxh.BaseTest;
import top.ccxh.mapper.pojo.Product;

import java.util.List;

import static org.junit.Assert.*;

public class ProductMapperTest extends BaseTest {
    @Autowired
    ProductMapper productMapper;
    @Test
    public void selectProductAll() {
        List<Product> products = productMapper.selectProductAll();
        System.out.println("products = " + products);
    }
}