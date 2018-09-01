import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/actions/auth_actions.dart';
import 'package:flutter_boiler_plate/model/app_state.dart';
import 'package:flutter_boiler_plate/utils/app_theme.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class LoginViewModel {
  final VoidCallback login;
  final bool isLoggingIn;
  final bool isInternetConnected;

  LoginViewModel({this.login, this.isLoggingIn, this.isInternetConnected});
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _username, _password;

  void _showSnackBar(String error) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(error),
      backgroundColor: Colors.redAccent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, LoginViewModel>(
      converter: (Store<AppState> store) => new LoginViewModel(
            login: () => store.dispatch(new LoginUser(
                username: _username,
                password: _password,
                onError: _showSnackBar)),
            isLoggingIn: store.state.isLoggingIn,
            isInternetConnected: store.state.isInternetConnected,
          ),
      builder: (BuildContext context, LoginViewModel loginModal) =>
          new Scaffold(
            key: _scaffoldKey,
            body: new Container(
              color: Colors.white,
              child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      'https://raw.githubusercontent.com/flutter/website/master/src/_includes/code/layout/lakes/images/lake.jpg',
                    ),
//                  new Text(loginModal.isInternetConnected ? 'Internet Connection Available' : 'No Internet Connection Available'),
                    new Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                      child: new Form(
                        key: formKey,
                        child: new Column(
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new TextFormField(
                                style: AppTextStyle.blackTextH3,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter username';
                                  }
                                },
                                initialValue: 'abc@gmail.com',
                                onSaved: (String val) => _username = val,
                                decoration: new InputDecoration(
                                  labelText: 'UserName',
                                ),
                              ),
                            ),
                            new Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new TextFormField(
                                style: AppTextStyle.blackTextH3,
                                obscureText: true,
                                // Use secure text for passwords.
                                initialValue: 'Password@123',
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter password';
                                  }
                                },
                                onSaved: (String val) => _password = val,
                                decoration: new InputDecoration(
                                  labelText: 'Password',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    loginModal.isLoggingIn
                        ? const CircularProgressIndicator()
                        : new Container(
                      width: 300.0,
                      color: Colors.red,
                          child: new RaisedButton(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: new Text(
                                  'Login',
                                  style: AppTextStyle.whiteTextH5Bold,
                                ),
                              ),
                              color: Colors.blue,
                              elevation: 4.0,
                              splashColor: Colors.blueGrey,
                              onPressed: () {
                                final FormState form = formKey.currentState;
                                if (form.validate()) {
                                  form.save();
                                  // Dismiss keyboard
                                  FocusScope
                                      .of(context)
                                      .requestFocus(new FocusNode());
                                  if(loginModal.isInternetConnected){
                                    loginModal.login();
                                  } else {
                                    _showSnackBar('No Internet Connection.');
                                  }
                                }
                              },
                            ),
                        ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
            ),
          ),
    );
  }
}
