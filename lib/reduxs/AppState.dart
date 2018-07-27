import '../reduxs/news/NewsRedux.dart';
import '../reduxs/home/HomeRedux.dart';

class AppState {
  HomeState homeState;
  NewsState newsState;

  AppState({this.homeState, this.newsState});

  factory AppState.init() {
    return AppState(homeState: HomeState.init(), newsState: NewsState.init());
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
