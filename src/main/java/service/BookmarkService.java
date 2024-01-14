package service;

import java.time.LocalDateTime;
import java.util.List;
import common.TimeStamp;
import dao.BookmarkDAO;
import dao.BookmarkGroupDAO;
import dto.BookmarkDTO;
import dto.BookmarkGroupDTO;

public class BookmarkService {
  
  private BookmarkGroupDAO bookmarkGroupDAO = new BookmarkGroupDAO();
  private BookmarkDAO bookmarkDAO = new BookmarkDAO();
  
  public enum SortingCriteria { // 정렬기준
    ID("id"), PRIORITY("sorting_priority");

    private String columnName;

    private SortingCriteria(String columnName) {
      this.columnName = columnName;
    }

    private String getColumnName() {
      return columnName;
    }
  }
  
  public List<BookmarkGroupDTO> getBookmarkGroupList(SortingCriteria sortingCriteria) {
    return bookmarkGroupDAO.getBookmarkGroupList(sortingCriteria.getColumnName());
  }
  
  public int updateBookmarkGroup(String bookmarkGroupId, String newName, String newValue) {
    BookmarkGroupDTO updateBookmarkGroupDTO = BookmarkGroupDTO.builder().id(Integer.parseInt(bookmarkGroupId)).name(newName)
        .sortingPriority(Integer.parseInt(newValue)).modificationDttm(TimeStamp.getTimeStamp(LocalDateTime.now())).build();
    return bookmarkGroupDAO.updateBookmarkGroup(updateBookmarkGroupDTO);
  }
  
  public BookmarkGroupDTO getBookmarkGroup(String bookmarkGroupId) {
    return bookmarkGroupDAO.getBookmarkGroup(Integer.parseInt(bookmarkGroupId));
  }
  
  public BookmarkGroupDTO getBookmarkGroup(int bookmarkGroupId) {
    return bookmarkGroupDAO.getBookmarkGroup(bookmarkGroupId);
  }
  
  public int deleteBookmarkGroup(String bookmarkGroupId) {
    return bookmarkGroupDAO.deleteBookmarkGroup(Integer.parseInt(bookmarkGroupId));
  }
  
  public int createBookmarkGroup(String bookMarkGroupName, String priority) {
    BookmarkGroupDTO newBookmarkGroupDTO = BookmarkGroupDTO.builder().name(bookMarkGroupName).sortingPriority(Integer.parseInt(priority))
        .registrationDttm(TimeStamp.getTimeStamp(LocalDateTime.now())).build();
    return bookmarkGroupDAO.createBookmarkGroup(newBookmarkGroupDTO);
  }
  
  public int createBookmark(String bookmarkGroupId, String wifiMgrNo) {
    BookmarkDTO newBookmarkDTO = BookmarkDTO.builder().bookmarkGroupId(Integer.parseInt(bookmarkGroupId)).wifiMgrNo(wifiMgrNo)
        .registrationDttm(TimeStamp.getTimeStamp(LocalDateTime.now())).build();
    return bookmarkDAO.createBookmark(newBookmarkDTO);
  }
  
  public List<BookmarkDTO> getBookmarkList() {
    return bookmarkDAO.getBookmarkList();
  }
  
  public BookmarkDTO getBookmark(String bookmarkId) {
    return bookmarkDAO.getBookmark(Integer.parseInt(bookmarkId));
  }
  
  public int deleteBookmark(String bookmarkId) {
    return bookmarkDAO.deleteBookmark(Integer.parseInt(bookmarkId));
  }
}
