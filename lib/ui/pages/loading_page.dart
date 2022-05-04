import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../bloc_navigator.dart';
import 'login/login_page.dart';
import 'menu_pages/home_page.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: ((context, snapshot) {
          return const Center(
            child: Text('Autenticando....'),
          );
        }),
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    // final authService = Provider.of<AuthService>(context, listen: false);

    final autenticado = false;
    // await authService.isLoggedIn();

    if (autenticado) {
      // TODO: conectar al socket server
      // Navigator.pushReplacementNamed(context, 'users');
      print('loading');
      blocNavigator.setDefaultBottomsNavigationBar();
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => const HomePage(),
              transitionDuration: const Duration(milliseconds: 0)));
    } else {
      // print('loadinglogin');
      // Navigator.pushReplacementNamed(context, 'login');

      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => const LoginScreen(),
              transitionDuration: const Duration(milliseconds: 0)));
    }
  }
}
