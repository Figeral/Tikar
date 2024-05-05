import 'dart:async';

class SideBarViewModel {
  SideBarViewModel();

  final StreamController<int> _streamController = StreamController<int>();
  Stream<int>? get stream => _streamController.stream;

  void changedIndex(int index) {
    _streamController.add(index);
  }

  void dispose() {
    _streamController.close();
  }
}
