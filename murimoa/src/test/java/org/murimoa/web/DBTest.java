package org.murimoa.web;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
    locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DBTest {

    @Test
    public void test1() {
        // 지금처럼 비어있는 내용으로 Test
    }
}
