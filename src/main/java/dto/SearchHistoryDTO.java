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
public class SearchHistoryDTO {
  private int id; // ID
  private double lat; // Y좌표(위도)
  private double lnt; // X좌표(경도)
  private String searchDttm; // 조회일자
}
