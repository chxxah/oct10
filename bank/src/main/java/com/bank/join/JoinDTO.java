package com.bank.join;

public class JoinDTO {
	private String mid, mpw, mname, mbirth, maddr, mgender, maccount;
	private int mapw;
	
	
	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}


	public String getMbirth() {
		return mbirth;
	}

	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}

	public String getMaddr() {
		return maddr;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}

	public String getMgender() {
		return mgender;
	}

	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

	public String getMaccount() {
		return maccount;
	}

	public void setMaccount(String maccount) {
		this.maccount = maccount;
	}

	public int getMapw() {
		return mapw;
	}

	public void setMapw(int mapw) {
		this.mapw = mapw;
	}
	public static void main(String[] args) {
		String a = (int)(Math.random()*899+100)+ "-" +(int)(Math.random()*89999+10000) + "-" + (int)(Math.random()*899+100)+ "-" + (int)(Math.random()*89+10);
		System.out.println(a);
	}

}