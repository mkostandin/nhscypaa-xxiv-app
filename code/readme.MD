## Push Notifications

Many configurations had to be made to enable push notifications in the app. Special permissions needed to be granted to the app identifiers, bundles, and other components in each the App Store and Google Play Store.

### Firebase

To send a notification, a user must be authenticated and logged in. These users would be primarily concerned with their privacy, so Anonymous login in Firebase was used. The user would not be tracked, and data would not be linked to their identity, but they would still be authenticated. The users would opt-in in the settings page by toggling a slider which would trigger an OS permissions request and if accepted it would then log them in. No cost was incurred by this step.

<p align="center">
<img src="https://github.com/mkostandin/mkostandin/blob/main/anon-login-firebase.png" style="display:block;margin:auto;" alt="Anonymous Login" width="50%"/>
</p>

### Buildship Message Scheduling

A workflow was created that used a cron scheduler, some basic javascript in a custom node, and a switch node with many cases.

The cron scheduler took the following form ` * /10 8 6 4 * `, which set up an event to happen every 10 minutes after 8 AM on April 6th. After 10 PM, the workflow would be disabled.

A custom Javascript node was made that takes in an environment variable from the workflow, increments it, and then outputs it back as an environment variable.

``` javascript
export default async ({iterator}) => {
  iterator++;
  
return iterator;
  
}
```
A large switch node was made using a csv file of the schedule where 85 cases broke up the time when users would give their permission to receive notifications. Each time the event occurred, the iterator was incremented and used to select the switch case which contained the FlutterFlow Push notification node.

<p align="center">
<img src="https://github.com/mkostandin/mkostandin/blob/main/buildship-notifications-cron.png" style="display:block;margin:auto;" alt="Buildship Diagram" width="50%"/>
</p>

<p align="center">
<img src="https://github.com/mkostandin/mkostandin/blob/main/cloud-message-example-firestore.png" style="display:block;margin:auto;" alt="Cloud Message Example" width="50%"/>
</p>

No cost was incurred by this step either.

### Disabling Notifications

There are no built-in functions to disable sending notifications, so a custom function was added to FlutterFlow, which was written in Dart. The function creates an instance of the Firebase Cloud Messaging object and deletes the FCM token.

``` dart
import 'package:firebase_messaging/firebase_messaging.dart';

Future deactivateNotifications() async {

  if (!(FFAppState().showNotifications)) {
    await Future.delayed(Duration(seconds: 2));
    FirebaseMessaging.instance.deleteToken();
  }
}
```

## Anonymous Chat

A webview was created for the chat tab of the app. To achieve the best results with embedding Minnit Chat into the app, a web page was hosted on AWS Amplify containing an iframe. There was some SSL certificate problems with going directly from Minnit Chat URL to a webview in the app so an AWS hosted certificate did the trick.  Custom CSS was added to Minnit Chat to disable users being able to access anything but making a nickname and using chat with minimal features to help with moderation and safety concerns.

``` CSS
#topBar {
  display: none;
}

.minnit-chat-msg:hover .msg-dots, .minnit-chat-msg:hover .msg-react-add, .message-bubble .minnit-chat-msg:hover .msg-dots, .message-bubble .minnit-chat-msg:hover .msg-react-add {
  display: none;
}

.msgName {
  pointer-events: none;
}
```

## Reception

The app was very well received and was installed by over 150 users.
<p align="center">
<img src="https://github.com/mkostandin/mkostandin/blob/main/installs.png" style="display:block;margin:auto;" alt="Installs" width="50%"/>
</p>
