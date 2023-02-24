class Event {
  Event({
    this.gameId,
    this.eventId,
    this.regions,
    this.regionMappings,
    this.platforms,
    this.platformMappings,
    this.displayDataId,
    this.eventGroup,
    this.announcementTime,
    this.link,
    this.metadata,
    this.eventWindows,
    this.beginTime,
    this.endTime,
  });
  late final String? gameId;
  late final String? eventId;
  late final List<String>? regions;
  late final RegionMappings? regionMappings;
  late final List<String>? platforms;
  late final PlatformMappings? platformMappings;
  late final String? displayDataId;
  late final String? eventGroup;
  late final String? announcementTime;

  late final Link? link;
  late final Metadata? metadata;
  late final List<EventWindows>? eventWindows;
  late final String? beginTime;
  late final String? endTime;

  Event.fromJson(Map<String, dynamic> json) {
    gameId = json["gameId"];
    eventId = json["eventId"];
    regions = List.castFrom<dynamic, String>(json["regions"]);
    regionMappings = RegionMappings.fromJson(json["regionMappings"]);
    platforms = List.castFrom<dynamic, String>(json["platforms"]);
    platformMappings = PlatformMappings.fromJson(json["platformMappings"]);
    displayDataId = json["displayDataId"];
    eventGroup = json["eventGroup"];
    announcementTime = json["announcementTime"];
    link = Link.fromJson(json["link"]);
    metadata = Metadata.fromJson(json["metadata"]);
    eventWindows = List.from(json["eventWindows"])
        .map((e) => EventWindows.fromJson(e))
        .toList();
    beginTime = json["beginTime"];
    endTime = json["endTime"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data["gameId"] = gameId;
    _data["eventId"] = eventId;
    _data["regions"] = regions;
    _data["regionMappings"] = regionMappings!.toJson();
    _data["platforms"] = platforms;
    _data["platformMappings"] = platformMappings!.toJson();
    _data["displayDataId"] = displayDataId;
    _data["eventGroup"] = eventGroup;
    _data["announcementTime"] = announcementTime;
    _data["link"] = link!.toJson();
    _data["metadata"] = metadata!.toJson();
    _data["eventWindows"] = eventWindows!.map((e) => e.toJson()).toList();
    _data["beginTime"] = beginTime;
    _data["endTime"] = endTime;
    return _data;
  }
}

class RegionMappings {
  RegionMappings();

  RegionMappings.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class PlatformMappings {
  PlatformMappings();

  PlatformMappings.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class Link {
  Link({
    required this.type,
    required this.code,
    required this.version,
  });
  late final String? type;
  late final String? code;
  late final int? version;

  Link.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    code = json["code"];
    version = json["version"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data["type"] = type;
    _data["code"] = code;
    _data["version"] = version;
    return _data;
  }
}

class Metadata {
  Metadata({
    this.accountLockType,
    required this.teamLockType,
    required this.disqualifyType,
    required this.minimumAccountLevel,
  });
  late final String? accountLockType;
  late final String? teamLockType;
  late final String? disqualifyType;
  late final int? minimumAccountLevel;

  Metadata.fromJson(Map<String, dynamic> json) {
    accountLockType = json["AccountLockType"];
    teamLockType = json["TeamLockType"];
    disqualifyType = json["DisqualifyType"];
    minimumAccountLevel = json["minimumAccountLevel"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data["AccountLockType"] = accountLockType;
    _data["TeamLockType"] = teamLockType;
    _data["DisqualifyType"] = disqualifyType;
    _data["minimumAccountLevel"] = minimumAccountLevel;
    return _data;
  }
}

class EventWindows {
  EventWindows({
    this.eventWindowId,
    this.eventTemplateId,
    this.countdownBeginTime,
    this.beginTime,
    this.endTime,
    this.blackoutPeriods,
    this.round,
    this.payoutDelay,
    this.isTBD,
    this.canLiveSpectate,
    this.scoreLocations,
    this.visibility,
    this.requireAllTokens,
    this.requireAnyTokens,
    this.requireNoneTokensCaller,
    this.requireAllTokensCaller,
    this.requireAnyTokensCaller,
    this.additionalRequirements,
    this.teammateEligibility,
    this.metadata,
  });
  late final String? eventWindowId;
  late final String? eventTemplateId;
  late final String? countdownBeginTime;
  late final String? beginTime;
  late final String? endTime;
  late final List<dynamic>? blackoutPeriods;
  late final int? round;
  late final int? payoutDelay;
  late final bool? isTBD;
  late final bool? canLiveSpectate;
  late final List<ScoreLocations>? scoreLocations;
  late final String? visibility;
  late final List<dynamic>? requireAllTokens;
  late final List<String>? requireAnyTokens;
  late final List<String>? requireNoneTokensCaller;
  late final List<dynamic>? requireAllTokensCaller;
  late final List<dynamic>? requireAnyTokensCaller;
  late final List<String>? additionalRequirements;
  late final String? teammateEligibility;

  late final Metadata? metadata;

  EventWindows.fromJson(Map<String, dynamic> json) {
    eventWindowId = json["eventWindowId"];
    eventTemplateId = json["eventTemplateId"];
    countdownBeginTime = json["countdownBeginTime"];
    beginTime = json["beginTime"];
    endTime = json["endTime"];
    blackoutPeriods = List.castFrom<dynamic, dynamic>(json["blackoutPeriods"]);
    round = json["round"];
    payoutDelay = json["payoutDelay"];
    isTBD = json["isTBD"];
    canLiveSpectate = json["canLiveSpectate"];
    scoreLocations = List.from(json["scoreLocations"])
        .map((e) => ScoreLocations.fromJson(e))
        .toList();
    visibility = json["visibility"];
    requireAllTokens =
        List.castFrom<dynamic, dynamic>(json["requireAllTokens"]);
    requireAnyTokens = List.castFrom<dynamic, String>(json["requireAnyTokens"]);
    requireNoneTokensCaller =
        List.castFrom<dynamic, String>(json["requireNoneTokensCaller"]);
    requireAllTokensCaller =
        List.castFrom<dynamic, dynamic>(json["requireAllTokensCaller"]);
    requireAnyTokensCaller =
        List.castFrom<dynamic, dynamic>(json["requireAnyTokensCaller"]);
    additionalRequirements =
        List.castFrom<dynamic, String>(json["additionalRequirements"]);
    teammateEligibility = json["teammateEligibility"];

    metadata = Metadata.fromJson(json["metadata"]);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data["eventWindowId"] = eventWindowId;
    _data["eventTemplateId"] = eventTemplateId;
    _data["countdownBeginTime"] = countdownBeginTime;
    _data["beginTime"] = beginTime;
    _data["endTime"] = endTime;
    _data["blackoutPeriods"] = blackoutPeriods;
    _data["round"] = round;
    _data["payoutDelay"] = payoutDelay;
    _data["isTBD"] = isTBD;
    _data["canLiveSpectate"] = canLiveSpectate;
    _data["scoreLocations"] = scoreLocations!.map((e) => e.toJson()).toList();
    _data["visibility"] = visibility;
    _data["requireAllTokens"] = requireAllTokens;
    _data["requireAnyTokens"] = requireAnyTokens;
    _data["requireNoneTokensCaller"] = requireNoneTokensCaller;
    _data["requireAllTokensCaller"] = requireAllTokensCaller;
    _data["requireAnyTokensCaller"] = requireAnyTokensCaller;
    _data["additionalRequirements"] = additionalRequirements;
    _data["teammateEligibility"] = teammateEligibility;

    _data["metadata"] = metadata!.toJson();
    return _data;
  }
}

class ScoreLocations {
  ScoreLocations({
    this.scoreMode,
    this.scoreId,
    this.leaderboardId,
    this.useIndividualScores,
    this.windowEndCondition,
  });
  late final String? scoreMode;
  late final String? scoreId;
  late final String? leaderboardId;
  late final bool? useIndividualScores;
  late final String? windowEndCondition;

  ScoreLocations.fromJson(Map<String, dynamic> json) {
    scoreMode = json["scoreMode"];
    scoreId = json["scoreId"];
    leaderboardId = json["leaderboardId"];
    useIndividualScores = json["useIndividualScores"];
    windowEndCondition = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data["scoreMode"] = scoreMode;
    _data["scoreId"] = scoreId;
    _data["leaderboardId"] = leaderboardId;
    _data["useIndividualScores"] = useIndividualScores;
    _data["windowEndCondition"] = windowEndCondition;
    return _data;
  }
}
