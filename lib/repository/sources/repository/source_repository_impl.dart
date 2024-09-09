import 'package:news_app/home/model/SourceResponse.dart';
import 'package:news_app/repository/sources/source_date_sources.dart';
import 'package:news_app/repository/sources/source_repository.dart';

class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDateSources remoteDateSources;

  SourceRepositoryImpl({required this.remoteDateSources});

  @override
  Future<SourceResponse?> getSources(String categoryId) {
    return remoteDateSources.getSources(categoryId);
  }
}
