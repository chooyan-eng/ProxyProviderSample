import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy_provider_sample/account_notifier.dart';
import 'package:proxy_provider_sample/article_list_notifier.dart';
import 'package:proxy_provider_sample/article_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProxyProvider sample',
      home: ChangeNotifierProvider(
        create: (context) => AccountNotifier(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('ProxyProvider sample'),
            actions: <Widget>[
              Consumer<AccountNotifier>(
                builder: (context, notifier, _) {
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: notifier.isMember
                          ? Icon(Icons.account_circle)
                          : const Center(child: Text('ログイン')),
                    ),
                    onTap: () => notifier.isMember = !notifier.isMember,
                  );
                },
              ),
            ],
          ),
          body: ChangeNotifierProxyProvider<AccountNotifier, ArticleListNotifier>(
            create: (context) => ArticleListNotifier(),
            update: (context, accountNotifier, articleListNotifier) {
              articleListNotifier.updateList(accountNotifier.isMember);
              return articleListNotifier;
            },
            child: ArticleListPage(),
          ),
        ),
      ),
    );
  }
}
