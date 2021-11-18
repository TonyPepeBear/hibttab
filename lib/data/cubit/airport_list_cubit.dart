import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hibttab/data/airport_model.dart';
import 'package:hibttab/data/open_airports_api.dart';

class AirportsListCubit extends Cubit<List<AirportModel>> {
  AirportsListCubit() : super(List.empty());

  void updateList() async {
    // todo change datasource to db
    emit(await getAllAirportListFromApi());
  }
}
