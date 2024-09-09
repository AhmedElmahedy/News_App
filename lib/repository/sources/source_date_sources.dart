import 'package:news_app/home/model/SourceResponse.dart';

abstract class SourceRemoteDateSources {
  Future<SourceResponse?> getSources(String categoryId);
}

abstract class SourceLocalDateSources {}
