package dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import model.Course;
import model.Trainer;
import mybatis.AbstractRepository;
import model.Apply;


public class MybatisCourseDao extends AbstractRepository
{
    private final String namespace = "mybatis.Course";
    
    private static MybatisCourseDao instance = new MybatisCourseDao();
    
    public static MybatisCourseDao getInstance()
    {
        return instance;
    }
    
    private MybatisCourseDao()
    {
    }
    
    public Apply selectById(String id)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectOne(namespace + ".selectApplyById", id);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public Course selectCourseByCode(String code)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectOne(namespace + ".selectCourseByCode", code);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public Trainer selectTainerByCode(String code)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectOne(namespace + ".selectTainerByCode",
                                        code);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public void insert(Apply gprogram_person)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            sqlSession.insert(namespace + ".insertApply", gprogram_person);
            sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public List<Course> select()
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectList(namespace + ".selectCourse");
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public List<Apply> myprogramcodes(String id)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectList(namespace + ".myprogramcodes", id);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public List<Course> selectProgramsByCode(List<Apply> list)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        List<Course> result = new ArrayList<>();
        try
        {
            for (Apply myapply : list)
            {
                String code = myapply.getCode();
                Course temp = sqlSession
                        .selectOne(namespace + ".selectCourseByCode", code);
                result.add(temp);
            }
        }
        finally
        {
            sqlSession.close();
        }
        return result;
    }
    
    public void insertGrade(Apply apply)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            sqlSession.insert(namespace + ".insertGrade", apply);
            sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public int applyDuplicate(Apply applyInfo)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectOne(namespace + ".applyDuplicate", applyInfo);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public int getGrade(String code, String id)
    {
        Map map = new HashMap();
        map.put("id", id);
        map.put("code", code);
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectOne(namespace + ".getGrade", map);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    /// 관리자모드
    
    public List<Trainer> getTrainerList()
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectList(namespace + ".getTrainerList");
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public void trainernew(Trainer trainer)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            sqlSession.insert(namespace + ".trainernew", trainer);
            sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public void trainerdelete(String train_code)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            sqlSession.delete(namespace + ".trainerdelete", train_code);
            sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
}
