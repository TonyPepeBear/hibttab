import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hibttab/data/airport_model.dart';
import 'package:hibttab/data/cubit/airport_list_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AirportsListCubit, List<AirportModel>>(
      builder: (context, list) => ListView.builder(
        addAutomaticKeepAlives: false,
        itemCount: list.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(list[index].ident),
        ),
      ),
    );
  }
}
