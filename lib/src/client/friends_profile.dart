import "package:fortnite/src/structures/account_id.dart";
import "package:fortnite/src/structures/friend.dart";

import "client.dart";

/// mcp profile manager library
abstract class FriendsProfile {
  /// The master client
  late final Client client;

  // Displayname of the player.
  late String displayName;

  /// account id of the player
  late String accountId;

  /// is the profile initialized
  bool initialized = false;

  // The profileId
  late String profileId;

  //List of all Friends including friends that dont accepted your request yet.
  late List<Friend> friendsList = [];

  //List of all accountIds from the blockList.
  late List<AccountId> blockList = [];

  //List of last online from friends
  late Map<String, dynamic> lastOnlineList;

  /// FriendsProfile object
  FriendsProfile(this.client) {
    accountId = client.accountId;
  }

  bool confirmInitialized() {
    if (initialized) return true;
    throw Exception("Profile is not initialized yet");
  }
}
