class IrStationListModel {
  String code;
  String name;

  get getCode => code;
  get getName => name;

  IrStationListModel({required this.code, required this.name});

  factory IrStationListModel.fromJson(Map<String, dynamic> json) {
    return IrStationListModel(
      code: json["code"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
    };
  }

  @override
  String toString() {
    return '$code, $name';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is IrStationListModel &&
        other.code == code &&
        other.name == name;
  }

  @override
  int get hashCode => Object.hash(code, name);
}