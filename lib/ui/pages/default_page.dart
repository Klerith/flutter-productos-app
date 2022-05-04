
import 'package:flutter/material.dart';

import '../../bloc_navigator.dart';
import 'menu_pages/home_page.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              blocNavigator.routeTo(namePage: 'home', page: const HomePage());
            },
            child: Container(
              color: Colors.red,
              child: const Text('DefaultPage'))),
      ),
    );
  }
}
