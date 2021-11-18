import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hibttab/data/cubit/airport_list_cubit.dart';
import 'package:hibttab/view/search_page.dart';
import 'package:hibttab/view/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HIBTTA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<AirportsListCubit>(
          create: (context) => AirportsListCubit(),
        )
      ], child: const MyHomePage(title: 'Have I been to this airport?')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;

  late Widget searchPage = const SearchPage();
  late Widget settingsPage = const SettingsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(label: "Map", icon: Icon(Icons.public)),
          BottomNavigationBarItem(
              label: "Search", icon: Icon(Icons.travel_explore)),
          BottomNavigationBarItem(label: "History", icon: Icon(Icons.history)),
          BottomNavigationBarItem(
              label: "Settings", icon: Icon(Icons.settings)),
        ],
      ),
      body: IndexedStack(
        index: pageIndex,
        children: const [
          Text("0"),
          SearchPage(),
          Text("2"),
          SettingsPage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.update),
        onPressed: () {
          context.read<AirportsListCubit>().updateList();
        },
      ),
    );
  }
}
