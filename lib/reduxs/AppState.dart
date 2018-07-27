import '../reduxs/team/TeamRedux.dart';
import '../reduxs/home/HomeRedux.dart';

class AppState {
  HomeState homeState;
  TeamState teamState;

  AppState({this.homeState, this.teamState});

  factory AppState.init() {
    return AppState(homeState: HomeState.init(), teamState: TeamState.init());
  }
}

enum ListState {
  LOADING,
  LOADING_MORE,
  SUCESS,
  EMPTY,
  FAILED,
  NO_MORE,
}
