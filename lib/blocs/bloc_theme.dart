import 'package:flutter/material.dart';

import '../entities/entity_bloc.dart';

class BlocTheme extends Bloc<ThemeData> {
  static const String _key = "theme";
  final kColors = const <Color>[
    Color.fromRGBO(246, 174, 45, 1.0), // 0 - Honey yellow
    Color.fromRGBO(243, 206, 144, 1.0), // 1 - deep champagne
    Color.fromRGBO(88, 76, 71, 1.0), // 2 - Umber
    Color.fromRGBO(7, 190, 184, 1.0), // 3 - tyffany blue
    Color.fromRGBO(123, 214, 213, 1.0), // 4 - Medium turquoise
    Color.fromRGBO(30, 78, 92, 1.0), // 5- midnight green
    Color.fromRGBO(239, 238, 242, 1.0), // 6 - ghost
    Color.fromRGBO(224, 223, 229, 1.0), // 7 - Gainsboro
    Color.fromRGBO(37, 40, 61, 1.0), // 8 - Space cadet
    Color.fromRGBO(197, 197, 205, 1.0), // 9 - lavander grey
    Color.fromRGBO(253, 111, 66, 1.0), // 10 - Outtrageous
    Color.fromRGBO(249, 208, 63, 1.0), // 11 - Jonquil
    Color.fromRGBO(116, 217, 242, 1.0), // 12 - Sky blue crayole
  ];

  late ThemeData _themeData;
  final _themeDataList = <ThemeData>[
    ThemeData(primarySwatch: Colors.purple, fontFamily: "dongle"),
    ThemeData(primarySwatch: Colors.orange, fontFamily: "dongle"),
    ThemeData(primarySwatch: Colors.blue, fontFamily: "dongle"),
    ThemeData(primarySwatch: Colors.red, fontFamily: "dongle"),
    ThemeData(primarySwatch: Colors.grey, fontFamily: "dongle"),
  ];
  int _index = 0;

  BlocTheme() {
    _themeData = ThemeData(
        brightness: Brightness.dark,
        primaryColor: kColors[8],
        fontFamily: "dongle");

    setValue(_key, _themeData);
  }

  ///[theme] Gets the actual theme data.
  ThemeData get theme => _themeData;

  /// [themeStream] Gets the Stream of our theme.
  Stream<ThemeData> get themeStream => getStream(_key) as Stream<ThemeData>;

  /// [intStream] Gets the stream as an integer.
  Stream<int> get intStream => getStream(_key) as Stream<int>;

  /// [changeTheme] Changes the theme.
  changeTheme() {
    _index++;
    if (_index >= _themeDataList.length) {
      _index = 0;
    }
    setValue(_key, _themeDataList[_index]);
  }

  /// [index] Gets the index as an integer.
  int get index => _index;
}
