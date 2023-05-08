class RevGeocodingModel {
  final String _state;
  final String _country;

  String get getState => _state;
  String get getCountry => _country;

  RevGeocodingModel(
    this._state,
    this._country,
  );

  factory RevGeocodingModel.fromJson(Map<String, dynamic> json) {
    return RevGeocodingModel(
      json["state"] as String,
      json["area"] as String,
    );
  }
}
