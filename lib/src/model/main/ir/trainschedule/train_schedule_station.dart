class TrainScheduleStation {
  final String station;
  final int day;
  final int distance;
  final String platform;
  final String depTime;
  final String arrTime;
  final String halTime;
  final bool revDir;

  TrainScheduleStation({
    required this.station,
    required this.day,
    required this.distance,
    required this.platform,
    required this.depTime,
    required this.arrTime,
    required this.halTime,
    required this.revDir,
  });

  factory TrainScheduleStation.fromJson(Map<String, dynamic> json) {
    return TrainScheduleStation(
      station: json["station"] as String,
      day: json["day"] as int,
      distance: json["distance"] as int,
      platform: json["platform"] ?? '',
      depTime: json["dep_time"] ?? '',
      arrTime: json["arv_time"] ?? '',
      halTime: json["halt_time"] ?? '',
      revDir: json["rev_dir"] as bool,
    );
  }
}
