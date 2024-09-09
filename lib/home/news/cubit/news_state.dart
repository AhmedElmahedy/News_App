import 'package:news_app/home/model/NewsResponse.dart';

class NewsState {}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsErrorState extends NewsState {
  String massage;

  NewsErrorState({required this.massage});
}

class NewsSuccessState extends NewsState {
  List<News> newsList;

  NewsSuccessState({required this.newsList});
}
