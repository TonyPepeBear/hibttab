import 'package:flutter_test/flutter_test.dart';
import 'package:hibttab/data/airport_model.dart';
import 'package:hibttab/data/open_airports_api.dart';

void main() {
  test("Convert airports csv to list of ariports", () async {
    String testDataLine1 =
        '"id1","ident2","type3","name4","latitude_deg5","longitude_deg6","elevation_ft7","continent8","iso_country9","iso_region10","municipality11","scheduled_service12","gps_code13","iata_code14","local_code15","home_link16","wikipedia_link17","keyword18"';
    String testDataLine2 =
        '5528,"RCTP","large_airport","Taiwan Taoyuan International Airport",25.0777,121.233002,106,"AS","TW","TW-TAO","Taipei","yes","RCTP","TPE",,"http://www.taoyuan-airport.com/","https://zh.wikipedia.org/wiki/%E8%87%BA%E7%81%A3%E6%A1%83%E5%9C%92%E5%9C%8B%E9%9A%9B%E6%A9%9F%E5%A0%B4","Taiwan Taoyuan International Airport, 臺灣桃園國際機場"';
    String testDataLine3 =
        '5527,"RCSS","medium_airport","Taipei Songshan Airport",25.069400787353516,121.552001953125,18,"AS","TW","TW-TPE","Taipei City","yes","RCSS","TSA",,"http://www.tsa.gov.tw/","https://en.wikipedia.org/wiki/Taipei_Songshan_Airport","Sungshan Airport, 台北松山機場, 臺北松山機場"';
    List<AirportModel> list = await convertCsvPlainText2List(
        "$testDataLine1\n$testDataLine2\n$testDataLine3");
    // TODO check all data
    expect(list[0].ident, "RCTP");
    expect(list[0].country, "TW");
    expect(list[1].ident, "RCSS");
    expect(list[0].country, "TW");
  });
}
