package kr.co.mlec.util;

import java.sql.Connection;
import java.sql.Statement;

public class JDBCClose {
	
	public static void close(Connection conn, Statement stat) {
		
		if(stat != null) {
			try {
				stat.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(conn != null) {
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
}
