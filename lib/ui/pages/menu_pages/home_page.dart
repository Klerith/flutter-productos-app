import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../bloc_navigator.dart';
import '../../../widgets/background_column_content_blueprint_widget.dart';
import 'history_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return
        // appBar: AppBar(
        //     title: Text(
        //       user?.name ?? 'Sin Nombre',
        //       style: const TextStyle(color: Colors.black54),
        //     ),
        //     elevation: 1,
        //     backgroundColor: Colors.white,
        //     actions: [
        //       Container(
        //         margin: const EdgeInsets.only(right: 10),
        //         // child: Icon(Icons.check_circle, color: Colors.blue[400]),
        //         child: const Icon(Icons.offline_bolt, color: Colors.red),
        //       )
        //     ],
        //     leading: IconButton(
        //         onPressed: () {
        //           // TODO: Desconectar el socket server

        //           // blocNavigator.showBottomNavigationBar(false);
        //           blocNavigator.routeTo(
        //               namePage: 'login', page: const LoginScreen());
        //           AuthService.deleteToken();
        //         },
        //         icon: const Icon(Icons.exit_to_app, color: Colors.black54))),
        BackgroundColumnContentBlueprintWidget(
      children: [
        ElevatedButton(
            onPressed: () {
              print('pressed');
              blocNavigator.routeTo(
                  namePage: 'login', page: const TransactionHistoryPage());
            },
            child: Text('try me ')),
        Center(
          child: Text('HomePage'),
        ),
      ],
    );
  }
}
