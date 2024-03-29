import 'Articles.dart';
import 'dart:convert';

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));
String articlesToJson(Articles data) => json.encode(data.toJson());

class Articles {
  Articles({
      this.status, 
      this.totalResults, 
      this.articles,});

  Articles.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }
  String? status;
  num? totalResults;
  List<Articles>? articles;
Articles copyWith({  String? status,
  num? totalResults,
  List<Articles>? articles,
}) => Articles(  status: status ?? this.status,
  totalResults: totalResults ?? this.totalResults,
  articles: articles ?? this.articles,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}