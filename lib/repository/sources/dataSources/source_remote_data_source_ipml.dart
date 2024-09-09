import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/model/SourceResponse.dart';
import 'package:news_app/repository/sources/source_date_sources.dart';

class SourceRemoteDataSourceIpml implements SourceRemoteDateSources {
  ApiManager apiManager;

  SourceRemoteDataSourceIpml({required this.apiManager});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var response = await apiManager.getSources(categoryId);
    return response;
  }
}
