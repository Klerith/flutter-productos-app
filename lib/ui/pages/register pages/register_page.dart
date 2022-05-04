import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../bloc_navigator.dart';

import '../../../widgets/custom_input_form_widget.dart';
import '../../../widgets/elevated_button_widget.dart';
import '../../../widgets/image_text_widget.dart';
import '../../../widgets/labels_widget.dart';
import '../login/login_page.dart';
import '../menu_pages/home_page.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ImageTextWidget(
                imageRoute: 'assets/berologoColorSinCirculo.png',
                text: 'Registro',
              ),
              _RegisterForm(),
              const SizedBox(height: 5),
              Labels(
                textQuestion: '¿Ya tienes una cuenta?',
                route: () {
                  blocNavigator.routeTo(
                      isWithNavigationBar: false,
                      namePage: 'login',
                      page: const LoginScreen());
                },
                textGesture: 'Ingresa a tu cuenta',
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Términos y condiciones de uso',
                style: TextStyle(fontWeight: FontWeight.w200),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final numberCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          CustomInputWidget(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),
          CustomInputWidget(
            icon: Icons.add_ic_call,
            placeholder: 'Numero de telefono',
            keyboardType: TextInputType.phone,
            textController: numberCtrl,
          ),
          CustomInputWidget(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInputWidget(
            icon: Icons.lock,
            placeholder: 'Contraseña',
            keyboardType: TextInputType.text,
            textController: passCtrl,
            isPassword: true,
          ),
          ElevatedButtonWidget(
            height: 50,
            text: 'Registrar',
            primaryColor: Color.fromARGB(255, 127, 4, 149),
            width: double.infinity,
            onPressed: () async {
              blocNavigator.routeTo(namePage: 'home', page: const HomePage());

              // print(emailCtrl.text);
              // print(passCtrl.text);
              // final registroOk = await authService.register(
              //     nameCtrl.text.trim(),
              //     emailCtrl.text.trim(),
              //     passCtrl.text.trim(),
              //     numberCtrl.text.trim());

              // if (registroOk == true) {
              //   //  TODO: Conectar socket server
              //   blocNavigator.showBottomNavigationBar(true);
              //   blocNavigator.routeTo(namePage: 'home', page: const HomePage());
              // } else {
              //   mostrarAlerta(context, 'Registro incorrecto', registroOk);
              // }
            },
          )
        ],
      ),
    );
  }
}
