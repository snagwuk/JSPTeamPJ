package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Rent;
import util.JdbcUtil;

public class RentDao
{
    private static RentDao instance = new RentDao();
    
    public static RentDao getInstance()
    {
        return instance;
    }
    
    private RentDao()
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
    
    @SuppressWarnings("resource")
    public void insert(Rent reservation) throws Exception
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int number = 0;
        
        try
        {
            conn = getConnection();
            pstmt = conn.prepareStatement("select max(no)+1 from gRent");
            rs = pstmt.executeQuery();
            if (rs.next()) number = rs.getInt(1);
            
            pstmt = conn.prepareStatement("insert into gRent values "
                    + "(?,?,?,?,now(),?,?,?,0,'')");
            pstmt.setInt(1, number);
            pstmt.setString(2, reservation.getId());
            pstmt.setString(3, reservation.getName());
            pstmt.setString(4, reservation.getLocation());
            pstmt.setString(5, reservation.getR_date());
            pstmt.setString(6, reservation.getPurpose());
            pstmt.setString(7, reservation.getCapacity());
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
    
    // 승인/거절
    public void adminAnswer(Rent rent) throws Exception
    {
        // 0 미답변 , 1 승인 , 2 반려
        Connection conn = null;
        PreparedStatement pstmt = null;
        String qr = null;
        try
        {
            conn = getConnection();
            if (rent.getStatus() == 1)
            {
                qr = "update gRent set status=1, regDate=now(), reason='' where no = ?";
                pstmt = conn.prepareStatement(qr);
                pstmt.setInt(1, rent.getNo());
            }
            else
            {
                qr = "update gRent set status=2, regDate=now(), reason=? where no = ?";
                
                pstmt = conn.prepareStatement(qr);
                pstmt.setString(1, rent.getReason());
                pstmt.setInt(2, rent.getNo());
            }
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
    
    public Rent getRent(int no)
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Rent rent = null;
        try
        {
            conn = getConnection();
            pstmt = conn.prepareStatement("select * from gRent where no = ? ");
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            
            if (rs.next())
            {
                rent = new Rent(rs.getInt("no"), rs.getString("id"),
                        rs.getString("name"), rs.getString("location"),
                        rs.getTimestamp("regDate"), rs.getString("r_date"),
                        rs.getString("purpose"), rs.getString("capacity"),
                        rs.getInt("status"), rs.getString("reason"));
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
        return rent;
        
    }
    
    public int getRentCount()
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;
        try
        {
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("select ifnull(count(*),0) from grent");
            rs = pstmt.executeQuery();
            if (rs.next()) count = rs.getInt(1); // 컬럼의 순서
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
    
    public List<Rent> getRentList(int startRow, int endRow)
    {
        List<Rent> rentList = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        startRow = startRow - 1;
        endRow = endRow - startRow;
        try
        {
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("select * from gRent order by no desc, no limit ?,?");
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);
            rs = pstmt.executeQuery();
            if (rs.next())
            {
                rentList = new ArrayList<Rent>();
                do
                {
                    Rent rent = new Rent();
                    rent.setNo(rs.getInt("no"));
                    rent.setId(rs.getString("id"));
                    rent.setName(rs.getString("name"));
                    rent.setLocation(rs.getString("location"));
                    rent.setRegDate(rs.getTimestamp("regDate"));
                    rent.setR_date(rs.getString("r_date"));
                    rent.setPurpose(rs.getString("purpose"));
                    rent.setCapacity(rs.getString("capacity"));
                    rent.setStatus(rs.getInt("status"));
                    rent.setReason(rs.getString("reason"));
                    rentList.add(rent);
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
        return rentList;
        
    }
    
    @SuppressWarnings("resource")
    public void deleteRent(int no)
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            conn = getConnection();   
            pstmt = conn.prepareStatement("delete from gRent where no = ?");
            pstmt.setInt(1, no);
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
    
    public int duplication(String location, String r_Date) throws Exception
    {
        // result 0=중복없음,작성가능 1= 중복있음 인설트 불가
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;
        try
        {
            conn = getConnection();
            pstmt = conn
                    .prepareStatement("select * from gRent where location = ? and r_date = ?");
            pstmt.setString(1, location);
            pstmt.setString(2, r_Date);
            rs = pstmt.executeQuery();
            if (rs.next()) 
            {
                if(rs.getInt(1) != 0)
                    result = 1;
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
