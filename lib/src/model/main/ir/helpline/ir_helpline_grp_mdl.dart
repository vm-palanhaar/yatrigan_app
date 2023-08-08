class IrHelplineGrpMdl {
  final String id;
  final String state;
  final String contactNo;
  final String whatsApp;

  IrHelplineGrpMdl({
    required this.id,
    required this.state,
    required this.contactNo,
    required this.whatsApp,
  });

  factory IrHelplineGrpMdl.fromJson(Map<String, dynamic> json) {
    return IrHelplineGrpMdl(
      id: json['id'] as String,
      state: json['state'] as String,
      contactNo: json['contact_number'] as String,
      whatsApp: json['whatsapp'] ?? '',
    );
  }
}
