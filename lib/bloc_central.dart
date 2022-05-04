

import 'bloc_navigator.dart';
import 'blocs/bloc_screen_size.dart';
import 'blocs/bloc_theme.dart';
import 'entities/entity_injector.dart';

class BlocCentral extends Injector {
  final theme = BlocTheme();
  final mainUnit = BlocScreenSize();
  BlocCentral() {
    // init();
  }

  dispose() {
    blocNavigator.dispose();
    theme.dispose();
    mainUnit.dispose();
  }
}

final blocCentral = BlocCentral();
