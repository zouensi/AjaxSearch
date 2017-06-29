package com.zouensi.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DataSourcesUtils {
	private DataSourcesUtils() {
		
	}
	private static ComboPooledDataSource ds = new ComboPooledDataSource();
	public static ComboPooledDataSource getDs() {
		return ds;
	}
}
