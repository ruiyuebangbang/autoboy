package com.autoboys.dao;

import java.sql.CallableStatement;
import java.sql.Types;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SQLQuery;
import com.autoboys.domain.Member;
import com.autoboys.domain.ProviderRegion;
import com.autoboys.util.ProxoolConnection;
import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;

public class MemberDAOImpl implements MemberDAO {
	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	/**
	 * Used to save or update a member.
	 */
	public void saveOrUpdateMember(Member member) {
		try {
			session.saveOrUpdate(member);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
			System.out.println(e.toString());
		}
	}
	/**
	 * Used to delete a member.
	 */
	
	public void deleteMember(Long memberId) {
		try {
			Member member = (Member) session.get(Member.class, memberId);
			session.delete(member);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}
	
	/**
	 * Used to list all the members.
	 */
	@SuppressWarnings("unchecked")
	public List<Member> listMember() {
		List<Member> courses = null;
		try {
			courses = session.createQuery("from Member").list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}
	
	@SuppressWarnings("unchecked")
	public List<Member> listMember(Integer typeId) {
		List<Member> courses = null;
		try {
			Query q = session.createSQLQuery("select * from Member where classification=?").addEntity(Member.class);
			q.setInteger(0, typeId);
			courses = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}
	
	/**
	 * Used to list all the members.
	 */
	@SuppressWarnings("unchecked")
	public List<Member> listMemberByPro(Long pid) {
		List<Member> courses = null;
		try {
			// 
			Query q = session.createSQLQuery("select * from Member where provider_id=?").addEntity(Member.class);
			q.setLong(0, pid);
			courses = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}

	/**
	 * Used to query a single member by Id.
	 */
	
	public Member queryMemberById(Long memberId) {
		Member member = null;
		try {
			member = (Member) session.get(Member.class, memberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	/**
	 * Used to query a single member by mobile phone.
	 */
	
	public Member queryMemberByMobilePhone(String mobilePhone) {
		try {
			SQLQuery query = session.createSQLQuery("select * from member where mobiephone = ?");
			query.setParameter(0,mobilePhone);
			query.addEntity(Member.class);
			List<Member> members = query.list();
			if(members.size() ==0){
				return null;
			}else{
				return members.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	/**
	 * 
	 */
	public Member queryByNickName(String nickName) {
		try {
			SQLQuery query = session.createSQLQuery("select * from member where nickname = ?");
			query.setParameter(0,nickName);
			query.addEntity(Member.class);
			List<Member> members = query.list();
			if(members.size() ==0){
				return null;
			}else{
				return members.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public Member queryByUserName(String userName) {
		try {
			SQLQuery query = session.createSQLQuery("select * from member where MOBIEPHONE = ? or email = ?");
			query.setParameter(0,userName);
			query.setParameter(1,userName);
			query.addEntity(Member.class);
			List<Member> members = query.list();
			if(members.size() ==0){
				return null;
			}else{
				return members.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
	}
	
	public int modifyPassword(Member member) {
		int ret = 0;
		try {
			session.beginTransaction();  
			Query query = session.createSQLQuery("update Member t set t.password=? where id = ?");
			query.setString(0, member.getPassword());
			query.setLong(1,member.getId());
			ret = query.executeUpdate();  
			session.getTransaction().commit();  

		} catch (Exception e) {
			e.printStackTrace();		
		}
		return ret;
	}
	
	public int updateAvatar(Member member) {
		int ret = 0;
		try {
			session.beginTransaction();  
			Query query = session.createSQLQuery("update Member t set t.avatar =? where id = ?");
			query.setString(0, member.getAvatar());
			query.setLong(1,member.getId());
			ret = query.executeUpdate();  
			session.getTransaction().commit();  

		} catch (Exception e) {
			e.printStackTrace();		
		}
		return ret;
	}
	
	
	public int qryMemberByKeywordCnt(int typeId, String keyword) {
		int ret = 0;
		try {
			if(keyword !=null &&!"".equals(keyword)) {
				Query q = session.createSQLQuery("select count(1) from member where CLASSIFICATION=? and (MOBIEPHONE like ? or nickname like ? or email like ?)");
				q.setInteger(0,typeId);
				q.setString(1, "%"+keyword + "%");
				q.setString(2, "%"+keyword + "%");
				q.setString(3, "%"+keyword + "%");
				ret = ((java.math.BigDecimal)q.uniqueResult()).intValue();
			} else {
				Query q = session.createSQLQuery("select count(1) from member where CLASSIFICATION=?");
				q.setInteger(0,typeId);
				ret = ((java.math.BigDecimal)q.uniqueResult()).intValue();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	
	public List<Member> qryMemberByKeywordList(int typeId, String keyword,int pageNo ,int pageSize) {
		List<Member> courses = null;
		try {
			if(keyword !=null &&!"".equals(keyword)) {
				String sql = "select b.* from (select a.*, rownum rn from (select * from Member where classification=? and (MOBIEPHONE like ? or nickname like ? or email like ?))a where rownum<=?)b where rn>?";
				Query q = session.createSQLQuery(sql).addEntity(Member.class);
				q.setInteger(0, typeId);
				q.setString(1, "%"+keyword + "%");
				q.setString(2, "%"+keyword + "%");
				q.setString(3, "%"+keyword + "%");
				q.setInteger(4,pageNo*pageSize);
				q.setInteger(5,(pageNo-1)*pageSize);
				courses = q.list();
				
			} else {
				String sql = "select b.* from (select a.*, rownum rn from (select * from Member where classification=? )a where rownum<=?)b where rn>?";
				Query q = session.createSQLQuery(sql).addEntity(Member.class);
				q.setInteger(0, typeId);
				q.setInteger(1,pageNo*pageSize);
				q.setInteger(2,(pageNo-1)*pageSize);
				courses = q.list();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}
	
	public int disableUser(long id ,int status) {
		int ret = 0;
		try {
			session.beginTransaction();  
			Query query = session.createSQLQuery("update Member t set IS_DISABLED =? where id = ?");
			query.setInteger(0, status);
			query.setLong(1,id);
			ret = query.executeUpdate();  
			session.getTransaction().commit();  

		} catch (Exception e) {
			e.printStackTrace();		
		}
		return ret;
	}
	
	public boolean checkUserPasswordMatch(Member mb) {
		try {
			SQLQuery query = session.createSQLQuery("select * from member where id=? and password=?");
			query.setParameter(0,mb.getId());
			query.setParameter(1,mb.getPassword());
			query.addEntity(Member.class);
			List<Member> members = query.list();
			if(members.size() ==0){
				return false;
			}else{
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}		
	}
}


