import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class MatchModel {
  //final Map<String, String> teams;
  final String date;
  final String location;
  final String referee;

  final Result result;
  //final Map<String, int> result;
  final String videoUrl;
  final String analysisText;
  final List<EventModel> events;
  final String teamX, teamY;
  MatchModel({
    required this.teamX,
    required this.teamY,
    //required this.teams,
    required this.date,
    required this.location,
    required this.referee,
    required this.result,
    required this.videoUrl,
    required this.analysisText,
    required this.events,
  });

  factory MatchModel.fromMap(Map<String, dynamic> map) {
    log("Firestore Data: $map");

    return MatchModel(
      teamX: map['teams']['x'],
      teamY: map['teams']['y'],
      //Map<String, String>.from(map["teams"] ?? {}),
      date: map["date"] ?? Timestamp.now(),
      location: map["location"] ?? "Unknown",
      referee: map["referee"] ?? "Unknown",
      /*result: {
        "xResult": map["result"]?["xResult"] ?? 0,
        "yResult": map["result"]?["yResult"] ?? 0,
      },*/
      // Ensuring correct mapping
      result: Result.fromMap(map['result']),
      videoUrl: map["videoUrl"] ?? "",
      analysisText: map["analysisText"] ?? "No analysis available",
      events:
          (map["events"] as List<dynamic>?)
              ?.map((event) => EventModel.fromMap(event))
              .toList() ??
          [],
    );
  }
}

class EventModel {
  final String time;
  final String event;
  final String team;
  final String player;
  final String description;

  EventModel({
    required this.time,
    required this.event,
    required this.team,
    required this.player,
    required this.description,
  });

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      time: map["time"]?.toString() ?? "Unknown",
      event: map["event"] ?? "Unknown Event",
      team: map["team"] ?? "Unknown Team",
      player: map["player"] ?? "Unknown Player",
      description: map["description"] ?? "No description",
    );
  }
}

class Result {
  final int xResult, yResult;
  Result({required this.xResult, required this.yResult});

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(xResult: map['xResult'], yResult: map['yResult']);
  }
}
