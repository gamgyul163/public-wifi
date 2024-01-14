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
public class BookmarkGroupDTO {
  private int id; // ID
  private String name; // 북마크 그룹 이름
  private int sortingPriority; // 순서
  private String registrationDttm; // 등록일자
  private String modificationDttm; // 수정일자
}
