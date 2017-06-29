package com.zouensi.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import com.zouensi.utils.DataSourcesUtils;

public class AjaxDao {

	public List<Object> findInfo(String info) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourcesUtils.getDs());
		String sql = "select myKey from myKey where myKey like ?";
		List<Object> listStr = qr.query(sql,new ColumnListHandler(),"%"+info);
		return  listStr;
	}
	
}
