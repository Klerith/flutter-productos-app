import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc_navigator.dart';
import '../ui/pages/menu_pages/home_page.dart';
import 'custom_input_form_widget.dart';
import 'elevated_button_widget.dart';

class FormHome extends StatefulWidget {
  const FormHome({Key? key}) : super(key: key);

  @override
  State<FormHome> createState() => _FormHomeState();
}

class _FormHomeState extends State<FormHome> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final authService = Provider.of<AuthService>(context);

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          CustomInputWidget(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInputWidget(
            icon: Icons.lock,
            placeholder: 'Contraseña',
            keyboardType: TextInputType.emailAddress,
            textController: passCtrl,
            isPassword: true,
          ),
          ElevatedButtonWidget(
            text: 'Ingresar',
            width: double.infinity,
            primaryColor: Color.fromARGB(255, 127, 4, 149),
            height: 50,
            onPressed: () {
              blocNavigator.setDefaultBottomsNavigationBar();
              blocNavigator.routeTo(namePage: 'home', page: const HomePage());
            },
            // onPressed: authService.autenticando
            //     ? null
            //     : () async {
            //         FocusScope.of(context).unfocus();
            //         final loginOk = await authService.login(
            //             emailCtrl.text.trim(), passCtrl.text.trim());
            //         if (loginOk) {
            //           blocNavigator.setDefaultBottomsNavigationBar();
            //           blocNavigator.showBottomNavigationBar(true);

            // blocNavigator.routeTo(
            //     namePage: 'home', page: const HomePage());
            //         } else {
            //           //Show Alert
            //           mostrarAlerta(context, 'Login incorrecto',
            //               'Revisar las credenciales, hubo un error');
            //         }
            //       },
          ),
        ],
      ),
    );
  }
}
