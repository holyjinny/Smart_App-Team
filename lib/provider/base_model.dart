import 'package:flutter/material.dart';
import 'package:smart_jtj/enum/view_state.dart';
import 'package:smart_jtj/provider/getit.dart';
import 'package:smart_jtj/service/navigation_service.dart';

class BaseModel extends ChangeNotifier {
  final navigationService = getIt<NavigationService>();
  ViewState _state = ViewState.idle;

  ViewState get state => _state;
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}