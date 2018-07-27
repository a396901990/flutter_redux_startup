import 'package:redux/redux.dart';

// ------------------ state -------------------
class HomeState {
  int homeIndex;

  HomeState({this.homeIndex});

  factory HomeState.init() {
    return HomeState(homeIndex: 0);
  }
}

// ------------------ action -------------------
class SetHomeIndexAction {
  final int homeIndex;
  SetHomeIndexAction(this.homeIndex);
}

final homeReducer = combineReducers<HomeState>([
  TypedReducer<HomeState, SetHomeIndexAction>(_setHomeIndex),
]);

HomeState _setHomeIndex(HomeState homeState, SetHomeIndexAction action) {
  return homeState..homeIndex = action.homeIndex;
}
