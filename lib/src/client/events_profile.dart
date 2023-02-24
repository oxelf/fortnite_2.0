import "package:fortnite/src/structures/event.dart";

import "client.dart";

/// mcp profile manager library
abstract class EventsProfile {
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

  //List of all events define the region
  late List<Event> events = [];

  //List of the tokens the player has. A Player gets a token granted when a player reaches a new division in arena. Arena Division can be found out from here.
  late List<dynamic> tokens = [];

  /// mcp profile object
  EventsProfile(this.client) {
    accountId = client.accountId;
  }

  bool confirmInitialized() {
    if (initialized) return true;
    throw Exception("Profile is not initialized yet");
  }
}
