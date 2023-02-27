# Fortnite 2.0 Package

A Package for using the unofficial Epicgames/Fortnite API. This package is based on the fortnite [package](https://pub.dev/packages/fortnite).

## Installation

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
    fortnite_2: any
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
Events:
|Function          | Description                           |
|---------|------------------------------------------------|
|events   |Returns a list of events for the season|
|tokens   |A List of tokens the player has. Tokens are granted when you reach a new division in arena or when you unlock a new event.|           
|getEventHistory|Returns a list with the results for the event from the authenticated player.|
|getEventWindowHistory|Returns the result for the eventWindow from the authenticated player.|
|getEventFlags|Returns eventFlags(Dont really know what this is used for.)|


You can access Events Functions like this: 
```dart
client.events.init();
client.events.events;
```                              
Friends: 
|Function          | Description                                            |
|------------------|--------------------------------------------------------|
|friendsList       |The list of friends for the authenticated player        |
|blockList         |The list of blocked friends for the authenticated player|
|add               |Add a Friend using his account Id                       |
|delete            |Delete a Friend using his account Id                    |
|accept            |Accept friend request by using account Id               |
|decline           |Decline friend request by using account Id              |
|block             |Block friend using his account Id                       |
|unblock           |Unblock friend using his account Id                     |
|set Nickname      |Set a Friend nickname using his account Id              |
|remove Nickname   |Remove a nickname of a friend using his account Id      |
|get Mutuals       |Returns the friends that you and a friend have in common|  

<table>
    <tr>
        <td>Function</td>
        <td>Description</td>
    </tr>
    <tr>
        <td>friendsList</td>
        <td>The list of friends for the authenticated player</td>
    </tr>
    <tr>
        <td>blockList</td>
        <td>The list of blocked friends for the authenticated player</td>
    </tr>
    <tr>
        <td>add</td>
        <td>Add a Friend using his account Id</td>
    </tr>
    <tr>
        <td>delete</td>
        <td>Delete a Friend using his account Id</td>
    </tr>
    <tr>
        <td>accept</td>
        <td>Accept friend request by using account Id</td>
    </tr>
    <tr>
        <td>decline</td>
        <td>Decline friend request by using account Id</td>
    </tr>
    <tr>
        <td>block</td>
        <td>Block friend using his account Id</td>
    </tr>
    <tr>
        <td>unblock</td>
        <td>Unblock friend using his account Id</td>
    </tr>
    <tr>
        <td>set Nickname</td>
        <td>Set a Friend nickname using his account Id</td>
    </tr>
    <tr>
        <td>remove Nickname</td>
        <td>Remove a nickname of a friend using his account Id</td>
    </tr>
    <tr>
        <td>get Mutuals</td>
        <td>Returns the friends that you and a friend have in common</td>
    </tr>
</table>


You can access Friends Functions like this: 
```dart
client.friends.init();
client.friends.friendsList;
```

Commoncore:
|Function          | Description                                                 |
|------------------|-------------------------------------------------------------|
|accountId         |The accountId of the authenticated Player.                   |
|created           |Date when the Epic Account was created.                      |
|servertime        |The time of the server that is used for the account.         |
|Campaign access   |Returns true if the player has STW.                          |
|supported creator |The creator currently supported by the user.                 |
|total Vbucks      |The amount of Vbucks the player has in the moment.           |
|Vbucks purchased  |The amount of vbucks bought since creating the account.      |
|Vbucks Breakdown  |Breakdown of the vbucks that you currently have.             |
|gift History      |Returns account Ids that send and received gifts from player.|
|affiliate settime |Returns the date when the affiliate was set.                 |
|refundToken       |The amount of refund Tokens left for the user.               |
|refundsUsed       |How much refunds were used since creation of the account.    |
|allowedToSentGifts|Returns true if the user is allowed to sent gifts.           |
|allowedToReceiveGifts|Returns true if the user is allowed to receive gifts.     |
|setSupportedCreator|Allows user to set a new creatorcode.                       |
|current mtx platform|The current vbucks platform.                               |
|setMTXPlatform    |Set the Vbucks platform.                                     |
|supportedCreatorId|The account Id of the supported Creator.                     |


You can access Commoncore Functions like this: 
```dart
client.commonCore.init();
client.commonCore.accountId;
```

Athena:
|Function          | Description                                            |
|------------------|--------------------------------------------------------|
|skins             |List of skins the player owns.                          |
|backpacks         |List of backpacks the player owns.                      |
|pickaxes          |List of pickaxes the player owns.                       |
|gliders           |List of gliders the player owns.                        |
|dances            |List of dances the player owns.                         |
|itemwraps         |List of wraps the player owns.                          |
|loading screens   |List of loading screens the player owns.                |
|music packs       |List of music packs the player owns.                    |
|skydive contrails |List of skydive contrails the player owns.              |
|equipped skin     |The skin currently used by the player.                  |
|gold              |The amount of gold the player has in public.            |
|accountlevel      |The accountlevel of the player.                         |
|battlepass level  |The current battle pass level.                          |
|battle Stars      |The amount of Battle Stars the player has.              |
|total Battle Stars|The total amount of Battle Stars earned in the season.  |
|battlePassPurchased|Returns true if the battle pass was purchased.         |
|lastMatch         |The Date when the last match ended.                     |
|seasonNumber      |The number of the current Season.                       |
|storefront        |The complete Store(bundles, skins, vbucks offers ...)   |

You can access Athena Functions like this: 
```dart
client.athena.init();
client.athena.gold;
```

Party(Almost every party function needs a party id, and because we dont have the fortnite xmpp implemented, we can only get it via the get invites function because the party id gets sent when someone invites you. Currently not possible to get the party id your currently in.): 
|function | Description |
|--------------|------------------------------------|
|party invites |shows the invites you received.     |
|promoteMember  |lets you promote Member to leader. |
|party Lookup  |Get Information about a party.      |  

The package also offers alot of STW functions and resources, you can access them
