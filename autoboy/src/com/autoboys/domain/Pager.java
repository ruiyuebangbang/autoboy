package com.autoboys.domain;

import java.util.ArrayList;

public class Pager {
	int pageCurr=1;//当前页码
	int total ; //总数量
	int pageSize=10;  //每页数量
	

	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPageCurr() {
		return pageCurr;
	}
	public void setPageCurr(int pageCurr) {
		this.pageCurr = pageCurr;
	}
	public int getPageTotal() {
		return (int)Math.ceil(total*1.0/pageSize);
	}

	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public ArrayList<Integer> getPageList() {
		ArrayList<Integer> ret = new ArrayList<Integer>();
		if(getPageTotal()>6) {
			if(pageCurr>3) {
				for(int i=1;i<=6;i++) {
					ret.add(new Integer(pageCurr-3+i));
				}
			} else {
				for(int i=1;i<=6;i++) {
					ret.add(new Integer(i));
				}
			}
		} else {
			for(int i=1;i<=getPageTotal();i++) {
				ret.add(new Integer(i));
			}
		}
		
		return ret;
	}
	
	public int getPagePre() {
		return pageCurr>1?pageCurr-1:1;
	}
	
	public int getPageNext() {
		return pageCurr<getPageTotal()?pageCurr+1:getPageTotal();
	}
}
