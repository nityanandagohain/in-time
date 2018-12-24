import 'dart:async';

import 'package:in_time/models/quotes_model.dart';
import 'package:in_time/resources/quotes_api_provider.dart';

class QuotesRepository {
  final quotesApiProvider = QuotesApiProvider();

  Future<QuotesModel> fetchAllMovies() => quotesApiProvider.fetchMovieList();
}