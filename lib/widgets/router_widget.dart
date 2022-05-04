import 'package:flutter/material.dart';
import '../../../bloc_navigator.dart';

class RouterWidget extends StatefulWidget {
  const RouterWidget({Key? key}) : super(key: key);

  @override
  State<RouterWidget> createState() => _RouterWidgetState();
}

class _RouterWidgetState extends State<RouterWidget> {
  @override
  void initState() {
    blocNavigator.setDefaultBottomsNavigationBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: StreamBuilder<int>(
            stream: blocNavigator.streamPage,
            builder: (context, snapshot) {
              return blocNavigator.currentPage;
            }),
      ),
      bottomNavigationBar: blocNavigator.bottomNavigationBar(),
    );
  }
}
