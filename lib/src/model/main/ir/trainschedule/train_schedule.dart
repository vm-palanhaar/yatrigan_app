import 'package:yatrigan/src/model/main/ir/trainschedule/train_schedule_station.dart';

class TrainSchedule {
  final int trainNo;
  final String trainName;
  final String runStatus;
  final String duration;
  final String stationFrom;
  final String stationTo;
  List<TrainScheduleStation> stations;

  TrainSchedule({
    required this.trainNo,
    required this.trainName,
    required this.runStatus,
    required this.duration,
    required this.stationFrom,
    required this.stationTo,
    required this.stations,
  });

  factory TrainSchedule.fromJson(Map<String, dynamic> json) {
    var responseData = json['stations'] as List;
    List<TrainScheduleStation> trainStations = responseData
        .map<TrainScheduleStation>(
            (json) => TrainScheduleStation.fromJson(json))
        .toList();
    var runData = json['run_status'] as List;
    String listRunDays =
        runData.toString().replaceAll("[", "").replaceAll("]", "");
    return TrainSchedule(
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
