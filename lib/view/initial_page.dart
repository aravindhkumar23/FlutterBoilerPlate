import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/model/app_state.dart';
import 'package:flutter_boiler_plate/view/auth/login.dart';
import 'package:flutter_boiler_plate/view/home/home.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class InitialPageViewModel {
  final bool isLoggedIn;
  final bool isIntenetConnected;

  InitialPageViewModel({this.isLoggedIn, this.isIntenetConnected});
}

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => new _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, InitialPageViewModel>(
      builder: (BuildContext context, InitialPageViewModel model) {
        return model.isIntenetConnected == null
            ? new Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              )
            : model.isLoggedIn ? new Home() : new Login();
      },
      converter: (Store<AppState> store) => new InitialPageViewModel(
          isLoggedIn: store.state.currentUser != null,
          isIntenetConnected: store.state.isInternetConnected),
    );
  }
}
