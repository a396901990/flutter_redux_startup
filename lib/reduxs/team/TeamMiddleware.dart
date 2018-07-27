import 'package:redux/redux.dart';
import '../AppState.dart';
import './TeamRedux.dart';
import '../../services/TanziService.dart';

void teamMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is GetTeamsAction) {
    getTeams(store, action);
  }
  if (action is GetMoreTeamsAction) {
    getMoreTeams(store, action);
  }
  next(action);
}

getTeams(Store<AppState> store, action) async {
  store.dispatch(SetListStateAction(ListState.LOADING));
  try {
    var teams = await TanziService.fetchTeams();
    if (teams.length > 0) {
      store.dispatch(SetTeamsAction(teams));
      store.dispatch(SetListStateAction(ListState.SUCESS));
    } else {
      store.dispatch(SetListStateAction(ListState.EMPTY));
    }
  } catch (e) {
    store.dispatch(SetListStateAction(ListState.FAILED));
  }
}

getMoreTeams(Store<AppState> store, action) async {
  store.dispatch(SetListStateAction(ListState.LOADING_MORE));
  try {
    var _skip = store.state.teamState.teams.length;
    var teams = await TanziService.fetchTeams(skip: _skip);
    if (teams.length > 0) {
      store.dispatch(SetMoreTeamsAction(teams));
      store.dispatch(SetListStateAction(ListState.SUCESS));
    } else {
      store.dispatch(SetListStateAction(ListState.NO_MORE));
    }
  } catch (e) {
    store.dispatch(SetListStateAction(ListState.FAILED));
  }
}
