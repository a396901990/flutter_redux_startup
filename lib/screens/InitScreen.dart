import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../reduxs/AppState.dart';
import '../reduxs/AppRedux.dart';

import '../routes.dart';

class InitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        onInit: (Store<AppState> store) =>
            store.dispatch(InitAppAction(context)),
        builder: (BuildContext context, Store<AppState> store) {
          return Container(
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.home);
              },
              child: Text('init page'),
            ),
          );
        });
  }
}
