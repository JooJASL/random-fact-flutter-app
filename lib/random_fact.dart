import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:random_fact/apikeys.dart';

Uri uriThingy = Uri(
    scheme: 'https',
    host: 'numbersapi.p.rapidapi.com',
    path: 'random/trivia', //?min=5&max=10&fragment=true&json=true
    queryParameters: <String, dynamic>{
      'min': '5',
      'max': '10',
      'json': 'true',
    });

class RandomFactResponse {
  final String text;
  final int number;
  final bool wasFound;
  final String type;

  RandomFactResponse(
      {required this.text,
      required this.number,
      required this.wasFound,
      required this.type});
}

Future<RandomFactResponse> getRandomFact() async {
  var headers = {
    'x-rapidapi-host': 'numbersapi.p.rapidapi.com',
    'x-rapidapi-key': RandomFactAPI.randomFactKey,
  };

  var response = await http.get(uriThingy, headers: headers);
  var jsonData = jsonDecode(response.body);
  return RandomFactResponse(
      text: jsonData["text"],
      number: jsonData["number"],
      wasFound: jsonData["found"],
      type: jsonData["type"]);
}
