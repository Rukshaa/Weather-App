class Weather{
  final double location;
  final String name;
  final double lat;
  final double lon;
  final String condition;
  // final int icon;

  Weather({required this.location,required this.name, required this.lat, required this.lon,required this.condition});
factory Weather.fromJson(Map<String, dynamic>json) {
  return Weather(
    // temp:json['location']['temp'],
    location:json['location']["lat"].toDouble(),
    name: json['location']['name'],
    lat:json['location']['lat'].toDouble(),
    lon:json['location']['lon'].toDouble(),
    condition:json['current']['condition']['text'],
    // icon:json['condition']['icon'],

  );
}
}