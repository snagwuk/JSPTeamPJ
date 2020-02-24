package dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import model.Like;
import model.Minwon;
import mybatis.AbstractRepository;

public class MybatisMinwonDao extends AbstractRepository
{
    private final String namespace = "mybatis.Minwon";
    private static MybatisMinwonDao instance = new MybatisMinwonDao();
    
    public static MybatisMinwonDao getInstance()
    {
        return instance;
    }
    
    private MybatisMinwonDao()
    {
    }
 
    public void insertMinwon(Minwon minwon)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            int num = sqlSession.selectOne(namespace + ".insertMinwon_num");
            minwon.setNum(num);
            sqlSession.insert(namespace + ".insertMinwon",minwon); 
            sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public int getArticleCount()
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectOne(namespace + ".getArticleCount");
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public List<Minwon> getArticles(int startRow, int endRow)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        startRow = startRow - 1;
        endRow = endRow - startRow;
        Map map = new HashMap();
        map.put("startRow", startRow);
        map.put("endRow", endRow);
        
        List<Like> likeList = getListLikeCount();
        List<Minwon> result = new ArrayList<>();
        try
        {
            List<Minwon> articleList = sqlSession.selectList(namespace + ".getArticles_limit",map);
            int count = 0;
            for(Minwon x : articleList)
            {
                count = 0;
                for (Like like : likeList)
                {
                    if (x.getNum() == like.getNum()) 
                        count = like.getCount();
                }
                result.add(new Minwon(x,count));
            }
            
            return result;
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public List<Minwon> getArticles(String id)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
           return sqlSession.selectList(namespace + ".getArticles_id",id);      
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public Minwon getArticle(int num,boolean check)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
           if(check)
           {
               sqlSession.update(namespace + ".gminwon_read",num);  
               sqlSession.commit();
           }
           return sqlSession.selectOne(namespace + ".getArticle",num);   
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public void AnswerArticle(Minwon article)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
               sqlSession.update(namespace + ".AnswerArticle",article);  
               sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public void updateContent(Minwon article) throws Exception
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
               sqlSession.update(namespace + ".updateContent",article);  
               sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public void deleteArticle(int num)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
               sqlSession.delete(namespace + ".deleteArticle",num);  
               sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public void insertLike(Like like)
    { // 좋아요
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
               sqlSession.insert(namespace + ".insertLike",like);  
               sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public int checkLike(Like like)
    { // 좋아요
        
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectOne(namespace + ".checkLike",like);  
        }
        finally
        {
            sqlSession.close();
        }
    }
    public void deleteLike(Like like)
    { // 좋아요 취소
        
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            sqlSession.delete(namespace + ".deleteLike",like);  
            sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public int getLikeCount(int num)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectOne(namespace + ".getLikeCount",num);  
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public List<Like> getListLikeCount()
    {
        
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectList(namespace + ".getListLikeCount");  
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    
    public List<Minwon> getAdminArticles()
    {
        
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectList(namespace + ".getAdminArticles");  
        }
        finally
        {
            sqlSession.close();
        }
    }
    
}