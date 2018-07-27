import 'package:flutter/widgets.dart';
import './news/NewsRedux.dart';
import './home/HomeRedux.dart';
import './AppState.dart';

class InitAppAction {
  final BuildContext context;
  InitAppAction(this.context);
}

AppState appReducer(AppState state, action) {
  return AppState(
    homeState: homeReducer(state.homeState, action),
    newsState: newsReducer(state.newsState, action),
  );
}
