import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

import 'reduxs/AppRedux.dart';
import 'reduxs/AppState.dart';
import 'reduxs/AppMiddleware.dart';
import 'reduxs/team/TeamMiddleware.dart';
import 'screens/InitScreen.dart';
import 'screens/HomeScreen.dart';
import 'routes.dart';

void main() {
  final store = Store<AppState>(appReducer,
      initialState: AppState.init(),
      middleware: [appMiddleware, teamMiddleware, LoggingMiddleware.printer()]);

  runApp(TanziApp(store: store));
}

class TanziApp extends StatelessWidget {
  final Store<AppState> store;

  TanziApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        routes: {
          Routes.root: (context) => InitScreen(),
          Routes.home: (context) => HomeScreen(),
        },
      ),
    );
  }
}
