import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/home/model/NewsResponse.dart';
import 'package:news_app/home/model/SourceResponse.dart';

class ApiManager{
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=fc10793011b54c4fbcd456a7924e743a
 */
 static Future<SourceResponse?> getSources(String categoryId)async{
   Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.sourcesApi,
       {
     'apiKey' : ApiConstants.apiKey,
         'category' : categoryId
   }
   );
   try{
     var response = await http.get(url);
     var responseBody = response.body;   /// String
     var json = jsonDecode(responseBody); /// json
     return SourceResponse.fromJson(json);  /// object
   }catch(e){
     throw e;
   }
 }

 /*
 https://newsapi.org/v2/everything?q=bitcoin&apiKey=fc10793011b54c4fbcd456a7924e743a
  */
 static Future<NewsResponse?> getNewsBySourceId(String sourceId)async{
   Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,{
     'apiKey':ApiConstants.apiKey,
     'sources' : sourceId
   });
   try {
    var response = await http.get(url);
    return NewsResponse.fromJson(jsonDecode(response.body));
    // var responseBody = response.body;
    // var json = jsonDecode(responseBody);
    // return NewsResponse.fromJson(json);
   }catch(e){
     throw e;
   }
 }
}