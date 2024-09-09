import 'package:news_app/home/model/SourceResponse.dart';

class SourceState {}

class SourceInitialState extends SourceState {}

class SourceLoadingState extends SourceState {}

class SourceErrorState extends SourceState {
  String errorMassage;

  SourceErrorState({required this.errorMassage});
}

class SourceSuccessState extends SourceState {
  List<Source> sourcesList;

  SourceSuccessState({required this.sourcesList});
}
