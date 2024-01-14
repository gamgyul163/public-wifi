package service;

import java.net.MalformedURLException;
import java.net.URL;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import dao.WifiDAO;
import dto.WifiDTO;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

public class ApiService {
  private static final String URL =
      "http://openapi.seoul.go.kr:8088/4e586b4e6667616d393066575a4262/json/TbPublicWifiInfo/";
  private OkHttpClient okHttpClient = new OkHttpClient();

  public int getWifiTotalCount() {
    try {
      Response response = okHttpClient.newCall(requestWifi(1, 1).build()).execute();
      
      if (response.isSuccessful()) {
        ResponseBody responseBody = response.body();

        if (responseBody != null) {
          JsonElement jsonElement = JsonParser.parseString(responseBody.string());

          return jsonElement.getAsJsonObject().get("TbPublicWifiInfo").getAsJsonObject()
              .get("list_total_count").getAsInt();
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return -1;
  }

  private Request.Builder requestWifi(int start, int end) throws MalformedURLException {
    URL requestUrl = new URL(URL + start + "/" + end);
    return new Request.Builder().url(requestUrl).get();
  }

  public int getAllWifi() {
    int wifiTotalCount = getWifiTotalCount();
    int loadedWifi = 0;
    WifiDAO wifiDAO = new WifiDAO();
    try {
      for (int start = 1; start <= wifiTotalCount; start+=1000) {
        Response response = okHttpClient.newCall(requestWifi(start, start + 999).build()).execute(); // 요청한계 1000개

        if (response.isSuccessful()) {
          ResponseBody responseBody = response.body();
          if (responseBody != null) {
            JsonElement jsonElement = JsonParser.parseString(responseBody.string());

            JsonArray jsonArray = jsonElement.getAsJsonObject().get("TbPublicWifiInfo")
                .getAsJsonObject().get("row").getAsJsonArray();
            WifiDTO[] wifi = new Gson().fromJson(jsonArray, WifiDTO[].class);
            
            loadedWifi += wifiDAO.createWifi(wifi);
          }
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return loadedWifi;
  }
}
