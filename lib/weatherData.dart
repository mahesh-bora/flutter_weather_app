import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weatherModel.dart';
class WeatherData{
  Future<Weather> getData(var latitude, var longitude) async{
    var uriCall = Uri.parse('http://api.weatherapi.com/v1/current.json?key=de18e73f468f4adfa9b192407231306&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}