class TrainsMdl {
  final List<String> trains;

  TrainsMdl({
    required this.trains,
  });

  factory TrainsMdl.fromJson(Map<String, dynamic> json) {
    List<String> list = List<String>.from(json['trains'] as List);
    return TrainsMdl(
      trains: list,
    );
  }

  Map<String, dynamic> toMapDb(String train) {
    return {
      'train': train,
    };
  }
}
