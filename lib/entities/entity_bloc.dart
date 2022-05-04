import 'package:rxdart/rxdart.dart';

abstract class Bloc<T> {
  /// [_streamControllers] Save different streams into this map keeping in your
  /// mind that the type [T] of the Stream must be limit to the type defined
  /// in the sub-class
  final Map<String, BehaviorSubject<T>> _streamControllers = {};

  /// [_removeStreamController] allows remove safely all the stream controllers
  /// from the bloc generating the cleaning of memory
  _removeStreamController(String key) {
    if (_streamControllers[key] != null) {
      _streamControllers[key]?.close();
      _streamControllers.remove(key);
    }
  }

  /// [addStreamController] insert into the main map of streams controllers the
  /// new streamcontroller to let to another class consume the stream of
  /// type [T] defined

  _addStreamController(String key, T initialData) {
    final type = initialData.runtimeType;
    if (_streamControllers[key] == null && type == T) {
      final behaviorSubject = BehaviorSubject<T>()..sink.add(initialData);
      _streamControllers[key] = behaviorSubject;
    }
  }

  /// [getStream] return corresponding stream controller from the main map of
  /// the defined sub-class if this exist, otherwise return null, in  this case
  /// must be handled directly in the subclass extended from this abstract BLoC
  Stream<T>? getStream(String key) {
    return _streamControllers[key];
  }

  /// [getValue] if the stream controller exist we return that value,
  /// remember that this may be null too and we have to handle this
  /// event in the intanciated sub-class
  T? getValue(String key) {
    final _controller = _streamControllers[key];
    T? response;
    if (_controller != null) {
      response = _controller.valueOrNull as T;
    }
    return response;
  }

  /// [setValue] add the value to corresponding stream controller.
  /// Warning!, if the stream controller does not exist this function
  /// will create that, keep this in mind to limit in the subclass
  /// this function to avoid the creation of unnecesary streams in the subclass.
  setValue(String key, T value) {
    if (!_streamControllers.containsKey(key)) {
      _addStreamController(key, value);
    } else if (_streamControllers[key] != null) {
      _streamControllers[key]?.sink.add(value);
    }
  }

  /// [setError] add one error message to the stream controller
  /// only if this exist.
  setError(String key, String errorMessage) {
    if (_streamControllers[key] != null) {
      _streamControllers[key]?.addError(errorMessage);
    }
  }

  /// [getError] returns the last error from the stream controller if
  /// this has one or return null
  String? getError(String key) {
    return _streamControllers[key]?.error.toString();
  }

  /// [dispose] ensure the closure of the stream controllers and free memory
  /// data location when the BLoC is disposed
  dispose() {
    if (_streamControllers.isNotEmpty) {
      _streamControllers.forEach((key, value) {
        _removeStreamController(key);
      });
    }
  }
}
