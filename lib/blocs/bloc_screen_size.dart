import '../entities/entity_bloc.dart';

class BlocScreenSize extends Bloc<double> {
  final String _key = 'screenKey';
  BlocScreenSize() {
    setValue(_key, 100.0);
  }

  /// [mainUnitStream] Gets the value of the Stream as a double.
  Stream<double> get mainUnitStream => getStream(_key) as Stream<double>;

  ///[mainUnit] Get the mainUnit value as a double.
  double get mainUnit => getValue(_key) ?? 100.0;

  /// [mainUnit] Sets the value of the mainUnit.
  set mainUnit(double value) {
    setValue(_key, value);
  }

  double _height = 100.0;

  /// [height] Getter made for the height.
  ///
  double get height => _height;

  /// [height] Sets the value of the height.
  set height(double value) {
    _height = value;
    sizeFont = mainUnit * 0.07;
  }

  /// [sizeFontTitle] The size font we are using for our title.
  double get sizeFontTitle => sizeFont * 2.125;

  /// [sizeFontSubtitle] The size font we are using for our Subtitle.
  double get sizeFontSubtitle => sizeFont * 1.928;

  /// [sizeFontEmphasys] A medium size font being used.
  double get sizeFontEmphasys => sizeFont * 1.15;

  /// [sizeFontSmall] The size font we are using for small size Font
  double get sizeFontSmall => sizeFont * 0.7;

  /// [sizeFont] The size font we are using for our sizeFont
  double sizeFont = 12.0;

  ///[dividerHeight] Instead of using SizedBox with some pixels we will use this
  ///dividerHeight that will allow us to keep responsive between devices.
  double dividerHeight([int numberOfLines = 1]) {
    double tmp = sizeFont * 0.5625;
    return tmp * numberOfLines;
  }

  ///[paddingUnit] The padding that we will use for keeping responsive between devices
  ///this will have a default value, but it can be changed according to the requirements.
  double paddingUnit([int numberOfPadding = 1]) {
    double tmp = sizeFont * 0.4;
    return tmp * numberOfPadding;
  }
}
