package com.zouensi.service;

import java.sql.SQLException;
import java.util.List;

import com.zouensi.dao.AjaxDao;

public class AjaxService {
	private AjaxDao dao = new AjaxDao();
	public List<Object> findInfo(String info) throws SQLException {
		List<Object> listStr = dao.findInfo(info);
		return listStr;
	}

}
