class IrHelplineMdl {
  final String id;
  final String name;
  final String desc;
  final String contactNo;
  final String whatsApp;

  IrHelplineMdl({
    required this.id,
    required this.name,
    required this.desc,
    required this.contactNo,
    required this.whatsApp,
  });

  factory IrHelplineMdl.fromJson(Map<String, dynamic> json) {
    return IrHelplineMdl(
      id: json['id'] as String,
      name: json['name'] as String,
      desc: json['desc'] as String,
      contactNo: json['contact_number'] as String,
      whatsApp: json['whatsapp'] ?? '',
    );
  }
}
