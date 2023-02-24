/// Ping sent response model
class PartyLookup {
  //accountID of the person that sent the Ping
  List<dynamic>? current;

  // Date when the ping was sent
  List<dynamic>? pending;

  /// AccountId the ping was sent to
  List<dynamic>? invites;

  ///when the ping is going to expire
  List<dynamic>? pings;

  bool? isSent;

  /// PartyLookup Object
  PartyLookup(
      {this.current, this.pending, this.invites, this.pings, this.isSent});

  /// from json method for Ping Sent Class.
  factory PartyLookup.fromJson(Map<String, dynamic> json) => PartyLookup(
        current: json["current"],
        pending: json["pending"],
        invites: json["invites"],
        pings: json["pings"],
        isSent: json["pending"] != null ? true : false,
      );
}
