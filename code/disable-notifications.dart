import 'package:firebase_messaging/firebase_messaging.dart';

Future deactivateNotifications() async {

  if (!(FFAppState().showNotifications)) {
    await Future.delayed(Duration(seconds: 2));
    FirebaseMessaging.instance.deleteToken();
  }
}
