package com.xcxcxz.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xcxcxz.mapper.TimeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class TimeMapperTests {
	@Autowired
	private TimeMapper timeMapper;
	
	@Test
	public void testGetTime1() {
		System.out.println(timeMapper.getTime1());
	}
	
	@Test
	public void testGetTime2() {
		System.out.println(timeMapper.getTime2());
	}


}
