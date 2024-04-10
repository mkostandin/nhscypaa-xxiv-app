## Push Notifications

Many configurations had to be made to enable push notifications in the app. Special permissions needed to be granted to the app identifiers, bundles, and other components in each of the App Store and Google Play Store. A request would need to be sent to the user.

### Firebase

To send a notification, a user must be authenticated and logged in. These users would be primarily concerned with their privacy, so Anonymous login in Firebase was used. The users would opt-in in the settings page by toggling a slider which would log them in. No cost was incurred by this step.

<p align="center">
<img src="https://github.com/mkostandin/mkostandin/blob/main/anon-login-firebase.png" style="display:block;margin:auto;" alt="Anonymous Login" width="50%"/>
</p>

### Buildship Message Scheduling

A workflow was created that used a cron scheduler, some basic javascript in a custom node, and a switch node with many cases.

The cron scheduler took the following form ` * /10 6 4 * ` which set up an event to happen every 10 minutes on April 6th after that the workflow would be disabled.

A custom Javascript node was made to takes in an environment variable from the workflow, increment it, and then output it back as an environment variable.

``` javascript
export default async ({iterator}) => {
  iterator++;
  
return iterator;
  
}
```
A switch node was made using a csv file of the schedule where 85 cases broke up the time when users would give their permission to receive notifications. Each time the event occurred, the iterator was incremented and used to select the switch case which contained the FlutterFlow Push notification node.

<p align="center">
<img src="https://github.com/mkostandin/mkostandin/blob/main/buildship-notifications-cron.png" style="display:block;margin:auto;" alt="Buildship Diagram" width="50%"/>
</p>

<p align="center">
<img src="https://github.com/mkostandin/mkostandin/blob/main/cloud-message-example-firestore.png" style="display:block;margin:auto;" alt="Cloud Message Example" width="50%"/>
</p>
