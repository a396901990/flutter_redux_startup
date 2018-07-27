import 'package:flutter/widgets.dart';
import './team/TeamRedux.dart';
import './home/HomeRedux.dart';
import './AppState.dart';

class InitAppAction {
  final BuildContext context;
  InitAppAction(this.context);
}

AppState appReducer(AppState state, action) {
  return AppState(
    homeState: homeReducer(state.homeState, action),
    teamState: teamReducer(state.teamState, action),
  );
}
