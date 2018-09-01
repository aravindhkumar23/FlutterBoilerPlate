import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/utils/status.dart';
import 'package:simple_permissions/simple_permissions.dart';

class Utils {
  static Future<AlertStatus> alertUser({
    @required BuildContext context,
    @required String yesButtonTitle,
    @required String noButtonTitle,
    String alertTitle,
    String alertContent,
  }) {
    return showDialog<AlertStatus>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => new AlertDialog(
            title: new Text(
                alertTitle == null ? 'Are you sure to go back?' : alertTitle),
            content: new Text(alertContent == null
                ? 'You unsaved data will be lost'
                : alertContent),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(AlertStatus.yes);
                },
                child: new Text(yesButtonTitle),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(AlertStatus.no);
                },
                child: new Text(noButtonTitle),
              ),
            ],
          ),
    );
  }

  static Future<bool> checkWritePermission() async {
    if (Platform.isIOS) {
      return false;
    }
    bool permission = false;
    await SimplePermissions
        .checkPermission(Permission.WriteExternalStorage)
        .then((bool checkOkay) {
      if (!checkOkay) {
        SimplePermissions
            .requestPermission(Permission.WriteExternalStorage)
            .then((bool okDone) {
          if (okDone) {
            permission = true;
          }
        });
      } else {
        permission = true;
      }
    });
    return permission;
  }

  static Future<bool> checkReadPermission() async {
    if (Platform.isIOS) {
      return false;
    }
    bool permission = false;
    SimplePermissions
        .checkPermission(Permission.ReadExternalStorage)
        .then((bool checkOkay) {
      if (!checkOkay) {
        SimplePermissions
            .requestPermission(Permission.ReadExternalStorage)
            .then((bool okDone) {
          if (okDone) {
            permission = true;
          }
        });
      } else {
        permission = true;
      }
    });
    return permission;
  }

  static String timestamp() =>
      new DateTime.now().millisecondsSinceEpoch.toString();

  //splits enum string and gives value
  static String getStringFromEnum(dynamic data) {
    try {
      return data.toString().split('.').last.toLowerCase();
    } catch (e) {
      return null;
    }
  }
}

//<<<<<---- delete confirmation sample ->>>>
//final AlertStatus status = await Utils.alertUser(
//context: context,
//yesButtonTitle: 'Yes',
//noButtonTitle: 'No',
//alertTitle: 'Are you sure to delete?',
//alertContent: 'You cannot able to undo this action.');
//if (status == null) {
////user pressed android back button
//} else if (status == AlertStatus.yes) {
//// user clicked save
//} else {
//// user clicked exit
//}

//<<<<<<<------ pushing to new route -------->>>>>>>

//Navigator.push<void>(
//context,
//SlideFromLeftRoute(widget: new Screen()),
//);
