class IrTrainListModel {
  String train;

  IrTrainListModel({
    required this.train,
  });

  factory IrTrainListModel.fromJson(Map<String, dynamic> json) {
    return IrTrainListModel(
      train: json["train"] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'train': train,
    };
  }

  @override
  String toString() {
    return train;
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is IrTrainListModel && other.train == train;
  }

  @override
  int get hashCode => Object.hash(train, "");
}
