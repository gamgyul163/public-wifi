package service;

import java.time.LocalDateTime;
import java.util.List;
import common.TimeStamp;
import dao.SearchHistoryDAO;
import dao.WifiDAO;
import dto.SearchHistoryDTO;
import dto.WifiDTO;

public class WifiService {
  private WifiDAO wifiDAO = new WifiDAO();
  private SearchHistoryDAO searchHistoryDAO = new SearchHistoryDAO();
  
  public List<WifiDTO> getNearbyWifiList(String y, String x, int size) {
    SearchHistoryDAO searchHistoryDAO = new SearchHistoryDAO();
    SearchHistoryDTO newSearchHistoryDTO = SearchHistoryDTO.builder().lat(Double.parseDouble(y)).lnt(Double.parseDouble(x))
        .searchDttm(TimeStamp.getTimeStamp(LocalDateTime.now())).build();
    searchHistoryDAO.createSearchHistory(newSearchHistoryDTO);
    return wifiDAO.getNearbyWifiList(Double.parseDouble(y), Double.parseDouble(x), size);
  }
  
  public WifiDTO getWifi(String wifiMgrNo) {
    return wifiDAO.getWifi(wifiMgrNo);
  }
  
  public List<SearchHistoryDTO> getSearchHistoryList() {
    return searchHistoryDAO.getSearchHistoryList();  }
  
  public int deleteSearchHistory(String id) {
    return searchHistoryDAO.deleteSearchHistory(Integer.parseInt(id));
  }
  
}
