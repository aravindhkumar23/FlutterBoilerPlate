import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/model/app_state.dart';
import 'package:flutter_boiler_plate/utils/utils.dart';
import 'package:flutter_boiler_plate/view/app_drawer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:simple_permissions/simple_permissions.dart';

class HomeViewModel {
  final bool isInternetConnected;

  HomeViewModel({
    this.isInternetConnected,
  });
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  Permission permission;

  @override
  void initState() {
    super.initState();
    //check permission
    _checkPermission();
  }

  void _checkPermission() async {
    await Utils.checkReadPermission();
    await Utils.checkWritePermission();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, HomeViewModel>(
        converter: (Store<AppState> store) => new HomeViewModel(
              isInternetConnected: store.state.isInternetConnected,
            ),
        builder: (BuildContext context, HomeViewModel localState) =>
            new Scaffold(
                appBar: new AppBar(
                  title: const Text('Hinch'),
                  actions: <Widget>[
                    new IconButton(
                      icon: const Icon(
                        Icons.face,
                        size: 20.0,
                      ),
                      tooltip: 'Filter',
                      onPressed: () {},
                    ),
                  ],
                ),
                drawer: new AppDrawer(),
                body: new Container(
                  child: new Text('Home Page'),
                )));
  }
}
