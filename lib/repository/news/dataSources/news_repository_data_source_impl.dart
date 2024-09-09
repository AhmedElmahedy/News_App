import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/model/NewsResponse.dart';
import 'package:news_app/repository/news/news_data_sources.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    var response = await apiManager.getNewsBySourceId(sourceId);
    return response;
  }
}
