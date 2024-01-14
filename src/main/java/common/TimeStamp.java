package common;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TimeStamp {
  public static String getTimeStamp(LocalDateTime localDateTime) {
     return localDateTime.format(DateTimeFormatter.ISO_DATE_TIME);
  }
}
