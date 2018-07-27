import 'package:redux/redux.dart';
import '../AppState.dart';
import './NewsRedux.dart';
import '../../services/APIService.dart';

void newsMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is GetNewsAction) {
    getNewsItems(store, action);
  }
  if (action is GetMoreNewsAction) {
    getMoreNewsItems(store, action);
  }
  next(action);
}

getNewsItems(Store<AppState> store, action) async {
  store.dispatch(SetListStateAction(ListState.LOADING));
  try {
    var news = await APIService.getNews();
    if (news.length > 0) {
      store.dispatch(SetNewsAction(news));
      store.dispatch(SetListStateAction(ListState.SUCESS));
    } else {
      store.dispatch(SetListStateAction(ListState.EMPTY));
    }
  } catch (e) {
    store.dispatch(SetListStateAction(ListState.FAILED));
  }
}

getMoreNewsItems(Store<AppState> store, action) async {
  store.dispatch(SetListStateAction(ListState.LOADING_MORE));
  try {
    var _page = (store.state.newsState.news.length / 10).round() + 1;
    var news = await APIService.getNews(page: _page);
    if (news.length > 0) {
      store.dispatch(SetMoreNewsAction(news));
      store.dispatch(SetListStateAction(ListState.SUCESS));
    } else {
      store.dispatch(SetListStateAction(ListState.NO_MORE));
    }
  } catch (e) {
    store.dispatch(SetListStateAction(ListState.FAILED));
  }
}
