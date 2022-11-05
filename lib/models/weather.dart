class Weather{
  final double current_temp;
  // final String name;
  final double lat;
  final double lon;
  final String condition;
  // final int icon;

  Weather({required this.current_temp, required this.lat, required this.lon,required this.condition});
factory Weather.fromJson(Map<String, dynamic>json) {
  return Weather(
    current_temp:json['current']['temp_c'].toDouble(),
    // name: json['location']['name'],
    lat:json['location']['lat'].toDouble(),
    lon:json['location']['lon'].toDouble(),
    condition:json['current']['condition']['text'],
    // icon:json['current']['condition']['icon'],
  );
}
}