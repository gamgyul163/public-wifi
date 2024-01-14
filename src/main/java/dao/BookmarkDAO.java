package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import common.JDBConnect;
import dto.BookmarkDTO;

public class BookmarkDAO {
  private Connection connection = JDBConnect.getConnection();
  private ResultSet resultSet;
  private PreparedStatement preparedStatement;

  public int createBookmark(BookmarkDTO bookmarkDTO) {
    preparedStatement = null;
    try {
      String sql =
          "INSERT INTO bookmark (bookmark_group_id, wifi_mgr_no, registration_dttm) VALUES (?, ?, ?);";

      preparedStatement = connection.prepareStatement(sql);

      preparedStatement.setInt(1, bookmarkDTO.getBookmarkGroupId());
      preparedStatement.setString(2, bookmarkDTO.getWifiMgrNo());
      preparedStatement.setString(3, bookmarkDTO.getRegistrationDttm());

      return preparedStatement.executeUpdate();
    } catch (Exception e) {
      e.printStackTrace();
      return -1;
    }
  }

  public List<BookmarkDTO> getBookmarkList() {
    preparedStatement = null;
    resultSet = null;
    List<BookmarkDTO> bookmarkList = new ArrayList<>();

    try {
      String sql =
          " SELECT bookmark.id, bookmark.bookmark_group_id, bookmark.wifi_mgr_no, bookmark.registration_dttm,"
          + " bookmark_group.name AS bookmark_group_name ,wifi.x_swifi_main_nm AS wifi_name FROM bookmark "
              + " JOIN bookmark_group ON bookmark.bookmark_group_id = bookmark_group.id "
              + " JOIN wifi ON bookmark.wifi_mgr_no = wifi.x_swifi_mgr_no "
              + " ORDER BY bookmark.id ;";

      preparedStatement = connection.prepareStatement(sql);
      resultSet = preparedStatement.executeQuery();

      while (resultSet.next()) {
        BookmarkDTO bookmarkDTO = BookmarkDTO.builder().id(resultSet.getInt("id"))
            .bookmarkGroupId(resultSet.getInt("bookmark_group_id"))
            .wifiMgrNo(resultSet.getString("wifi_mgr_no"))
            .registrationDttm(resultSet.getString("registration_dttm"))
            .bookmarkGroupName(resultSet.getString("bookmark_group_name"))
            .wifiName(resultSet.getString("wifi_name")).build();

        bookmarkList.add(bookmarkDTO);
      }

    } catch (Exception e) {
      e.printStackTrace();
    }
    return bookmarkList;
  }

  public BookmarkDTO getBookmark(int id) {
    preparedStatement = null;
    resultSet = null;
    BookmarkDTO bookmarkDTO = null;

    try {
      String sql =
          " SELECT bookmark.id, bookmark.bookmark_group_id, bookmark.wifi_mgr_no, bookmark.registration_dttm,"
              + " bookmark_group.name AS bookmark_group_name ,wifi.x_swifi_main_nm AS wifi_name FROM bookmark "
              + " JOIN bookmark_group ON bookmark.bookmark_group_id = bookmark_group.id "
              + " JOIN wifi ON bookmark.wifi_mgr_no = wifi.x_swifi_mgr_no "
              + " WHERE bookmark.id = (?) ;";

      preparedStatement = connection.prepareStatement(sql);
      preparedStatement.setInt(1, id);
      resultSet = preparedStatement.executeQuery();

      if (resultSet.next()) {
        bookmarkDTO = BookmarkDTO.builder().id(resultSet.getInt("id"))
            .bookmarkGroupId(resultSet.getInt("bookmark_group_id"))
            .wifiMgrNo(resultSet.getString("wifi_mgr_no"))
            .registrationDttm(resultSet.getString("registration_dttm"))
            .bookmarkGroupName(resultSet.getString("bookmark_group_name"))
            .wifiName(resultSet.getString("wifi_name")).build();
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return bookmarkDTO;
  }

  public int deleteBookmark(int id) {
    preparedStatement = null;
    resultSet = null;

    try {
      String sql = "DELETE FROM bookmark WHERE id = (?);";

      preparedStatement = connection.prepareStatement(sql);
      preparedStatement.setInt(1, id);

      return preparedStatement.executeUpdate();

    } catch (Exception e) {
      e.printStackTrace();
      return -1;
    }
  }
}
