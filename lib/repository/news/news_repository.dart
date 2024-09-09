import 'package:news_app/home/model/NewsResponse.dart';

abstract class NewsRepository {
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}
