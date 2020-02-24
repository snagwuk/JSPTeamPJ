package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.Location;
import model.Rent;
import mybatis.AbstractRepository;
import util.JdbcUtil;

public class MybatisRentDao extends AbstractRepository
{
    private final String namespace = "mybatis.Rent";
    
    private static MybatisRentDao instance = new MybatisRentDao();
    
    public static MybatisRentDao getInstance()
    {
        return instance;
    }
    
    private MybatisRentDao()
    {
    }
    
    public void insert(Rent reservation)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            int no = sqlSession.selectOne(namespace + ".insertRent_num");
            System.out.println(no);
            reservation.setNo(no);
            sqlSession.insert(namespace + ".insertRent", reservation);
            System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡ");
            sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    // 승인/거절
    public void adminAnswer(Rent rent)
    {
        // 0 미답변 , 1 승인 , 2 반려
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            if (rent.getStatus() == 1) rent.setReason("");
            
            sqlSession.update(namespace + ".adminAnswer", rent);
            sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public Rent getRent(int no)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectOne(namespace + ".getRent", no);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public int getRentCount()
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectOne(namespace + ".getRentCount");
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public List<Rent> getRentList(int startRow, int endRow)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        
        startRow = startRow - 1;
        endRow = endRow - startRow;
        
        Map map = new HashMap();
        map.put("startRow", startRow);
        map.put("endRow", endRow);
        
        try
        {
            return sqlSession.selectList(namespace + ".getRentList", map);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public List<Rent> getMyList(String id)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectList(namespace + ".getMyList", id);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public void deleteRent(int no)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            sqlSession.delete(namespace + ".deleteRent", no);
            sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public int duplication(Rent newRent)
    {
        // result 0=중복없음,작성가능 1= 중복있음 인설트 불가
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        
        try
        {
            return sqlSession.selectOne(namespace + ".duplication", newRent);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public List<Rent> getAdminList()
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectList(namespace + ".getAdminRentList");
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public List<Location> selectList()
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectList(namespace + ".selectList");
        }
        finally
        {
            sqlSession.close();
        }
    }

    public void deleteLocation(String locationCode)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            sqlSession.delete(namespace + ".deleteLocation",locationCode);
            sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public void insertLocation(Location location)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            sqlSession.insert(namespace + ".insertLocation",location);
            sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
}
