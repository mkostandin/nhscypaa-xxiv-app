## Push Notifications

Many configurations had to be made to enable push notifications in the app. Special permissions needed to be granted to the app identifiers, bundles, and other components in each of the App Store and Google Play Store. A request would need to be sent to the user.

### Firebase

To send a notification, a user must be authenticated and logged in. These users would be primarily concerned with their privacy, so Anonymous login in Firebase was used. The users would opt-in in the settings page by toggling a slider which would log them in.

<p align="center">
<img src="https://github.com/mkostandin/mkostandin/blob/main/anon-login-firebase.png" style="display:block;margin:auto;" alt="Anonymous Login" width="50%"/>
</p>

<p align="center">
<img src="https://github.com/mkostandin/mkostandin/blob/main/buildship-notifications-cron.png" style="display:block;margin:auto;" alt="Buildship Diagram" width="50%"/>
</p>

<p align="center">
<img src="https://github.com/mkostandin/mkostandin/blob/main/cloud-message-example-firestore.png" style="display:block;margin:auto;" alt="Cloud Message Example" width="50%"/>
</p>
