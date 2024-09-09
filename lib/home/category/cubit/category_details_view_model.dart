import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/category/cubit/source_state.dart';
import 'package:news_app/repository/sources/dataSources/source_remote_data_source_ipml.dart';
import 'package:news_app/repository/sources/repository/source_repository_impl.dart';
import 'package:news_app/repository/sources/source_date_sources.dart';
import 'package:news_app/repository/sources/source_repository.dart';

class CategoryDetailsViewModel extends Cubit<SourceState> {
  late SourceRepository sourceRepository;
  late SourceRemoteDateSources remoteDateSources;
  late ApiManager apiManager;

  CategoryDetailsViewModel() : super(SourceLoadingState()) {
    apiManager = ApiManager();
    remoteDateSources = SourceRemoteDataSourceIpml(apiManager: apiManager);
    sourceRepository =
        SourceRepositoryImpl(remoteDateSources: remoteDateSources);
  }

  /// todo : hold Data - handel logic

  void getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await sourceRepository.getSources(categoryId);
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMassage: response!.message!));
      }
      if (response?.status == 'ok') {
        emit(SourceSuccessState(sourcesList: response!.sources!));
      }
    } catch (e) {
      emit(SourceErrorState(errorMassage: e.toString()));
    }
  }
}
