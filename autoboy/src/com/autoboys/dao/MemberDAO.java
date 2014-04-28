package com.autoboys.dao;

import java.util.List;
import com.autoboys.domain.Member;

public interface MemberDAO {
	public void saveOrUpdateMember(Member member);
	public List<Member> listMember();
	public List<Member> listMember(Integer typeId);
	public Member queryMemberById(Long memberId);
	public Member queryMemberByMobilePhone(String mobilePhone);
	public Member queryByNickName(String mobilePhone);
	public Member queryByUserName(String userName);
	public void deleteMember(Long memberId);
	public List<Member> listMemberByPro(Long pid);
	public int modifyPassword(Member member);
	public int updateAvatar(Member member);
	public int qryMemberByKeywordCnt(int typeId, String keyword);
	public List<Member> qryMemberByKeywordList(int typeId, String keyword,int pageNo ,int pageSize);
	public int disableUser(long id ,int status);
	public boolean checkUserPasswordMatch(Member mb) ;
}
