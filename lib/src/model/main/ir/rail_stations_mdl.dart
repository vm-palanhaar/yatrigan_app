class RailStationsMdl {
  final List<String> stations;

  RailStationsMdl({
    required this.stations,
  });

  factory RailStationsMdl.fromJson(Map<String, dynamic> json) {
    List<String> list = List<String>.from(json['stations'] as List);
    return RailStationsMdl(
      stations: list,
    );
  }

  Map<String, dynamic> toMapDb(String station) {
    return {
      'station': station,
    };
  }
}
