import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'dart:async';
import 'package:redux/redux.dart';
import '../reduxs/AppState.dart';
import '../reduxs/news/NewsRedux.dart';

class HomeNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        onInit: (Store<AppState> store) => store.dispatch(GetNewsAction()),
        builder: (BuildContext context, Store<AppState> store) {
          var newsState = store.state.newsState;
          return new Container(
            padding: const EdgeInsets.only(top: 58.0),
            child: Column(children: <Widget>[
              RaisedButton(
                onPressed: () => store.dispatch(GetMoreNewsAction()),
                child: Text(newsState.listState.toString()),
              ),
              Expanded(
                child: RefreshIndicator(
                  child: ListView.builder(
                    itemCount: newsState.news.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(newsState.news[index].content));
                    },
                  ),
                  onRefresh: _handleRefresh,
                ),
              )
            ]),
          );
        });
  }

  Future<Null> _handleRefresh() async {
    return null;
  }
}
