import 'package:flutter/material.dart';

import '../../../widgets/background_column_content_blueprint_widget.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundColumnContentBlueprintWidget(children: [
      Center(
        child: Text('TransactionHistoryPage'),
      ),
    ]);
  }
}
