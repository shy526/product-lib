package top.ccxh.web.controller.restful;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import top.ccxh.mapper.pojo.PageModel;
import top.ccxh.service.AccessKeyService;
import top.ccxh.web.pojo.Result;

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
}
