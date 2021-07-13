import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';


class CheckAuthScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>( context, listen: false );

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            
            if ( !snapshot.hasData )            
              return Text('');

            if ( snapshot.data == '' ) {
              Future.microtask(() {

                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: ( _, __ , ___ ) => LoginScreen(),
                  transitionDuration: Duration( seconds: 0)
                  )
                );

              });

            } else {

              Future.microtask(() {

                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: ( _, __ , ___ ) => HomeScreen(),
                  transitionDuration: Duration( seconds: 0)
                  )
                );

              });
            }

            return Container();

          },
        ),
     ),
   );
  }
}