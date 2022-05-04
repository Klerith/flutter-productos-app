import 'package:flutter/material.dart';

import '../../../widgets/background_column_content_blueprint_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BackgroundColumnContentBlueprintWidget(
      children: [Center(child: Text('ProfilePage'))],
    );
  }
}
