package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.member.vo.MemberDetailVO;
import kr.ac.kopo.util.ConnectionFactory;



public class MemberDAO {
	
	public List<MemberDetailVO> selectAll(){
		
		List<MemberDetailVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select");
		sql.append(" ID,NAME,PASSWORD,EMAIL_ID,EMAIL_DOMAIN,TEL1,TEL2,TEL3,POST,BASIC_ADDR,DETAIL_ADDR,TYPE,REG_DATE");
		sql.append(" from t_member");
		sql.append(" order by reg_date desc");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				){
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {				
				String type = rs.getString("type");
				String name = rs.getString("NAME");
				String id = rs.getString("ID");
				String emailDomain = rs.getString("EMAIL_DOMAIN");
				String emailId = rs.getString("EMAIL_ID");
				String tel1 = rs.getString("TEL1");
				String tel2 = rs.getString("TEL2");
				String tel3 = rs.getString("TEL3");
				String basicAddr = rs.getString("BASIC_ADDR");
				String detailAddr = rs.getString("DETAIL_ADDR");
				String post = rs.getString("POST");
				String regDate = rs.getString("REG_DATE");
				String password = rs.getString("PASSWORD");
				MemberDetailVO memberDetail = new MemberDetailVO(name, id, emailDomain,emailId,tel1,tel2,tel3,basicAddr, detailAddr, post, regDate , type , password); 
				list.add(memberDetail);				
			}									
		} catch(Exception e) {
			e.printStackTrace();
		}		
		return list;
	}


	
	public MemberDetailVO selectOne(String name) {
		StringBuilder sql = new StringBuilder();
		sql.append("select");
		sql.append(" ID,NAME,PASSWORD,EMAIL_ID,EMAIL_DOMAIN,TEL1,TEL2,TEL3,POST,BASIC_ADDR,DETAIL_ADDR,TYPE,REG_DATE");
		sql.append(" from t_member");
		sql.append(" where name = ?");
		MemberDetailVO memberDetail = null;
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				) {
			pstmt.setString(1, name);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			memberDetail = new MemberDetailVO();
			memberDetail.setName(rs.getString("NAME"));
			memberDetail.setId(rs.getString("ID"));
			memberDetail.setEmailDomain(rs.getString("EMAIL_DOMAIN"));
			memberDetail.setEmailId(rs.getString("EMAIL_ID"));
			memberDetail.setTel1(rs.getString("TEL1"));
			memberDetail.setTel2(rs.getString( "TEL2"));
			memberDetail.setTel3(rs.getString( "TEL3"));
			memberDetail.setBasicAddr(rs.getString("BASIC_ADDR"));
			memberDetail.setDetailAddr(rs.getString("DETAIL_ADDR"));
			memberDetail.setPost(rs.getString("POST"));
			memberDetail.setRegDate(rs.getString("REG_DATE"));
			memberDetail.setType(rs.getString("TYPE"));	
			memberDetail.setPassword(rs.getString("PASSWORD"));
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return memberDetail;
	}
	

}
