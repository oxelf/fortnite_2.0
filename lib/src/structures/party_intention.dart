/// Ping sent response model
class PartyIntention {
  //accountID of the person that sent the Ping
  String? requesterId;

  // Date when the ping was sent
  String? requesteeId;

  /// AccountId the ping was sent to
  String? requesterPl;

  ///when the ping is going to expire
  String? requesterPlDn;

  String? requesterDn;

  String? sentAt;

  String? expiresAt;

  Map<String, dynamic>? meta;

  bool? isSent;

  /// PartyLookup Object
  PartyIntention(
      {this.requesterDn,
      this.requesterId,
      this.requesteeId,
      this.requesterPl,
      this.requesterPlDn,
      this.sentAt,
      this.expiresAt,
      this.meta,
      this.isSent});

  /// from json method for Ping Sent Class.
  factory PartyIntention.fromJson(Map<String, dynamic> json) => PartyIntention(
        requesteeId: json["requestee_id"],
        requesterId: json["requester_id"],
        requesterDn: json["requester_dn"],
        requesterPl: json["requester_pl"],
        requesterPlDn: json["requester_pl_dn"],
        sentAt: json["sent_at"],
        expiresAt: json["expires_at"],
        meta: json["meta"] ?? [],
        isSent: json["requester_dn"] != null ? true : false,
      );
}
