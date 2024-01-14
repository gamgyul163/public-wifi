package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import common.JDBConnect;
import dto.SearchHistoryDTO;

public class SearchHistoryDAO {
  public static Connection connection = JDBConnect.getConnection();
  public static ResultSet resultSet;
  public static PreparedStatement preparedStatement;

  public boolean createSearchHistory(SearchHistoryDTO searchHistoryDTO) {
    preparedStatement = null;
    try {
      String sql = "INSERT INTO search_history (lat, lnt, search_dttm) VALUES (?, ?, ?);";

      preparedStatement = connection.prepareStatement(sql);

      preparedStatement.setDouble(1, searchHistoryDTO.getLat());
      preparedStatement.setDouble(2, searchHistoryDTO.getLnt());
      preparedStatement.setString(3, searchHistoryDTO.getSearchDttm());

      preparedStatement.execute();

      return true;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

  public List<SearchHistoryDTO> getSearchHistoryList() {
    preparedStatement = null;
    resultSet = null;
    List<SearchHistoryDTO> searchHistoryList = new ArrayList<>();

    try {
      String sql = "SELECT * FROM search_history;";

      preparedStatement = connection.prepareStatement(sql);
      resultSet = preparedStatement.executeQuery();

      while (resultSet.next()) {
        SearchHistoryDTO searchHistoryDTO = SearchHistoryDTO.builder().id(resultSet.getInt("id"))
            .lat(resultSet.getDouble("lat")).lnt(resultSet.getDouble("lnt"))
            .searchDttm(resultSet.getString("search_dttm")).build();

        searchHistoryList.add(searchHistoryDTO);
      }

    } catch (Exception e) {
      e.printStackTrace();
    }

    return searchHistoryList;
  }

  public int deleteSearchHistory(int id) {
    preparedStatement = null;
    resultSet = null;

    try {
      String sql = "DELETE FROM search_history WHERE id = (?) ";

      preparedStatement = connection.prepareStatement(sql);
      preparedStatement.setInt(1, id);

      return preparedStatement.executeUpdate();

    } catch (Exception e) {
      e.printStackTrace();
      return -1;

    }
  }
}
