import "package:fortnite/src/client/events_profile.dart";
import "package:fortnite/src/structures/event.dart";

import "../../resources/endpoints.dart";
import "client.dart";

/// common core profile manager library
class Events extends EventsProfile {
  /// common core profile object
  Events(Client client)
      : super(
          client,
        );

  /// init the profile, requires the region to query the events. possible Params: ["EU", "NAE", "NAW", "ME", "OCE", "ASIA", "BR"]
  Future<dynamic> init(String region) async {
    if (initialized == true) return;

    var res = await client.send(
      method: "GET",
      url:
          "${Endpoints().eventsService}/events/Fortnite/download/$accountId?region=$region&platform=Windows&teamAccountIds=$accountId",
      body: {},
    );

    List<Event> _events = [];
    List eventList = res["events"];
    for (int i = 0; i < eventList.length; i++) {
      var event = Event.fromJson(res["events"][i]);
      _events.add(event);
    }
    events = _events;
    tokens = res["player"]["tokens"];
    initialized = true;
    client.log(
        LogLevel.info, "events module initialized [${client.accountId}]");
  }

  Future<dynamic> getEventWindowHistory(
      String eventWindowId, String eventId) async {
    var response = await client.send(
      method: "GET",
      url:
          "${Endpoints().eventsService}/events/Fortnite/$eventId/$eventWindowId/history/$accountId",
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

  //Returns the data for the sessions played in the event from the event Id like points scored etc. Required is the eventId the history should be queried for.
  Future<dynamic> getEventHistory(String eventId) async {
    var response = await client.send(
      method: "GET",
      url:
          "${Endpoints().eventsService}/events/Fortnite/$eventId/history/${client.accountId}",
      body: {},
    );

    if (response.toString() != "null" && response.toString() != "") {
      return response;
    } else {
      return response;
    }
  }

  //If you want Data for another region or platform than from the init. possible Param: ["EU","NAE", "NAW", "ME", "OCE", "ASIA", "BR"] ["Windows"]
  Future<dynamic> getEvents(
      String accountId, String region, String platform) async {
    var response = await client.send(
      method: "GET",
      url:
          "${Endpoints().eventsService}/events/Fortnite/download/$accountId?region=$region&platform=$platform&teamAccountIds=$accountId",
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

  //returns event flags
  Future<dynamic> getEventFlags() async {
    var response = await client.send(
      method: "GET",
      url: Endpoints().eventFlags,
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
