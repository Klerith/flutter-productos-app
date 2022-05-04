import 'package:flutter/material.dart';

import '../../../widgets/background_column_content_blueprint_widget.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundColumnContentBlueprintWidget(
      children: [
        Center(
          child: Text('DashBoard'),
        ),
      ],
    );
  }
}
