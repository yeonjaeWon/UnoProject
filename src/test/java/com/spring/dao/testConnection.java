package com.spring.dao;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:com/spring/context/root-context.xml")
public class testConnection {

   @Autowired
   private DataSource dataSource;
   private Connection conn;
   
   
   @Before
   public void init() throws SQLException{
      conn=dataSource.getConnection();
   }
   
   
   
   @Test
   public void testConnect() {
      
      Assert.assertNotNull(conn);
   }
   
   @After 
   public void destory() throws SQLException{
      
      conn.close();
   }
   
   
}