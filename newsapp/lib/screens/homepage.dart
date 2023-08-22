import 'package:flutter/material.dart';
import 'package:newsapp/services/news_client.dart';
import 'package:newsapp/services/news_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

NewsClient nClient = NewsClient();
Future<List<NewsModel>> getNEWS() async {
  Map<String, dynamic> newsMap = await nClient.getNewsDataFromAPI();
  List<dynamic> nList = newsMap['articles'];
  List<NewsModel> newsList = genericToSpecificObject(nList);
  return newsList;
}

genericToSpecificObject(List<dynamic> list) {
  List<NewsModel> newsList = list.map((singleObject) {
    NewsModel singleNews = NewsModel.extractFromJSON(singleObject);
    return singleNews;
  }).toList();
  return newsList;
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text("NEWS "),
        centerTitle: true,
      ),
      body: Container(
        // color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
            future: getNEWS(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        // height: MediaQuery.of(context).size.height * 0.6,
                        child: Card(
                          color: Color.fromARGB(255, 177, 177, 177),
                          child: Column(
                            children: [
                              Image.network(snapshot.data![index].urlToImage),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  snapshot.data![index].title,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  snapshot.data![index].description,
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }
              return Container();
            }),
      ),
    ));
  }
}
