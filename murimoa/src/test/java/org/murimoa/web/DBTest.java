package org.murimoa.web;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.murimoa.dto.SampleDTO;
import org.murimoa.mapper.SampleMapper;
import org.murimoa.mapper.TimeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.java.Log;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
    locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@Log
public class DBTest {
	
    @Autowired
    DataSource ds;
    
    @Test
    public void test1() throws Exception{
        Connection con = ds.getConnection();
        System.out.println(con);
        con.close();
    }
    
    @Inject
    SqlSessionFactory factory;
    
    @Test
    public void test2() {
        System.out.println(factory);
    }
    
    @Inject
    TimeMapper timeMapper;
    
    @Test
    public void test3() {
        System.out.println(timeMapper.getTime());
    }
    
    @Autowired
    private SampleMapper mapper;
    
    @Test
    public void test4() {
        
        log.info("" + mapper);
        
        SampleDTO dto = new SampleDTO();
        dto.setTest("Test" + System.currentTimeMillis());
        mapper.insert(dto);
    }
}
