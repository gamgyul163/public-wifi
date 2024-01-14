package dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BookmarkDTO {
  private int id; // ID
  private int bookmarkGroupId; // 북마크 그룹 ID
  private String bookmarkGroupName; // 북마크 그룹 이름
  private String wifiMgrNo; // 와이파이 관리 번호
  private String wifiName; // 와이파이 이름
  private String registrationDttm; // 등록일자
}
