package top.ccxh.web.controller.restful;

import com.alibaba.druid.sql.visitor.functions.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import top.ccxh.mapper.pojo.Accesskey;
import top.ccxh.mapper.pojo.PageModel;
import top.ccxh.service.AccessKeyService;
import top.ccxh.web.pojo.Result;

import java.util.List;

/**
 * @author admin
 */
@RestController
@RequestMapping("access")
public class AccessKeyController {

    @Autowired
    AccessKeyService accessKeyService;
    @RequestMapping("limit")
    public Result mpageAccesslimit(@RequestBody PageModel pageModel) {
        if (pageModel != null && pageModel.getPageNumber() != null && pageModel.getPageSize() != null) {
            return Result.ok(accessKeyService.limitPage(pageModel));
        }
        return Result.error();
    }
    @RequestMapping("update/status")
    public Result updateStatus(Integer id,Integer status){
        if (id!=null&&status!=null&&id!=1&&id!=2){
            return Result.is(accessKeyService.updateAccessKeyStatus(id,status));
        }
        return Result.error();
    }

    @RequestMapping("update/manager")
    public Result updateManger(Accesskey accesskey){
        if (accesskey.getId()!=null&&accesskey.getManagerPower()!=null&&accesskey.getId()!=1&&accesskey.getId()!=2){
            return Result.is(accessKeyService.updateByPrimaryKeySelective(accesskey));
        }
        return Result.error();
    }

    @RequestMapping("update/access")
    public Result updateAccess(Accesskey accesskey){
        if (accesskey.getId()!=null&&accesskey.getAccessPower()!=null&&accesskey.getId()!=1&&accesskey.getId()!=2){
            return Result.is(accessKeyService.updateByPrimaryKeySelective(accesskey));
        }
        return Result.error();
    }

    @RequestMapping("delete")
    @ResponseBody
    public Result deleteIds(@RequestParam(value="ids[]") List<Integer > ids){
        if(accessKeyService.bathDeleteAccessKeyByid(ids)) {
            return Result.ok();
        }
        return Result.error();
    }
}
