import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:in_time/models/quotes_model.dart';
import 'package:in_time/models/quotes_model_new.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuotesApiProvider {
  Future<Q> fetchMovieList() async {
    print("entered 2");
    // var uri = "https://gist.githubusercontent.com/knightcube/48ee2da4221303a22dabd0c99daa317b/raw/94712c18af649c22bea89255404afc92494998c9/quotes.json";
    var uri2 = "http://quotes.rest/qod.json?category=inspire";
    var response = await http.get(uri2);
    print(response.body.toString());

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Q.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
