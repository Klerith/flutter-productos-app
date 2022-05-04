import 'package:flutter/material.dart';
import '../../../bloc_central.dart';

class BackgroundColumnContentBlueprintWidget extends StatelessWidget {
  const BackgroundColumnContentBlueprintWidget(
      {Key? key, required this.children})
      : super(key: key);

  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return children.length <= 5
        ? SizedBox(
            height: blocCentral.mainUnit.height,
            width: blocCentral.mainUnit.mainUnit,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: children,
            ),
          )
        : SizedBox(
            height: blocCentral.mainUnit.height,
            width: blocCentral.mainUnit.mainUnit,
            child: ListView.builder(
                itemCount: children.length,
                itemBuilder: (context, index) {
                  return children[index];
                }));
  }
}
