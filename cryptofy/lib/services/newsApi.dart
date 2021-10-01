
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';







    NewsAPI _newsAPI = NewsAPI("36b126750ab34b9a840e9a371f0c98a2");
    
    Future <List<Article>> getNewsData(String query)async{
      //print(_newsAPI.apiKey);
      var articleList = await _newsAPI.getEverything(query:query);
      var date=(articleList[0].publishedAt);
      print(date.toString().substring(0,10));

      return articleList;
    }

    