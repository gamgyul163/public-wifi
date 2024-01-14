package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import common.JDBConnect;
import dto.WifiDTO;

public class WifiDAO {
  public static Connection connection = JDBConnect.getConnection();
  public static ResultSet resultSet;
  public static PreparedStatement preparedStatement;

  public int createWifi(WifiDTO[] wifi) {
    preparedStatement = null;

    int count = 0;
    try {
      connection.setAutoCommit(false);

      String sql = "INSERT OR REPLACE INTO wifi "
          + "(x_swifi_mgr_no, x_swifi_wrdofc, x_swifi_main_nm, x_swifi_adres1, x_swifi_adres2,x_swifi_instl_floor, x_swifi_instl_ty,"
          + " x_swifi_instl_mby, x_swifi_svc_se, x_swifi_cmcwr,x_swifi_cnstc_year, x_swifi_inout_door, x_swifi_remars3, lat, lnt, work_dttm)"
          + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

      preparedStatement = connection.prepareStatement(sql);

      for (int i = 0; i < wifi.length; i++) {

        preparedStatement.setString(1, wifi[i].getMgrNo());
        preparedStatement.setString(2, wifi[i].getWrdofc());
        preparedStatement.setString(3, wifi[i].getName());
        preparedStatement.setString(4, wifi[i].getAddress1());
        preparedStatement.setString(5, wifi[i].getAddress2());
        preparedStatement.setString(6, wifi[i].getInstlFloor());
        preparedStatement.setString(7, wifi[i].getInstlTy());
        preparedStatement.setString(8, wifi[i].getInstlMby());
        preparedStatement.setString(9, wifi[i].getSvcSe());
        preparedStatement.setString(10, wifi[i].getCmcwr());
        preparedStatement.setString(11, wifi[i].getCnstcYear());
        preparedStatement.setString(12, wifi[i].getInoutDoor());
        preparedStatement.setString(13, wifi[i].getRemars3());
        preparedStatement.setDouble(14, wifi[i].getLat());
        preparedStatement.setDouble(15, wifi[i].getLnt());
        preparedStatement.setString(16, wifi[i].getWorkDttm());

        preparedStatement.addBatch();
        preparedStatement.clearParameters();


        if ((i % 1000) == 999) {
          count += preparedStatement.executeBatch().length;
          connection.commit();
          preparedStatement.clearBatch();
        }
      }

      count += preparedStatement.executeBatch().length;
      connection.commit();
      preparedStatement.clearBatch();
      connection.setAutoCommit(true);

    } catch (Exception e) {
      e.printStackTrace();

      try {
        connection.rollback();
      } catch (Exception e2) {
        e2.printStackTrace();
      }
    }
    return count;
  }

  public List<WifiDTO> getNearbyWifiList(double lat, double lnt, int size) {

    preparedStatement = null;
    resultSet = null;

    List<WifiDTO> wifiList = new ArrayList<>();

    try {
      String sql =
          "SELECT *, 6371*ACOS(COS(RADIANS(?))*COS(RADIANS(lat))*COS(RADIANS(lnt)-RADIANS(?))+SIN(RADIANS(?))*SIN(RADIANS(lat))) AS distance FROM wifi ORDER BY distance LIMIT (?);";

      preparedStatement = connection.prepareStatement(sql);
      preparedStatement.setDouble(1, lat);
      preparedStatement.setDouble(2, lnt);
      preparedStatement.setDouble(3, lat);
      preparedStatement.setInt(4, size);

      resultSet = preparedStatement.executeQuery();

      while (resultSet.next()) {
        WifiDTO wifiDTO = WifiDTO.builder().distance(resultSet.getDouble("distance"))
            .mgrNo(resultSet.getString("x_swifi_mgr_no"))
            .wrdofc(resultSet.getString("x_swifi_wrdofc"))
            .name(resultSet.getString("x_swifi_main_nm"))
            .address1(resultSet.getString("x_swifi_adres1"))
            .address2(resultSet.getString("x_swifi_adres2"))
            .instlFloor(resultSet.getString("x_swifi_instl_floor"))
            .instlTy(resultSet.getString("x_swifi_instl_ty"))
            .instlMby(resultSet.getString("x_swifi_instl_mby"))
            .svcSe(resultSet.getString("x_swifi_svc_se"))
            .cmcwr(resultSet.getString("x_swifi_cmcwr"))
            .cnstcYear(resultSet.getString("x_swifi_cnstc_year"))
            .inoutDoor(resultSet.getString("x_swifi_inout_door"))
            .remars3(resultSet.getString("x_swifi_remars3")).lat(resultSet.getDouble("lat"))
            .lnt(resultSet.getDouble("lnt")).workDttm(resultSet.getString("work_dttm")).build();

        wifiList.add(wifiDTO);
      }

    } catch (SQLException e) {
      e.printStackTrace();

    } 
    return wifiList;
  }

  public WifiDTO getWifi(String mgrNo) {

    preparedStatement = null;
    resultSet = null;
    WifiDTO wifiDTO = null;

    try {
      String sql = "SELECT * FROM wifi WHERE x_swifi_mgr_no = (?);";

      preparedStatement = connection.prepareStatement(sql);
      preparedStatement.setString(1, mgrNo);

      resultSet = preparedStatement.executeQuery();
      if (resultSet.next()) {
        wifiDTO = WifiDTO.builder().mgrNo(resultSet.getString("x_swifi_mgr_no"))
            .wrdofc(resultSet.getString("x_swifi_wrdofc"))
            .name(resultSet.getString("x_swifi_main_nm"))
            .address1(resultSet.getString("x_swifi_adres1"))
            .address2(resultSet.getString("x_swifi_adres2"))
            .instlFloor(resultSet.getString("x_swifi_instl_floor"))
            .instlTy(resultSet.getString("x_swifi_instl_ty"))
            .instlMby(resultSet.getString("x_swifi_instl_mby"))
            .svcSe(resultSet.getString("x_swifi_svc_se"))
            .cmcwr(resultSet.getString("x_swifi_cmcwr"))
            .cnstcYear(resultSet.getString("x_swifi_cnstc_year"))
            .inoutDoor(resultSet.getString("x_swifi_inout_door"))
            .remars3(resultSet.getString("x_swifi_remars3")).lat(resultSet.getDouble("lat"))
            .lnt(resultSet.getDouble("lnt")).workDttm(resultSet.getString("work_dttm")).build();
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return wifiDTO;
  }
}
