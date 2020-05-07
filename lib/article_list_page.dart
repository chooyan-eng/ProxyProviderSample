import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy_provider_sample/article_list_model.dart';

class ArticleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleListModel>(
      builder: (context, model, _) {
        return ListView.builder(
          itemCount: model.articles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(model.articles[index].title),
                  ),
                  Offstage(
                    offstage: model.articles[index].isFree,
                    child: Text(
                      '会員限定',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}