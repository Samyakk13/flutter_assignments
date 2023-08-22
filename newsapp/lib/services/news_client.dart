import 'package:dio/dio.dart';

class NewsClient{
  Dio dio = Dio();
  getNewsDataFromAPI() async{
    String newsURL = "https://newsapi.org/v2/top-headlines?country=in&apiKey=8426b5abdbfc4f4a9245008d3d0caf64";
    try{
      var response = await dio.get(newsURL);
      print("response ${response.data}");
      return response.data;
    }
    catch(error){
      print("Error in fetching data from API");
    }
  }
}