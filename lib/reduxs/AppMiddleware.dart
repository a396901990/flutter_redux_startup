import 'package:redux/redux.dart';
import './AppState.dart';
import '../reduxs/AppRedux.dart';
import '../routes.dart';
import 'package:flutter/material.dart';

void appMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is InitAppAction) {
    initApp(store, action);
  }
  next(action);
}

initApp(Store<AppState> store, action) async {
  Navigator.of(action.context).pushReplacementNamed(Routes.home);
}
