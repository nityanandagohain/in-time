import 'package:in_time/models/quotes_model.dart';
import 'package:in_time/models/quotes_model_new.dart';
import 'package:in_time/resources/quotes_repository.dart';
import 'package:rxdart/rxdart.dart';

class QuotesBloc {
  final _repository = QuotesRepository();
  final _quotesFetcher = PublishSubject<Q>();

  Observable<Q> get allQuotes => _quotesFetcher.stream;

  fetchAllMovies() async {
    Q quotesModel = await _repository.fetchAllMovies();
    _quotesFetcher.sink.add(quotesModel);
  }

  dispose() {
    _quotesFetcher.close();
  }
}

final bloc = QuotesBloc();
