class NewsModel{
  // String? v;
  // late String b;
  late Source source;
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  NewsModel({required this.source, required this.author, required this.title, required this.description, required this.publishedAt,
    required this.content, required this.url,required this.urlToImage});

  NewsModel.extractFromJSON(Map<String, dynamic> map){
    source = Source.extractSourceFromJSON(map['source']);
    author = map['author'] ?? "Not Available"; //ternary operator. if value is null it will be assigned not available
    title = map['title'] ?? "Not Available";
    description = map['description'] ?? "Not Available";
    url = map['url'] ?? "Not Available";
    urlToImage = map['urlToImage'] ?? "null";
    publishedAt = map['publishedAt'] ?? "Not Available";
    content = map['content'] ?? "Not Available";
    
  }

}

class Source{
  late String id;
  late String name;
  Source({required this.id, required this.name});
  Source.extractSourceFromJSON(Map <String, dynamic> map){
    id = map['id'] ?? "Not Available";
    name = map['name'] ?? "Not Available";


  }
}

