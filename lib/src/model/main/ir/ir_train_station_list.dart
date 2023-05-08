class TrainStationList {
  final int trainNo;
  final String trainName;
  final String runStatus;
  final String duration;
  final String stationFrom;
  final String stationTo;
  List<String> stations;

  TrainStationList({
    required this.trainNo,
    required this.trainName,
    required this.runStatus,
    required this.duration,
    required this.stationFrom,
    required this.stationTo,
    required this.stations,
  });

  factory TrainStationList.fromJson(Map<String, dynamic> json) {
    String listRunDays = '';
    var runData = json['run_status'] as List;
    listRunDays = runData.toString().replaceAll("[", "").replaceAll("]", "");
    var stationData = json['stations'] as List;
    List<String>? trainStations = List.from(stationData);
    return TrainStationList(
      trainNo: json["train_no"] as int,
      trainName: json["train_name"] as String,
      runStatus: listRunDays,
      duration: json["duration"] ?? '',
      stationFrom: json["station_from"] as String,
      stationTo: json["station_to"] as String,
      stations: trainStations,
    );
  }
}
