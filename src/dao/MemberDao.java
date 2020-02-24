package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Member;
import util.JdbcUtil;

public class MemberDao
{
    private static MemberDao instance = new MemberDao();
    
    public static MemberDao getInstance()
    {
        return instance;
    }
    
    private MemberDao()
    {
    }
    
    @SuppressWarnings("unused")
    private Connection getConnection() throws Exception
    {
        Connection conn = null;
        try
        {
            String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
            String dbId = "scott";
            String dbpass = "1111";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbpass);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
        return conn;
    }
    
    public Member selectById(String id) throws Exception
    {
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            conn = getConnection();
            pstmt = conn.prepareStatement("select * from gmember where id = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            Member member = null;
            if (rs.next())
            {
                member = new Member(rs.getString("id"), rs.getString("passwd"),
                        rs.getString("name"), rs.getString("birth"),
                        rs.getInt("sex"), rs.getString("phone"),
                        rs.getString("address"), rs.getInt("admin"));
            }
            return member;
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
    }
    
    public void insert(Member mem) throws Exception
    {
        Connection conn = null;
        PreparedStatement pstmt =null;
        try {
            conn = getConnection();
            pstmt = conn
                .prepareStatement("insert into gmember values(?,?,?,?,?,?,?,0)");
        
            pstmt.setString(1, mem.getId());
            pstmt.setString(2, mem.getPasswd());
            pstmt.setString(3, mem.getName());
            pstmt.setString(4, mem.getBirth());
            pstmt.setInt(5, mem.getSex());
            pstmt.setString(6, mem.getPhone());
            pstmt.setString(7, mem.getAddress());
            pstmt.executeUpdate();
        } finally
        {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
    }
    
    public void update(Member mem) throws Exception
    {
        Connection conn = null;
        PreparedStatement pstmt =null;
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement("update gmember set passwd = ? ,  phone = ? , address  = ? where id = ? ");
        
            pstmt.setString(1, mem.getPasswd());
            pstmt.setString(2, mem.getPhone());
            pstmt.setString(3, mem.getAddress());
            pstmt.setString(4, mem.getId());
            pstmt.executeUpdate();
        }finally
        {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
    }
    
    public List<Member> memberList() throws Exception
    {
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Member> members = null;
        try
        {
            conn = getConnection();
            pstmt = conn.prepareStatement("select * from gmember");
            rs = pstmt.executeQuery();
            if (rs.next())
            {
                members = new ArrayList<Member>();
                while(rs.next())
                {
                    members.add(convertMember(rs));
                }
            }
        }
        finally
        {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }
        return members;
    }
    private Member convertMember(ResultSet rs) throws Exception {
        return  new Member(rs.getString("id"), rs.getString("passwd"),
                           rs.getString("name"), rs.getString("birth"),
                           rs.getInt("sex"), rs.getString("phone"),
                           rs.getString("address"), rs.getInt("admin"));
     }
}
