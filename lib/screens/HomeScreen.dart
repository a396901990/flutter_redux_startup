import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../components/NavigationIconViewComponent.dart';
import '../reduxs/AppState.dart';
import '../reduxs/home/HomeRedux.dart';
import './TestScreen.dart';
import './HomeNewsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  List<NavigationIconViewComponent> _navigationViews;
  PageController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new PageController();
    _navigationViews = <NavigationIconViewComponent>[
      NavigationIconViewComponent(
        icon: const Icon(Icons.group_work),
        title: '新闻',
        page: HomeNewsScreen(),
      ),
      NavigationIconViewComponent(
        icon: const Icon(Icons.show_chart),
        title: 'Test2',
        page: TestScreen('Test2'),
      ),
      NavigationIconViewComponent(
        icon: const Icon(Icons.book),
        title: 'Test3',
        page: TestScreen('Test3'),
      ),
      NavigationIconViewComponent(
        icon: const Icon(Icons.settings),
        title: 'Test4',
        page: TestScreen('Test4'),
      ),
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _NavigationViewModel>(
        converter: (store) => _NavigationViewModel.from(store),
        builder: (BuildContext context, _vm) {
          return Scaffold(
            body: PageView(
              controller: _tabController,
              onPageChanged: (int index) {
                onTap(_vm, index);
              },
              children: _navigationViews
                  .map((NavigationIconViewComponent navigationView) =>
                      navigationView.page)
                  .toList(),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: _navigationViews
                  .map((NavigationIconViewComponent navigationView) =>
                      navigationView.item)
                  .toList(),
              currentIndex: _vm.homeIndex,
              type: _type,
              onTap: (int index) {
                onTap(_vm, index);
              },
            ),
          );
        });
  }

  void onTap(_NavigationViewModel _vm, int index) {
    _tabController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    _vm.onChangeIndex(index);
  }
}

class _NavigationViewModel {
  final int homeIndex;
  final Function onChangeIndex;

  _NavigationViewModel({
    @required this.homeIndex,
    @required this.onChangeIndex,
  });

  factory _NavigationViewModel.from(Store<AppState> store) {
    final homeState = store.state.homeState;
    return _NavigationViewModel(
        homeIndex: homeState.homeIndex,
        onChangeIndex: (index) => store.dispatch(SetHomeIndexAction(index)));
  }
}
