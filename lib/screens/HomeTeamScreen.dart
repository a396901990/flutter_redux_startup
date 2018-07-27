import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'dart:async';
import 'package:redux/redux.dart';
import '../reduxs/AppState.dart';
import '../reduxs/team/TeamRedux.dart';

class HomeTeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        onInit: (Store<AppState> store) => store.dispatch(GetTeamsAction()),
        builder: (BuildContext context, Store<AppState> store) {
          var teamState = store.state.teamState;
          return new Container(
            padding: const EdgeInsets.only(top: 58.0),
            child: Column(children: <Widget>[
              RaisedButton(
                onPressed: () => store.dispatch(GetMoreTeamsAction()),
                child: Text(teamState.listState.toString()),
              ),
              Expanded(
                child: RefreshIndicator(
                  child: ListView.builder(
                    itemCount: teamState.teams.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(teamState.teams[index].content));
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
