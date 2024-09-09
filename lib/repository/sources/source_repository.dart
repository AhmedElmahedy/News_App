import 'package:news_app/home/model/SourceResponse.dart';

abstract class SourceRepository {
  Future<SourceResponse?> getSources(String categoryId);
}
