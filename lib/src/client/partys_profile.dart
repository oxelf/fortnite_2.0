import "package:fortnite/src/structures/friend.dart";
import "package:fortnite/src/structures/party_lookup.dart";

import "client.dart";

/// mcp profile manager library
abstract class PartysProfile {
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

  // Lookup object. refresh it by calling refreshLookup function.
  late PartyLookup partyLookup;

  /// FriendsProfile object
  PartysProfile(this.client) {
    accountId = client.accountId;
  }

  bool confirmInitialized() {
    if (initialized) return true;
    throw Exception("Profile is not initialized yet");
  }
}
