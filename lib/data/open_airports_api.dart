import 'package:csv/csv.dart';
import 'package:csv/csv_settings_autodetection.dart';
import 'package:http/http.dart' as http;

import 'airport_model.dart';

late Uri airportURL = Uri.parse(
    "https://cdn.jsdelivr.net/gh/davidmegginson/ourairports-data@main/airports.csv");

Future<String> getAirportsCsvPlainText(http.Client client) async {
  http.Response response = await client.get(airportURL);
  return response.body;
}

Future<List<AirportModel>> convertCsvPlainText2List(String csv) async {
  csv = csv.substring(csv.indexOf("\n") + 1);
  List<List<dynamic>> list = const CsvToListConverter(
          csvSettingsDetector: FirstOccurrenceSettingsDetector(eols: ["\n"]))
      .convert(csv);
  return (list.map((e) => AirportModel(
      e[0].toString(),
      e[1].toString(),
      e[2].toString(),
      e[3].toString(),
      e[4].toString(),
      e[5].toString(),
      e[6].toString(),
      e[8].toString(),
      e[9].toString(),
      e[15].toString(),
      e[16].toString()))).toList();
}

Future<List<AirportModel>> getAllAirportListFromApi() async {
  return await convertCsvPlainText2List(
      await getAirportsCsvPlainText(http.Client()));
}

void main() async {
  print((await convertCsvPlainText2List(
      await getAirportsCsvPlainText(http.Client())))[0]);
}
