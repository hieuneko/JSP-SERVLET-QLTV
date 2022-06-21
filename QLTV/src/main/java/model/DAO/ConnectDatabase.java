package model.DAO;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class ConnectDatabase {
	
	public static Connection getMySQLConnection() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/manage_library?useUnicode=true&characterEncoding=UTF-8","root","");
		if (conn != null) {
			System.out.println("Ket noi thanh cong");
			conn.setCharacterEncoding("utf-8");
			return conn;
		}
		return null;
	}
}
