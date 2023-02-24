import "package:fortnite/src/client/partys_profile.dart";
import "package:fortnite/src/structures/friend.dart";
import "package:fortnite/src/structures/party_lookup.dart";

import "../../resources/endpoints.dart";
import "../../resources/epic_services.dart";
import "client.dart";

/// partys profile manager library
class Partys extends PartysProfile {
  /// common core profile object
  Partys(Client client)
      : super(
          client,
        );

  /// init the profile
  Future<dynamic> init() async {
    if (initialized == true) return;
    print(
        "${EpicServices().friendService}/friends/api/public/friends/$accountId");
    var res = await client.send(
      method: "GET",
      url:
          "${EpicServices().friendService}/friends/api/public/friends/$accountId",
      body: {},
    );
    var res2 = await client.send(
      method: "GET",
      url: "${Endpoints().fortniteParty}/user/$accountId",
      body: {},
    );
    partyLookup = PartyLookup.fromJson(res2);

    List<Friend> _friendsList = [];
    List _listLength = res;
    for (int i = 0; i < _listLength.length; i++) {
      var friend = Friend.fromJson(res[i]);
      _friendsList.add(friend);
    }
    friendsList = _friendsList;
    displayName = client.displayName;
    accountId = client.accountId;
    profileId = "friends";

    initialized = true;
    client.log(
        LogLevel.info, "friends module initialized [${client.accountId}]");
  }

  //refresh the party lookup object. returns true if done.
  Future<bool> refreshLookup() async {
    var response = await client.send(
      method: "GET",
      url: "${Endpoints().fortniteParty}/user/$accountId",
      body: {},
    );
    print(response.toString());
    if (response.toString() != "null" && response != null) {
      partyLookup = PartyLookup.fromJson(response);
      return true;
    } else {
      return false;
    }
  }

  //Add a Friend or, if a request from him already exists, accept him as Friend.
  Future<dynamic> friendAddOrAccept(String friendId) async {
    var response = await client.send(
      method: "POST",
      url:
          "${EpicServices().friendService}/friends/api/v1/$accountId/friends/$friendId",
      body: {},
    );
    print(response.toString());
    if (response.toString() != "null" && response.toString() != "") {
      // Map<String, dynamic> json = jsonDecode(response);

      return response;
    } else {
      return response;
    }
  }

  //Add a Friend or, if a request from him already exists, accept him as Friend.
  Future<dynamic> friendRemoveOrDecline(String friendId) async {
    var response = await client.send(
      method: "DELETE",
      url:
          "${EpicServices().friendService}/friends/api/v1/$accountId/friends/$friendId",
      body: {},
    );
    print(response.toString());
    if (response.toString() != "null" && response.toString() != "") {
      // Map<String, dynamic> json = jsonDecode(response);

      return response;
    } else {
      return response;
    }
  }

  //Block a friend, using his account id
  Future<dynamic> blockFriend(String friendId) async {
    var response = await client.send(
      method: "POST",
      url:
          "${EpicServices().friendService}/friends/api/v1/$accountId/blocklist/$friendId",
      body: {},
    );
    print(response.toString());
    if (response.toString() != "null" && response.toString() != "") {
      // Map<String, dynamic> json = jsonDecode(response);

      return response;
    } else {
      return response;
    }
  }

  //Unblock a friend, using his account id
  Future<dynamic> unblockFriend(String friendId) async {
    var response = await client.send(
      method: "DELETE",
      url:
          "${EpicServices().friendService}/friends/api/v1/$accountId/blocklist/$friendId",
      body: {},
    );
    print(response.toString());
    if (response.toString() != "null" && response.toString() != "") {
      // Map<String, dynamic> json = jsonDecode(response);

      return response;
    } else {
      return response;
    }
  }

  // //set nickname
  // Future<dynamic> setNickname(String friendId, String nickname) async {
  //   var response = await client.send(
  //     method: "PUT",
  //     url:
  //         "${EpicServices().friendService}/friends/api/v1/$accountId/friends/$friendId/alias",
  //     body: {},
  //   );
  //   print(response.toString());
  //   if (response.toString() != "null" && response.toString() != "") {
  //     // Map<String, dynamic> json = jsonDecode(response);

  //     return response;
  //   } else {
  //     return response;
  //   }
  // }
  Future<dynamic> removeNickname(String friendId) async {
    var response = await client.send(
      method: "DELETE",
      url:
          "${EpicServices().friendService}/friends/api/v1/$accountId/friends/$friendId/alias",
      body: {},
    );
    print(response.toString());
    if (response.toString() != "null" && response.toString() != "") {
      // Map<String, dynamic> json = jsonDecode(response);

      return response;
    } else {
      return response;
    }
  }

  Future<dynamic> getMutualFriends(String friendId) async {
    var response = await client.send(
      method: "GET",
      url:
          "${EpicServices().friendService}/friends/api/v1/$accountId/friends/$friendId/mutual",
      body: {},
    );
    print(response.toString());
    if (response.toString() != "null" && response.toString() != "") {
      // Map<String, dynamic> json = jsonDecode(response);

      return response;
    } else {
      return response;
    }
  }
}
