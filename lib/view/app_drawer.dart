import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/actions/auth_actions.dart';
import 'package:flutter_boiler_plate/model/app_state.dart';
import 'package:flutter_boiler_plate/model/app_user.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class DrawerViewModel {
  final VoidCallback logOut;
  final AppUser currentUser;
  final bool isInternetConnected;

  DrawerViewModel({
    this.logOut,
    this.currentUser,
    this.isInternetConnected,
  });
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, DrawerViewModel>(
      converter: (Store<AppState> store) => new DrawerViewModel(
            logOut: () => store.dispatch(new LogOutUser()),
            currentUser: store.state.currentUser,
            isInternetConnected: store.state.isInternetConnected,
          ),
      builder: (BuildContext context, DrawerViewModel logOutModel) =>
          new Drawer(
            child: new Column(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName:
                      new Text(logOutModel.currentUser.name.toString()),
                  accountEmail:
                      new Text(logOutModel.currentUser.uid.toString()),
                  currentAccountPicture: const CircleAvatar(
                      backgroundColor: Colors.brown, child: const Text('AA')),
                ),
                new Expanded(
                  child: new Column(
                    children: <Widget>[
                      new ListTile(
                        title: const Text('Home'),
                        leading: const Icon(Icons.home),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                new ListTile(
                  title: const Text('Sign Out'),
                  leading: const Icon(Icons.remove),
                  onTap: () {
                    Navigator.pop(context);
                    if (logOutModel.isInternetConnected) {
                      logOutModel.logOut();
                    } else {
                      Scaffold.of(context).showSnackBar(const SnackBar(
                            content: const Text(
                                'No Internet Connection. Cannot perform SignOut action.'),
                            backgroundColor: Colors.redAccent,
                          ));
                    }
                  },
                )
              ],
            ),
          ),
    );
  }
}
