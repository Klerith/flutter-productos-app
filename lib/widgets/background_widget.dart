// import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../bloc_central.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key, this.widget, this.index = 0})
      : super(key: key);
  final Widget? widget;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: blocCentral.theme.kColors[6],
                borderRadius: BorderRadius.circular(
                    blocCentral.mainUnit.dividerHeight())),
            padding: EdgeInsets.all(blocCentral.mainUnit.paddingUnit()),
            width: blocCentral.mainUnit.mainUnit,
            height: blocCentral.mainUnit.height,
            child: SingleChildScrollView(child: widget),
          ),
        ),
      ],
    );
  }
}
