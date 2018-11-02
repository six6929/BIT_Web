package com.bc.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//MyBatis 사용해서 작업할 SqlSession 객체를 만들어 줄
//SqlSessionFactory 객체 생성을 위한 클래스
public class DBService {
	private static SqlSessionFactory factory;
	
	//static 초기화 구문
	static {
		try {
			/* config.xml에서 정보를 읽어 SqlSessionFactory 객체 생성
			//1.MyBatis 설정파일(configuration) 위치
			String config = "com/study/mybatis/config.xml";
			//2.config 파일을 읽을 수 있는 reader 객체 생성
			Reader reader = Resources.getResourceAsReader(config);
			//3.config 파일 정보를 이용해서 SqlSessionFactory 객체 생성
			SqlSessionFactoryBuilder sqlSessionFactoryBuilder 
				= new SqlSessionFactoryBuilder();
			factory = sqlSessionFactoryBuilder.build(reader);
			
			//factory = new SqlSessionFactoryBuilder().build(reader);
			*********************************/
			
			factory = new SqlSessionFactoryBuilder()
					.build(Resources.getResourceAsReader("com/bc/mybatis/config.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//factory 요청하면 제공하는 메소드
	public static SqlSessionFactory getFactory() {
		return factory;
	}
	
}








