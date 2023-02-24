class AccountId {
  AccountId({
    required this.accountId,
  });
  late final String accountId;

  AccountId.fromJson(Map<String, dynamic> json) {
    accountId = json["accountId"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data["accountId"] = accountId;
    return _data;
  }
}
