package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import chart.femaleMale;
import chart.nameGrade;
import chart.subjectDataBean;

public class chartDao {

	private static chartDao instance = new chartDao();

	public static chartDao getInstance() { // db연결
		return instance;
	}

	private chartDao() {
	}

	private Connection getConnection() throws Exception {

		Connection conn = null;
		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
		String dbId = "scott";
		String dbPass = "1111";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		return conn;
	}

	public int StudentCountByMonth(int month) { // 월별 총 수강생 구하기

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(c.Course_Period_start) from " + "gapply a, gcourse c "
					+ "where a.code = c.code " + "and substr(c.Course_Period_start,7,1)=?");

			pstmt.setInt(1, month);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			} // 컬럼의 순서
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
		}
		return count;
	}

	public subjectDataBean StudentCountBySubject(int month) { // 월별 과목별 수강생 구하기

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		subjectDataBean tmp = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select c.bigtype, count(c.bigtype) " + "from gapply a, gcourse c "
					+ "where a.code = c.code and substr(c.Course_Period_start,7,1)= ? " + "group by bigtype");
			pstmt.setInt(1, month);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				tmp = new subjectDataBean();
				do {

					if (rs.getString("bigtype").equals("수영")) {
						tmp.setSwimming(rs.getInt(2));
					}

					if (rs.getString("bigtype").equals("파워스피닝")) {
						tmp.setSpinning(rs.getInt(2));
					}

					if (rs.getString("bigtype").equals("헬스")) {
						tmp.setHealth(rs.getInt(2));
					}

				} while (rs.next());
			}

		} catch (Exception ex) {
			ex.printStackTrace();

		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
		}
		return tmp;
	}

	public femaleMale femaleMaleCountByMonth(int month) { // 월별 성별 수

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		femaleMale tmp = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select " + "(select count(m.sex) from gapply a, gcourse c, gmember m "
					+ "where substr(c.Course_Period_start,7,1)=? "
					+ "and a.code = c.code and m.sex=2 and m.id = a.id), "
					+ "(select count(m.sex) from gapply a, gcourse c, gmember m "
					+ "where substr(c.Course_Period_start,7,1)=? "
					+ "and a.code = c.code and m.sex=1 and m.id = a.id)");

			pstmt.setInt(1, month);
			pstmt.setInt(2, month);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				tmp = new femaleMale();

				tmp.setFemale(rs.getInt(1));
				tmp.setMale(rs.getInt(2));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
		}
		return tmp;
	}

	public nameGrade[] trainerRanking() {

		nameGrade[] trList = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select t.name, sum(ifnull(a.grade,0)) grade "
					+ "from gapply a, gcourse c, gtrainer t "
					+ "where a.code = c.code and c.train_code = t.train_code " + "group by t.name order by grade desc");

			rs = pstmt.executeQuery();

			if (rs.next()) {

				trList = new nameGrade[13];
				int i = 0;

				do {
					nameGrade tr = new nameGrade();

					tr.setName(rs.getString(1));
					tr.setGrade(rs.getInt(2));
					trList[i] = tr;
					i++;
					if (i == 12)
						break;
				} while (rs.next());
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
		}
		return trList;

	}

}