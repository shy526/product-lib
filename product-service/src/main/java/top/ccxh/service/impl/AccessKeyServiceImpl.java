package top.ccxh.service.impl;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.ccxh.mapper.pojo.Accesskey;
import top.ccxh.mapper.pojo.Power;
import top.ccxh.mapper.port.AccessKeyMapper;
import top.ccxh.service.AccessKeyService;

import java.util.List;

/**
 * @author admin
 */
@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Service
public class AccessKeyServiceImpl extends BaseService implements AccessKeyService  {

    @Autowired
    private AccessKeyMapper accessKeyMapper;
    @Override
    public boolean insertSelective(Accesskey accesskey, List<Power> accessPower){
        accesskey.quickTime();
        accesskey.setAccessPower(JSON.toJSONString(accessPower));
       return judgeInteger( accessKeyMapper.insertSelective(accesskey));
    }
    @Override
    public boolean updateAccessKey(Accesskey accesskey, List<Power> accessPower){
        accesskey.quickTime();
        accesskey.setAccessPower(JSON.toJSONString(accessPower));
       return judgeInteger( accessKeyMapper.updateByPrimaryKey(accesskey));
    }
    @Override
    public boolean updateAccessKeyStatus(Integer id, Integer status){
        return judgeInteger( accessKeyMapper.updateStatus(id,status));
    }

    @Override
    public boolean deleteAccessKeyByid(Integer id){
        return judgeInteger( accessKeyMapper.deleteByPrimaryKey(id));
    }

    @Override
    public List<Accesskey> selectAll() {
        return  accessKeyMapper.selectAll();
    }

    @Override
    public boolean bathDeleteAccessKeyByid(List<Integer> ids) {
        accessKeyMapper.bathDelete( ids);
        return false;
    }

    @Override
    public Accesskey selectByName(String accessKey) {
        return  accessKeyMapper.selectByName( accessKey);
    }

    @Override
    public Accesskey selectById(int id) {
        return accessKeyMapper.selectByPrimaryKey(id);
    }


}
