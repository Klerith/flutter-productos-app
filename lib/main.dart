import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/widgets/navigator_widget.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'login',
      // routes: {
      //   'login': ( _ ) => LoginScreen(),
      //   'home' : ( _ ) => HomeScreen(),
      // },
      home: const NavigatorWidget(),
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300]
      ),
    );
  }
}