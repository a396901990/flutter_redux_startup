import '../../models/Team.dart';
import 'package:redux/redux.dart';
import '../AppState.dart';

// ------------------ state -------------------
class NewsState {
  List<Team> news;
  ListState listState;

  NewsState({this.news, this.listState});

  factory NewsState.init() {
    return NewsState(news: [], listState: ListState.LOADING);
  }
}

// ------------------ action -------------------
class SetNewsAction {
  final List<Team> news;
  SetNewsAction(this.news);
}

class SetListStateAction {
  final ListState listState;
  SetListStateAction(this.listState);
}

class SetMoreNewsAction {
  final List<Team> news;
  SetMoreNewsAction(this.news);
}

class GetNewsAction {}

class GetMoreNewsAction {}

// ------------------ reducer -------------------
final newsReducer = combineReducers<NewsState>([
  TypedReducer<NewsState, SetNewsAction>(_setNewssReducer),
  TypedReducer<NewsState, SetMoreNewsAction>(_setMoreNewsducer),
  TypedReducer<NewsState, SetListStateAction>(_setStateReducer),
]);

NewsState _setNewssReducer(NewsState newsState, SetNewsAction action) {
  return newsState..news = action.news;
}

NewsState _setMoreNewsducer(NewsState newsState, SetMoreNewsAction action) {
  return newsState..news.addAll(action.news);
}

NewsState _setStateReducer(NewsState newsState, SetListStateAction action) {
  return newsState..listState = action.listState;
}
