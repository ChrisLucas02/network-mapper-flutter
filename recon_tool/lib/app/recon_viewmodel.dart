import 'package:flutter/foundation.dart';

enum AppState {
  script,
}

class ReconViewModel extends ChangeNotifier {
  var state = AppState.script;
}
