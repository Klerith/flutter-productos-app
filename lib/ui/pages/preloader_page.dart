import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../bloc_central.dart';
import '../../bloc_navigator.dart';
import 'login/login_page.dart';
import 'menu_pages/home_page.dart';

class PreloaderPage extends StatefulWidget {
  const PreloaderPage({Key? key}) : super(key: key);

  @override
  State<PreloaderPage> createState() => _PreloaderPageState();
}

class _PreloaderPageState extends State<PreloaderPage> {
  @override
  Widget build(BuildContext context) {
    final double _unit = blocCentral.mainUnit.mainUnit;
    final double _padding = _unit * 0.1;
    return FutureBuilder(
      future: checkLoginState(context),
      builder: ((context, snapshot) {
        return Stack(
          children: [
            Positioned(
              top: _unit * 0.25,
              child: Container(
                padding: EdgeInsets.all(_padding),
                width: _unit,
                height: blocCentral.mainUnit.height * 0.4,
                child: FittedBox(
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    child: Image.asset('assets/BeroNoBG.jpg')),
              ),
            ),
            Positioned(
                bottom: _padding,
                left: 10.0,
                child: Text(
                  "Procesando...",
                  style: blocCentral.theme.theme.textTheme.bodyText1?.copyWith(
                      color: blocCentral.theme.theme.backgroundColor,
                      fontSize: 50.0),
                ))
          ],
        );
      }),
    );
  }

  Future checkLoginState(BuildContext context) async {
    // final authService = Provider.of<AuthService>(context, listen: false);
      final  autenticado = false;
    // final autenticado = await authService.isLoggedIn();

    if (autenticado) {
      // TODO: conectar al socket server
      // Navigator.pushReplacementNamed(context, 'users');
      print('loading');
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => const HomePage(),
              transitionDuration: const Duration(milliseconds: 0)));
    } else {
      // print('loadinglogin');
      blocNavigator.routeTo(namePage: 'login', page: const LoginScreen());
    }
  }
}
