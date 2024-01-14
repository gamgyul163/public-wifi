package dto;

import com.google.gson.annotations.SerializedName;
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
public class WifiDTO {
  private double distance; // 내 위치로부터 거리
  @SerializedName("X_SWIFI_MGR_NO")
  private String mgrNo; // 관리번호
  @SerializedName("X_SWIFI_WRDOFC")
  private String wrdofc; // 자치구
  @SerializedName("X_SWIFI_MAIN_NM")
  private String name; // 와이파이명
  @SerializedName("X_SWIFI_ADRES1")
  private String address1; // 도로명주소
  @SerializedName("X_SWIFI_ADRES2")
  private String address2; // 상세주소
  @SerializedName("X_SWIFI_INSTL_FLOOR")
  private String instlFloor; // 설치위치(층)
  @SerializedName("X_SWIFI_INSTL_TY")
  private String instlTy; // 설치유형
  @SerializedName("X_SWIFI_INSTL_MBY")
  private String instlMby; // 설치기관
  @SerializedName("X_SWIFI_SVC_SE")
  private String svcSe; // 서비스구분
  @SerializedName("X_SWIFI_CMCWR")
  private String cmcwr; // 망종류
  @SerializedName("X_SWIFI_CNSTC_YEAR")
  private String cnstcYear; // 설치년도
  @SerializedName("X_SWIFI_INOUT_DOOR")
  private String inoutDoor; // 실내외구분
  @SerializedName("X_SWIFI_REMARS3")
  private String remars3; // WIFI접속환경
  @SerializedName("LAT")
  private double lat; // Y좌표(위도)
  @SerializedName("LNT")
  private double lnt; // X좌표(경도)
  @SerializedName("WORK_DTTM")
  private String workDttm; // 작업일자
}
