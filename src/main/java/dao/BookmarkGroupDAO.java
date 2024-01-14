package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import common.JDBConnect;
import dto.BookmarkGroupDTO;


public class BookmarkGroupDAO {
  private Connection connection = JDBConnect.getConnection();
  private ResultSet resultSet;
  private PreparedStatement preparedStatement;

  public int createBookmarkGroup(BookmarkGroupDTO bookmarkGroupDTO) {
    preparedStatement = null;
    try {
      String sql =
          "INSERT INTO bookmark_group (name, sorting_priority, registration_dttm) VALUES (?, ?, ?);";

      preparedStatement = connection.prepareStatement(sql);

      preparedStatement.setString(1, bookmarkGroupDTO.getName());
      preparedStatement.setInt(2, bookmarkGroupDTO.getSortingPriority());
      preparedStatement.setString(3, bookmarkGroupDTO.getRegistrationDttm());

      return preparedStatement.executeUpdate();

    } catch (Exception e) {
      e.printStackTrace();
      return -1;
    }
  }

  public List<BookmarkGroupDTO> getBookmarkGroupList(String sortingCriteria) {
    preparedStatement = null;
    resultSet = null;
    List<BookmarkGroupDTO> bookmarkGroupList = new ArrayList<>();

    try {
      String sql = "SELECT * FROM bookmark_group ORDER BY " + sortingCriteria + ";";

      preparedStatement = connection.prepareStatement(sql);
      resultSet = preparedStatement.executeQuery();

      while (resultSet.next()) {
        BookmarkGroupDTO bookmarkGroupDTO = BookmarkGroupDTO.builder().id(resultSet.getInt("id"))
            .name(resultSet.getString("name")).sortingPriority(resultSet.getInt("sorting_priority"))
            .registrationDttm(resultSet.getString("registration_DTTM"))
            .modificationDttm(resultSet.getString("modification_DTTM")).build();

        bookmarkGroupList.add(bookmarkGroupDTO);
      }

    } catch (Exception e) {
      e.printStackTrace();
    }
    return bookmarkGroupList;
  }

  public BookmarkGroupDTO getBookmarkGroup(int id) {
    preparedStatement = null;
    resultSet = null;
    BookmarkGroupDTO bookmarkGroupDTO = null;
    try {
      String sql = " SELECT * FROM bookmark_group WHERE id = (?); ";

      preparedStatement = connection.prepareStatement(sql);
      preparedStatement.setInt(1, id);
      resultSet = preparedStatement.executeQuery();

      bookmarkGroupDTO = BookmarkGroupDTO.builder().id(resultSet.getInt("id"))
          .name(resultSet.getString("name")).sortingPriority(resultSet.getInt("sorting_priority"))
          .registrationDttm(resultSet.getString("registration_DTTM"))
          .modificationDttm(resultSet.getString("modification_DTTM")).build();

    } catch (Exception e) {
      e.printStackTrace();
    }
    return bookmarkGroupDTO;
  }

  public int updateBookmarkGroup(BookmarkGroupDTO bookmarkGroupDTO) {
    preparedStatement = null;
    try {
      String sql =
          "UPDATE bookmark_group SET name = (?), sorting_priority = (?), modification_dttm = (?) WHERE id = (?)";

      preparedStatement = connection.prepareStatement(sql);
      preparedStatement.setString(1, bookmarkGroupDTO.getName());
      preparedStatement.setInt(2, bookmarkGroupDTO.getSortingPriority());
      preparedStatement.setString(3, bookmarkGroupDTO.getModificationDttm());
      preparedStatement.setInt(4, bookmarkGroupDTO.getId());

      return preparedStatement.executeUpdate();
    } catch (Exception e) {
      e.printStackTrace();
      return -1;
    }
  }

  public int deleteBookmarkGroup(int id) {
    preparedStatement = null;
    resultSet = null;

    try {
      String sql = "DELETE FROM bookmark_group where id = ? ";

      preparedStatement = connection.prepareStatement(sql);
      preparedStatement.setInt(1, id);
      return preparedStatement.executeUpdate();

    } catch (Exception e) {
      e.printStackTrace();
      return -1;
    }

  }
}
