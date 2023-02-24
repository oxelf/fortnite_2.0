/// Ping sent response model
class PingSent {
  //accountID of the person that sent the Ping
  String? sentBy;

  // Date when the ping was sent
  String? sentAt;

  /// AccountId the ping was sent to
  String? sentTo;

  ///when the ping is going to expire
  String? expiresAt;

  bool? isSent;

  /// Ping Sent Object
  PingSent(
      {this.sentBy, this.expiresAt, this.sentAt, this.sentTo, this.isSent});

  /// from json method for Ping Sent Class.
  factory PingSent.fromJson(Map<String, dynamic> json) => PingSent(
        sentAt: json["sent_at"],
        isSent: json["sent_at"] != ""
            ? json["sent_at"] != "null"
                ? true
                : false
            : false,
        sentBy: json["sent_by"],
        sentTo: json["sent_to"],
        expiresAt: json["expires_at"],
      );
}
