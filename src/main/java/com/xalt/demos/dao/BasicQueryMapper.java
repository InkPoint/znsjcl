package com.xalt.demos.dao;

import com.ts.model.PaginatedVO;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 17-11-1
 * Time: 下午5:05
 */
public interface BasicQueryMapper {
    //创建新表
    int createtable(@Param("tabname") String tabname);

    //修改表名
    int altertablename(@Param("oldtablename") String oldtabname,@Param("newtabname") String newtabname);


    PaginatedVO selectPaginated(Map<String,Object> param,int offset,int limit);


}
