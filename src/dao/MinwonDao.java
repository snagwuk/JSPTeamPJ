package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Like;
import model.Minwon;
import util.JdbcUtil;

public class MinwonDao
{
    
    private static MinwonDao instance = new MinwonDao();
    
    public static MinwonDao getInstance()
    {
        return instance;
    }
    
    private MinwonDao()
    {
    }
    
    private Connection getConnection() throws Exception
    {
        
        Connection conn = null;
        String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
        String dbId = "scott";
        String dbPass = "1111";
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
        return conn;
    }
    
    public void insertMinwon(Minwon minwon)
    {
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int num = 0;
        
        try
        {
            
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("select ifnull(max(num)+1,1) from gminwon");
            rs = pstmt.executeQuery();
            
            if (rs.next())
            {
                num = rs.getInt(1);
            } // <- boardser.nextval
            
            pstmt = conn
                    .prepareStatement("insert into gminwon values (?,?,?,now(),0,?,'','',now() )");
            
            pstmt.setInt(1, num);
            pstmt.setString(2, minwon.getSubject());
            pstmt.setString(3, minwon.getId());
            pstmt.setString(4, minwon.getContent());
            
            pstmt.executeUpdate();
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
        
    }
    
    public int getArticleCount()
    {
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;
        
        try
        {
            
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("select ifnull(count(*),0) from gminwon");
            // mysql에서는 nvl 못 읽어서 ifnull로 해야함
            
            rs = pstmt.executeQuery();
            if (rs.next())
            {
                count = rs.getInt(1);
            }
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
        return count;
        
    }
    
    public List<Minwon> getArticles(int startRow, int endRow)
    {
        
        List<Minwon> articleList = null;
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        List<Like> result = getListLikeCount();
        
        startRow = startRow - 1;
        endRow = endRow - startRow;
        
        try
        {
            
            conn = getConnection();
            
            pstmt = conn
                    .prepareStatement("select * from gminwon order by num desc limit ?,?");
            
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);
            
            rs = pstmt.executeQuery();
            
            if (rs.next())
            {
                
                articleList = new ArrayList<Minwon>();
                int count = 0;
                
                do
                {
                    count = 0;
                    for (Like like : result)
                    {
                        if (rs.getInt("num") == like.getNum())
                        {  
                            count = like.getCount();
                        }
                    }
                    Minwon minwon = new Minwon(rs.getInt("num"),
                            rs.getString("ans_check"), rs.getString("subject"),
                            rs.getString("id"), rs.getTimestamp("article_date"),
                            rs.getInt("read_cnt"), rs.getString("content"),
                            count);
                    
                    articleList.add(minwon);
                    
                } while (rs.next());
            }
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
        return articleList;
        
    }
    
    public List<Minwon> getArticles(String id)
    {
        
        List<Minwon> myList = null;
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        List<Like> result = getListLikeCount();
        
        try
        {
            
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("select * from gminwon where id = ? order by num desc");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if (rs.next())
            {
                
                myList = new ArrayList<Minwon>();
                int count = 0;
                do
                {
                    
                    count = 0;
                    for (Like like : result)
                    {
                        if (rs.getInt("num") == like.getNum())
                            count = like.getCount();
                    }
                    Minwon minwon = new Minwon(rs.getInt("num"),
                            rs.getString("ans_check"), rs.getString("subject"),
                            rs.getString("id"), rs.getTimestamp("article_date"),
                            rs.getInt("read_cnt"), rs.getString("content"),
                            count);
                    
                    myList.add(minwon);
                    
                } while (rs.next());
            }
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
        return myList;
        
    }
    
    public Minwon getArticle(int num,boolean check)
    {
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Minwon article = null;
        
        try
        {
            
            conn = getConnection();
            if(check)
            {
                pstmt = conn.prepareStatement("update gminwon set read_cnt = read_cnt+1 where num = ? ");
                pstmt.setInt(1, num);
                pstmt.executeUpdate(); // 조회수 늘리기
            }
            
            pstmt = conn
                    .prepareStatement("select * from gminwon where num = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            
            if (rs.next())
            {
                
                article = new Minwon(rs.getInt("num"), rs.getString("subject"),
                        rs.getString("id"), rs.getTimestamp("article_date"),
                        rs.getInt("read_cnt"), rs.getString("content"),
                        rs.getString("ans_content"),
                        rs.getTimestamp("ans_date"), rs.getString("ans_check"));
            }
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
        return article;
        
    }
    
    public void AnswerArticle(Minwon article)
    {
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try
        {
            
            conn = getConnection();
            
            pstmt = conn
                    .prepareStatement("update gminwon set ans_content=?, ans_check='1' , ans_date=now() where num=?");
            
            pstmt.setString(1, article.getAns_content());
            pstmt.setInt(2, article.getNum());
            pstmt.executeUpdate();
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
        
    }
    
    public void updateContent(Minwon article) throws Exception
    {
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try
        {
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("update gminwon set subject=?, content=? where num=?");
            
            pstmt.setString(1, article.getSubject());
            pstmt.setString(2, article.getContent());
            
            pstmt.setInt(3, article.getNum());
            
            pstmt.executeUpdate();
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
        
    }
    
    public void deleteArticle(int num)
    {
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try
        {
            conn = getConnection();
            pstmt = conn.prepareStatement("delete from gminwon where num=?");
            pstmt.setInt(1, num);
            
            pstmt.executeUpdate();
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
    }
    
    public void insertLike(Like like)
    { // 좋아요
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        int num = like.getNum();
        String id = like.getId();
        
        try
        {
            
            conn = getConnection();
            pstmt = conn.prepareStatement("insert into glike values(?,?)");
            pstmt.setInt(1, num);
            pstmt.setString(2, id);
            
            pstmt.executeUpdate();
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
    }
    
    public int checkLike(Like like)
    { // 좋아요
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        int result = 0; // 0일때는 중복 값이 없는 상태(insert 가능)
        
        int num = like.getNum();
        String id = like.getId();
        
        try
        {
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("select count(*) from glike where num=? and id=?");
            pstmt.setInt(1, num);
            pstmt.setString(2, id);
            
            rs = pstmt.executeQuery();
            
            if (rs.next())
            {
                result = rs.getInt(1); // 중복 있을 때
                
            }
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
        return result;
    }
    
    public void deleteLike(Like like)
    { // 좋아요 취소
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        int num = like.getNum();
        String id = like.getId();
        
        try
        {
            
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("delete from glike where num=? and id=?");
            pstmt.setInt(1, num);
            pstmt.setString(2, id);
            
            pstmt.executeUpdate();
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
    }
    
    public int getLikeCount(int num)
    {
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        int count = 0;
        
        try
        {
            
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("select ifnull(count(*),0) from glike where num=?");
            pstmt.setInt(1, num);
            
            rs = pstmt.executeQuery();
            
            if (rs.next())
            {
                count = rs.getInt(1);
            }
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
        return count;
        
    }
    
    public List<Like> getListLikeCount()
    {
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Like> result = new ArrayList<>();
        
        try
        {
            
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("select num, count(num) from glike group by num");
            
            rs = pstmt.executeQuery();
            
            if (rs.next())
            {
                while (rs.next())
                {
                    result.add(new Like(rs.getInt(1), rs.getInt(2)));
                }
            }
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
        return result;
        
    }
    
}