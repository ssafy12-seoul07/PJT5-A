package model.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	// mydb와 연결할 url
	private final String url = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC";
	// ssafy ssafy 알잘딱
	private final String username = "ssafy";
	private final String password = "ssafy";

	private final String driverName = "com.mysql.cj.jdbc.Driver";

	private static DBUtil instance = new DBUtil();

	private DBUtil() {
		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static DBUtil getInstance() {
		return instance;
	}

	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, username, password);
	}

	public void close(AutoCloseable... closeables) {
		for (AutoCloseable c : closeables) {
			if (c != null) {
				try {
					c.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
