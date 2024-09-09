import 'package:news_app/home/model/NewsResponse.dart';
import 'package:news_app/repository/news/news_data_sources.dart';
import 'package:news_app/repository/news/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
    return remoteDataSource.getNewsBySourceId(sourceId);
  }
}
