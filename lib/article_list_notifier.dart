import 'package:flutter/material.dart';

class Article {
  final int id;
  final String title;
  final bool isFree;

  const Article(this.id, this.title, this.isFree);
}

const dataSource = [
  Article(1, 'Flutter入門', true),
  Article(2, 'Dart入門', true),
  Article(3, 'Effective Dartを翻訳してみた', false),
  Article(4, 'Providerまとめ', false),
  Article(5, 'よく使うWidget一覧', true),
  Article(6, 'RichTextを使い倒す', false),
  Article(7, 'FlutterのWidgetテスト', true),
  Article(8, 'Dartのユニットテスト', true),
  Article(9, 'FlutterでWebアプリケーションを作る', false),
  Article(10, '【Flutter】TODOアプリ作った', false),
];

class ArticleListNotifier extends ChangeNotifier{
  final articles = <Article>[];

  void updateList(bool isMember) {
    articles.clear();
    if (isMember) {
      articles.addAll(dataSource);
    } else {
      articles.addAll(dataSource.where((article) => article.isFree));
    }
    notifyListeners();
  }
}