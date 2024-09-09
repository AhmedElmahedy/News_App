import 'package:news_app/home/model/NewsResponse.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}
