class Friend {
  Friend({
    this.accountId,
    this.status,
    this.direction,
    this.created,
    this.favorite,
  });
  late final String? accountId;
  late final String? status;
  late final String? direction;
  late final String? created;
  late final bool? favorite;

  Friend.fromJson(Map<String, dynamic> json) {
    accountId = json["accountId"];
    status = json["status"];
    direction = json["direction"];
    created = json["created"];
    favorite = json["favorite"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data["accountId"] = accountId;
    _data["status"] = status;
    _data["direction"] = direction;
    _data["created"] = created;
    _data["favorite"] = favorite;
    return _data;
  }
}
