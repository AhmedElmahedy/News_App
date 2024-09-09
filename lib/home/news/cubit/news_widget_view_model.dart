import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/news/cubit/news_state.dart';
import 'package:news_app/repository/news/dataSources/news_repository_data_source_impl.dart';
import 'package:news_app/repository/news/news_data_sources.dart';
import 'package:news_app/repository/news/news_repository.dart';
import 'package:news_app/repository/news/repository/news_repository_impl.dart';

class NewsWidgetViewModel extends Cubit<NewsState> {
  late ApiManager apiManager;

  late NewsRemoteDataSource remoteDataSource;
  late NewsRepository newsRepository;

  NewsWidgetViewModel() : super(NewsLoadingState()) {
    apiManager = ApiManager();
    remoteDataSource = NewsRemoteDataSourceImpl(apiManager: apiManager);
    newsRepository = NewsRepositoryImpl(remoteDataSource: remoteDataSource);
  }

  /// todo : hold data - handel Logic
  void getNewsBySourceId(String sourceId) async {
    try {
      emit(NewsLoadingState());
      var response = await newsRepository.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        emit(NewsErrorState(massage: response!.massage!));
      } else if (response?.status == 'ok') {
        emit(NewsSuccessState(newsList: response!.articles!));
      }
    } catch (e) {
      emit(NewsErrorState(massage: e.toString()));
    }
  }
}
