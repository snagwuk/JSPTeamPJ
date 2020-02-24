package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Course;
import model.Trainer;
import model.Apply;
import util.JdbcUtil;

public class GprogramDao
{
    private static GprogramDao instance = new GprogramDao();
    
    public static GprogramDao getInstance()
    {
        return instance;
    }
    
    private GprogramDao()
    {
    }
    
    private Connection getConnection() throws Exception
    {
        Connection conn = null;
        try
        {
            String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
            String dbId = "scott";
            String dbPass = "1111";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return conn;
    }
    
    public Apply selectById(String id) throws Exception
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            conn = getConnection();
            pstmt = conn.prepareStatement("select * from gapply where id=?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            Apply gprogram_person = null;
            if (rs.next())
            {
                gprogram_person = new Apply(rs.getString("id"),
                        rs.getString("name"), rs.getString("code"));
            }
            return gprogram_person;
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
            
        }
    }
    
    public Course selectCourseByCode(String id) throws Exception
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            conn = getConnection();
            pstmt = conn.prepareStatement("select * from gcourse where code=?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            Course gprogram_person = null;
            if (rs.next())
            {
                gprogram_person = convertGprogram(rs);
            }
            return gprogram_person;
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
            
        }
    }
    
    public Trainer selectTainerByCode(String code) throws Exception
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("select * from gtrainer INNER JOIN gcourse ON gtrainer.train_code = gcourse.train_code where code=?");
            pstmt.setString(1, code);
            rs = pstmt.executeQuery();
            Trainer trainer = null;
            if (rs.next())
            {
                trainer = new Trainer(rs.getString("code"),
                        rs.getString("name"), rs.getString("email"),
                        rs.getString("license"), rs.getString("tel"));
            }
            return trainer;
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
            
        }
    }
    
    public void insert(Apply gprogram_person) throws Exception
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try
        {
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("insert into gapply values(?,?,?,null)");
            pstmt.setString(1, gprogram_person.getId());
            pstmt.setString(2, gprogram_person.getName());
            pstmt.setString(3, gprogram_person.getCode());
            
            pstmt.executeUpdate();
            
        }
        finally
        {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
    }
    
    public List<Course> select() throws Exception
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("select * from gcourse order by code desc");
            rs = pstmt.executeQuery();
            List<Course> result = new ArrayList<>();
            while (rs.next())
            {
                result.add(convertGprogram(rs));
            }
            return result;
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
    }
    
    private Course convertGprogram(ResultSet rs) throws Exception
    {
        return new Course();
    }
    
    public List<Apply> myprogramcodes(String id) throws Exception
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            conn = getConnection();
            pstmt = conn.prepareStatement("select * from gapply where id=?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            List<Apply> result = new ArrayList<>();
            while (rs.next())
            {
                Apply temp = new Apply(rs.getString("id"), rs.getString("name"),
                        rs.getString("code"), rs.getInt("grade"));
                result.add(temp);
            }
            return result;
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
    }
    
    public List<Course> selectProgramsByCode(List<Apply> list) throws Exception
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Course> result = new ArrayList<>();
        int temp = 0;
        try
        {
            conn = getConnection();
            
            for (Apply myapply : list)
            {
                
                pstmt = conn
                        .prepareStatement("select * from gcourse where code=?");
                pstmt.setString(1, myapply.getCode());
                rs = pstmt.executeQuery();
                
                while (rs.next())
                {
                    result.add(convertGprogram(rs));
                }
            }
            
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
        return result;
    }
    
    public void insertGrade(Apply apply) throws Exception
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try
        {
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("update gapply set grade=? where id=? and code=?");
            pstmt.setInt(1, apply.getGrade());
            pstmt.setString(2, apply.getId());
            pstmt.setString(3, apply.getCode());
            
            pstmt.executeUpdate();
            
        }
        finally
        {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
    }
    
    public int applyDuplicate(String id, String code) throws Exception
    {
        int result = 1;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try
        {
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("select * from  gapply where code=? and id=?");
            pstmt.setString(1, code);
            pstmt.setString(2, id);
            
            rs = pstmt.executeQuery();
            if (!rs.next())
            {
                result = 0;// 중복없다
            }
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
        return result;
    }
    
    public int getGrade(String code, String id) throws Exception
    {
        int result = -1; // 0이면 중복아님
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try
        {
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("select grade from  gsurvey where code=? and id=?");
            pstmt.setString(1, code);
            pstmt.setString(2, id);
            
            rs = pstmt.executeQuery();
            if (rs.next())
            {
                result = rs.getInt(1);
            }
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
        return result;
    }
    
    /// 관리자모드
    
    public List<Trainer> getTrainerList() throws Exception
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("select * from gtrainer order by TRAIN_CODE desc");
            rs = pstmt.executeQuery();
            List<Trainer> result = new ArrayList<>();
            while (rs.next())
            {
                result.add(new Trainer(rs.getString("TRAIN_CODE"),
                        rs.getString("name"), rs.getString("email"),
                        rs.getString("license"), rs.getString("tel")));
            }
            return result;
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
    }
    
    public void trainernew(Trainer trainer) throws Exception
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try
        {
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("insert into gtrainer values(?,?,?,?,?)");
            pstmt.setString(1, trainer.getTrain_code());
            pstmt.setString(2, trainer.getName());
            pstmt.setString(3, trainer.getEmail());
            pstmt.setString(4, trainer.getLicense());
            pstmt.setString(5, trainer.getTel());
            pstmt.executeUpdate();
        }
        finally
        {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
    }
    
    public void trainerdelete(String code) throws Exception
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try
        {
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("delete from gtrainer where TRAIN_CODE = ?");
            pstmt.setString(1, code);
            pstmt.executeUpdate();
        }
        finally
        {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
    }
    
    public List<Trainer> selectTrainer() throws Exception
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("select * from gtrainer order by name desc");
            rs = pstmt.executeQuery();
            List<Trainer> result = new ArrayList<>();
            while (rs.next())
            {
                result.add(convertTrainer(rs));
            }
            return result;
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
    }
    
    private Trainer convertTrainer(ResultSet rs) throws Exception
    {
        // 아래는 db명이랑 같게 써야한다.
        return new Trainer(rs.getString("train_code"), rs.getString("name"),
                rs.getString("email"), rs.getString("license"),
                rs.getString("tel"));
    }
    

    public int duplication(String course_location, String course_time, String train_code) throws Exception {
            // result 0=중복없음,작성가능 1= 중복있음 인설트 불가
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            int result = 0;
            try {
                    conn = getConnection();
                    pstmt = conn.prepareStatement("select * from gcourse where course_location = ? and course_time = ? and train_code =?");
                    pstmt.setString(1, course_location);
                    pstmt.setString(2, course_time);
                    pstmt.setString(3, train_code);
                    rs = pstmt.executeQuery();
                    if (rs.next()) {
                            if (rs.getInt(1) != 0)
                                    result = 1;
                    }
            } catch (Exception ex) {
                    ex.printStackTrace();
            } finally {
                    JdbcUtil.close(rs);
                    JdbcUtil.close(pstmt);
                    JdbcUtil.close(conn);
            }
            return result;

    }
    
    @SuppressWarnings("null")
    public void insertCouse(Course course) throws Exception {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                    conn = getConnection();
                    pstmt = conn.prepareStatement(
            "insert into gcourse values (?,?,?,?,?,?,?,?,?,?)");
                    pstmt.setString(1, course.getCode());
                    pstmt.setString(2, course.getBigtype());
                    pstmt.setString(3, course.getCourse());
                    pstmt.setString(4, course.getCourse_time());
                    pstmt.setString(5, course.getCourse_Period_start());
                    pstmt.setString(6, course.getCourse_Period_end());
                    pstmt.setString(7, course.getCourse_location());
                    pstmt.setInt(8, course.getCourse_person());
                    pstmt.setInt(9, course.getPrice());
                    pstmt.setString(10, course.getTrain_code());
                    pstmt.executeUpdate();
            } catch (Exception ex) {
                    ex.printStackTrace();
            } finally {
                    JdbcUtil.close(rs);
                    JdbcUtil.close(pstmt);
                    JdbcUtil.close(conn);
            }

    }
    
    public void deleteCourse(String code) {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                    conn = getConnection();
                    pstmt = conn.prepareStatement("delete from gcourse where code = ?");
                    pstmt.setString(1, code);
                    pstmt.executeUpdate();
            } catch (Exception ex) {
                    ex.printStackTrace();
            } finally {
                    JdbcUtil.close(rs);
                    JdbcUtil.close(pstmt);
                    JdbcUtil.close(conn);
            }
    }
}
