package com.xalt.utils;

import com.ts.persistence.dao.DelegateMapper;

import java.util.concurrent.ThreadFactory;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 18-1-5
 * Time: 下午5:57
 */
public class MyThreadFactory implements ThreadFactory {
    private DelegateMapper dm;
    public     MyThreadFactory(DelegateMapper delegateMapper){
              this.dm=delegateMapper;
    }
    @Override
    public Thread newThread(Runnable r) {
        return new Thread(r);  //To change body of implemented methods use File | Settings | File Templates.
    }

    public DelegateMapper getDm() {
        return dm;
    }

    public void setDm(DelegateMapper dm) {
        this.dm = dm;
    }
}
