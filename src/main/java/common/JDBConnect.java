package common;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBConnect {
  private static final String DB_PATH = "D:\\GitHub\\DEV\\public-wifi\\DB\\public-wifi.db";

  private static Connection connection;

  private JDBConnect() {}

  public static Connection getConnection() {
    if (connection == null) {
      try {
        Class.forName("org.sqlite.JDBC");
        connection = DriverManager.getConnection("jdbc:sqlite:" + DB_PATH);
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
    return connection;
  }

  public static void closeConnection() {
    if (connection != null) {
      try {
        connection.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
  }
}
