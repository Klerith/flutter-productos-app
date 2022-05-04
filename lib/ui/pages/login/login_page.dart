import 'package:flutter/material.dart';

import '../../../../bloc_navigator.dart';
import '../../../widgets/form_widget.dart';
import '../../../widgets/image_text_widget.dart';
import '../../../widgets/labels_widget.dart';
import '../register pages/register_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    blocNavigator.showBottomNavigationBar(false);

    
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const ImageTextWidget(
                  imageRoute: 'assets/berologoColorSinCirculo.png',
                  text: '',
                ),
                const SizedBox(height: 20.0),
                const FormHome(),
                const SizedBox(height: 20.0),
                Labels(
                  textQuestion: '¿No tienes cuenta?',
                  route: () {
                    blocNavigator.routeTo(
                        isWithNavigationBar: false,
                        namePage: 'register',
                        page: const RegisterScreen());
                  },
                  textGesture: '¡Crea una ahora!',
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Términos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        );
  }
}
