class IrGrpListModel {
  final String id;
  final String state;
  final String contactNo;
  final String whatsapp;

  IrGrpListModel({
    required this.id,
    required this.state,
    required this.contactNo,
    required this.whatsapp,
  });

  factory IrGrpListModel.fromJson(Map<String, dynamic> json) {
    return IrGrpListModel(
      id: json["id"] as String,
      state: json["state"] as String,
      contactNo: json["contact_number"] as String,
      whatsapp: json["whatsapp"] ?? '',
    );
  }
}
