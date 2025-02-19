package mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public abstract class AbstractRepository {
	private static SqlSessionFactory sqlSessionFactory;
	static {setSqlSessionFactory();}
	private static void setSqlSessionFactory(){
		String resource ="mybatis/mybatis-config.xml";
		InputStream inputStream;
		try{
			inputStream=Resources.getResourceAsStream(resource);
		}catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	protected SqlSessionFactory getSqlSessionFactory(){
		return sqlSessionFactory;
	}
}
