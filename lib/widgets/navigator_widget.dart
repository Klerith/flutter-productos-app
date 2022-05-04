import 'dart:async';

import 'package:flutter/material.dart';

import '../../../bloc_central.dart';
import '../../../bloc_navigator.dart';
import 'background_widget.dart';

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      blocCentral.mainUnit.mainUnit = MediaQuery.of(context).size.width;
      blocCentral.mainUnit.height = MediaQuery.of(context).size.height;
      blocNavigator.context = context;

    } catch (e) {
      debugPrint(e.toString());
    }
    return WillPopScope(
      onWillPop: () {
        blocNavigator.backFunction();
        return Future.value(false);
      },
      child: const _BlueprintWidget(),
    );
  }
}

class   _BlueprintWidget extends StatefulWidget {
  const _BlueprintWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_BlueprintWidget> createState() => _BlueprintWidgetState();
}

class _BlueprintWidgetState extends State<_BlueprintWidget> {
  late StreamSubscription historySubscription;

  @override
  void initState() {
    super.initState();
    historySubscription = blocNavigator.streamPage.listen((event) {
      setState(() {
        debugPrint(event.toString());
      });
    });
  }

  @override
  void dispose() {
    historySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blocCentral.theme.kColors[8],
      body: blocNavigator.withBackground
          ? BackgroundWidget(
              widget: blocNavigator.currentPage,
              index: 0,
            )
          : blocNavigator.currentPage,
      bottomNavigationBar: blocNavigator.bottomNavigationBar(),
    );
  }
}
