import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy_provider_sample/article_list_notifier.dart';

class ArticleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleListNotifier>(
      builder: (context, notifier, _) {
        return ListView.builder(
          itemCount: notifier.articles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(notifier.articles[index].title),
                  ),
                  Offstage(
                    offstage: notifier.articles[index].isFree,
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