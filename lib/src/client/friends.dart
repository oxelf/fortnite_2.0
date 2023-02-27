import "package:fortnite/src/client/friends_profile.dart";
import "package:fortnite/src/structures/account_id.dart";
import "package:fortnite/src/structures/friend.dart";
import 'package:http/http.dart' as http;
import "../../resources/epic_services.dart";
import "client.dart";

/// common core profile manager library
class Friends extends FriendsProfile {
  /// common core profile object
  Friends(Client client)
      : super(
          client,
        );

  /// init the profile, requires the region to query the events. possible Params: ["EU", "NAE", "NAW", "ME", "OCE", "ASIA", "BR"]
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
      url:
          "${EpicServices().friendService}/friends/api/v1/$accountId/blocklist",
      body: {},
    );
    var res3 = await client.send(
      method: "GET",
      url:
          "${EpicServices().presenceService}/presence/api/v1/_/$accountId/last-online",
      body: {},
    );
    lastOnlineList = res3;
    List<AccountId> _blockList = [];
    // ignore: non_constant_identifier_names
    List ListLength = res2;
    for (int i = 0; i < ListLength.length; i++) {
      var blockedUser = AccountId.fromJson(res2[i]);
      _blockList.add(blockedUser);
    }
    blockList = _blockList;
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

  //Add a Friend or, if a request from him already exists, accept him as Friend.
  // ignore: non_constant_identifier_names
  Future<dynamic> FriendAddOrAccept(String friendId) async {
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

  Future<dynamic> setNickname(String friendId, String nickName) async {
    var response = http.put(
      Uri.parse(
          "${EpicServices().friendService}/friends/api/v1/$accountId/friends/$friendId/alias"),
      body: "$nickName",
      headers: {
        "User-Agent":
            "Fortnite/++Fortnite+Release-18.21-CL-17811397 Android/11",
        "Authorization":
            "bearer eg1~eyJraWQiOiJ0RkMyVUloRnBUTV9FYTNxY09kX01xUVQxY0JCbTlrRkxTRGZlSmhzUkc4IiwiYWxnIjoiUFMyNTYifQ.eyJhcHAiOiJwcm9kLWZuIiwic3ViIjoiMjRjMWM2YzUyMmUyNDE2NWJlZWY2NGViYzRlZDFjMjYiLCJtdmVyIjpmYWxzZSwiY2xpZCI6IjM0NDZjZDcyNjk0YzRhNDQ4NWQ4MWI3N2FkYmIyMTQxIiwiZG4iOiJWQiBPWEVMRiIsImFtIjoiZGV2aWNlX2F1dGgiLCJwZnBpZCI6InByb2QtZm4iLCJwIjoiZU5xOVdGMXY0amdVXC9UK0lWb0pTdEJ1SmgyNm5uYTNVMlZiTGFqUnY2R0xmQkErT25iVWRXdjc5WHBzRUFnMU4wbWIyaVlcL0V2bFwvbm5udnNXQnVuaE1PSVNaMXo2N1NCQkNPN3RRN1Q2QjdCNVFiNWc1V2crT1JTaE1cL1phRHFNeTJVcFdndUpVRWswbnJBUm03THI4UmpIazlIMGVva1lUeWU0WkJQa0l6YWVSb1BaNlBxd3NNN2U5XC9XemhPMFg1SUtCUXo1SHMwSHpGVks4RkVwNHN4a2FxeFZFRnAwam16WUN4blN1WEtOeGI3cDh0XC9pMHpSNm42SUNEZzJpVkxYS0xaaUg0SWpPYXo4YVZCSUJqcXhUV1BnV1draUcwYXQ1WXFBMnRwVzFLbjdKOEtRWGJoNE92RG8wQ2VaTzdsZlcrbzNMQ1NVenBzN0xLNlRXcVNMc1Ztdm5PdEwzWDVtYjM5RllLXC9cL1p2UStcLzVvN0F1MnZ2Y21LM3htVHI1clpxajIxbWVGelg2ZXZcL1hONzBVRWk4dGJNNURJRFA0TjBvRWlcL01BaG50YVlmdDJwSFJCUXE0WVpTM2kra1ZKRFR3YVJQZUZvVnV0SEszNkl4ZVNld2RFRmlCZ01LSDhuaTBaUFdDN2hSZmsya1l3UW9ibXVjUUlqQk14TUZlTnhUb2dcL0sxQkdOME13OW5rMUdhU2crRUNsSjFkRFdNVm8zVmlBNUpTcUdQS1dzdE9wQllEcVFtMEs2QVdwXC84YVFEMG9VZnY3a0ZQQzl1K0NwVzYweCt1YnlXUlVJUk11TE5QVTZkdG16NlZRYXh2RnNOSEd1eklhTmZuOFV3dlZnaDJHQkQrTGlxbzJhSGJDNWt2TGpNaWNiN2hvYVFnXC9ES3lqWFREemlOaFFaczIrbHcrSnlnVGx5R29tcUZZV3diQlZtMDVrT2sxejVSa3htQ3VwSWVMb0lVbXBOUkZiZ1ZJb3FkZjc2NWJuK2FUc2xwSjF5NGlrMXVzODhcL1h1anIyYVwvV3lyUmJFaDc3anRZOHljREpnN1JmTnJQMklxVE50NnVrU1ZSZmE0ejdYQjJHamxlbVd5SFwvTWZmNklVMmg0VDYxSnF0ZzVNMzV6UXlURE9KVlZNaGtBTFhtR2FvMGR4THNFWllLR1Zpa2ZVSGhuQnIwV0JydzZCZGdKRnNMUEdiV0d4dWsrOVZyamp3cjFieXM4a3ZDT2RqU3QwMW4zZUV1a01xZ3JsUkEwMCtsS2JpNnB1S21oVHRlR2JYbVFTN1hOZ2Rac2JHb0FZXC9adlRyNFpZamg2RHBKWUgwM2Z2bFAzeWtVSUZNVVlzZjdHWG9PVk1wblQ3Rk0rbTU4ckkwY3VDUXRLTnpyM2xTMFdvNG9GU3RwK1pUTjVJTVcweUVpSGJJSHppcE5VK1JYQ1ZZTHJEb1lJbERSUzFIMTJMOE9VRmZiWWlBMEl1aWxHOWNMNzVIV21kZlRIS0x3dWpwUzk4a0xNVVF4RlRBbEo2ZEtVRWUyZ1IxQmxpSTVobWRPaUF4T0NPOVA5WGNmeVlLeWpoMkVIVnozY1Nrd1orSVRhRklrbEpJRGtJakNXb01zVEdpRDVGbGQySThxcjJFRmtuM1dvVWRVYWxvNTNmS09uM1MwSzd4Q0twdm5PZ3B2S3ZYb3Y2NXFDemtcL3Mrb3N4UUhCaW1WQ204ZFJ5VGlmRGcxNGlFeVwvbDc1NjZQb3JiTm1lNGplMzhEOXY2bTlTS3VPdTNPTVd1UXJYc0JcL2NDYngyck5kVVJcL0V1TTQ3b2VuK2Y1MFdrenJxbjh2MmtqZWN4V0Z5bFwvM0dyXC9EbEpGMDJIbFM1S1VIcktBV0pVcmRIVTZJWHVsQTBJYU14OTNtMm1FZUZmVG1FRklicVdMaTl0ZzFTXC8zNnBINEJycFwvbjEyODJyZUc5QTRFblJ1ZFpDTEc4bWZpQ204ZVE0TXBZTGllclB3SW0rSThmSGJkQnhWOTNQMWF2aEE4dzZJUTN6R3YwVDJUVVErSGk1Q0tNOStud05jMnl5bG03eFFRK1FzdWdpeHc5YWVaVUtHM3VYak55Q25sVk5kUTFjaERReGZtUklsTllPTkRDXC9FNHdPVGlhSDkwdVd2ckQwSTNpUmd2K0ZrZXRMMkU3NHVKVXVYZFl5Z3pOZlUyRGJUZXcrN2w4cFVIcXczem5WbVJcL0o3SlQyd1M1dGhjSGxKclwvQVByS0EzQT0iLCJpYWkiOiIyNGMxYzZjNTIyZTI0MTY1YmVlZjY0ZWJjNGVkMWMyNiIsInNlYyI6MSwiY2xzdmMiOiJwcm9kLWZuIiwidCI6InMiLCJpYyI6dHJ1ZSwiZXhwIjoxNjc3MzI5MTg2LCJpYXQiOjE2NzczMjE5ODYsImp0aSI6IjMzMTliZWY1YzI0MjRkNDE4N2VjZDhhMzg5NWVjY2RhIn0.AU-GftkOBmMvr8w9hQyUQufLaLcWCUHk98quY4elQRtiyr60b1HOmvt2A7hlLWW9zyg_jKvAq4G2MpSScDL9tdnY",
      },
    );
    // var response = await client.send(
    //   method: "PUT",
    //   url:
    //       "${EpicServices().friendService}/friends/api/v1/$accountId/friends/$friendId/alias",
    //   body: "test",
    // );

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
