# Fortnite 2.0 Package

A Package for using the unofficial Epicgames/Fortnite API. This package is based on the fortnite [package](https://pub.dev/packages/fortnite).

## Installation

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
    fortnite: any
```

then run in terminal

```
dart pub get
```

## How to use
First you need to get an auth token from an url like this: [https://www.epicgames.com/id/api/redirect?clientId=3446cd72694c4a4485d81b77adbb2141&responseType=code](https://www.epicgames.com/id/api/redirect?clientId=3446cd72694c4a4485d81b77adbb2141&responseType=code)

you can get this url also by calling this function in dart: 
```dart
getAuthorizationCodeURL();
```

next you need to make a deviceauth object. You can do this by using your auth token from the url.
```dart
 deviceAuth = await authenticateWithAuthorizationCode(
      authorizationCode, // authorization code
    );
```
It would be optimal if you write your deviceauth to a file, or a cloud, because you will need it every time when you want to access player specific data and to initialize the client object.
This is an example on how to write the device auth to a file:
```dart
final File deviceAuthFile = File("device_auth.json");

await deviceAuthFile.writeAsString(
      JsonEncoder().convert({
        "accountId": deviceAuth.accountId,
        "deviceId": deviceAuth.deviceId,
        "secret": deviceAuth.secret,
        "displayName": deviceAuth.displayName,
      }),
    );
```
And this is how you read it from a file: 
```dart
final Map<String, dynamic> deviceAuthDetails =
      jsonDecode(await deviceAuthFile.readAsString());
 deviceAuth = DeviceAuth.fromJson(deviceAuthDetails);
```
Next you need to initialize the client. You can do it like this: 
```dart
final Client client = Client(
    options: ClientOptions(
      log: true,
      deviceAuth: deviceAuth,
      logLevel: Level.ALL,
    ),
    overrideSession: "",
  )..onSessionUpdate.listen((update) {
      print("Session updated for ${update.accountId}");
      /// Any function you want to do with updated session.
    });
```
Next step is to initialize a client profile
Here is a list of the available profiles:
- commoncore(purchases, vbucks, creator code)
- athena(skins, cosmetic related stuff)
- friends(friendslist, blocklist, add, delete etc.)
- events(getting events for the season aswell as tournament data for the authenticated user)
you can initialize them by calling the init() function every profile has.
```dart
await client.commonCore.init();
```
After initializing the profile you can access its propertys like the friendslist of the friends profile:
```dart
client.friends.friendsList;
```

## What you can do with the package

|Function          |profile    | Description                           |param                                                                |
|------------------|-----------|---------------------------------------|---------------------------------------------------------------------|
|findPlayers       |client     |Returns a list of similar player names.|String prefix = the playername you want to get similar results for.  |
|getAvatars        |client     |Returns a list of avatar urls.         |List accountIds = the list of accountIds you want to get avatars for.|
|refreshSession    |client     |Creates a new oauth token.             |no parameters.                                                       |
|confirmInitialized|every      |Returns true if the profile is init.   |no parameters.                                                       |
|getEventHistory   |events     |Returns results for authenticated      |String eventId = the eventId for event to query.                     |
                               |players sessions for the eventId.      |
|


