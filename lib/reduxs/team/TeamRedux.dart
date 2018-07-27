import '../../models/Team.dart';
import 'package:redux/redux.dart';
import '../AppState.dart';

// ------------------ state -------------------
class TeamState {
  List<Team> teams;
  ListState listState;

  TeamState({this.teams, this.listState});

  factory TeamState.init() {
    return TeamState(teams: [], listState: ListState.LOADING);
  }
}

// ------------------ action -------------------
class SetTeamsAction {
  final List<Team> teams;
  SetTeamsAction(this.teams);
}

class SetListStateAction {
  final ListState listState;
  SetListStateAction(this.listState);
}

class SetMoreTeamsAction {
  final List<Team> teams;
  SetMoreTeamsAction(this.teams);
}

class GetTeamsAction {}

class GetMoreTeamsAction {}

// ------------------ reducer -------------------
final teamReducer = combineReducers<TeamState>([
  TypedReducer<TeamState, SetTeamsAction>(_setTeamsReducer),
  TypedReducer<TeamState, SetMoreTeamsAction>(_setMoreTeamReducer),
  TypedReducer<TeamState, SetListStateAction>(_setStateReducer),
]);

TeamState _setTeamsReducer(TeamState team, SetTeamsAction action) {
  return team..teams = action.teams;
}

TeamState _setMoreTeamReducer(TeamState team, SetMoreTeamsAction action) {
  return team..teams.addAll(action.teams);
}

TeamState _setStateReducer(TeamState team, SetListStateAction action) {
  return team..listState = action.listState;
}
