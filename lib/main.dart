import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy_provider_sample/account_model.dart';
import 'package:proxy_provider_sample/article_list_model.dart';
import 'package:proxy_provider_sample/article_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProxyProvider sample',
      home: ChangeNotifierProvider(
        create: (context) => AccountModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('ProxyProvider sample'),
            actions: <Widget>[
              Consumer<AccountModel>(
                builder: (context, model, _) {
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: model.isMember
                          ? Icon(Icons.account_circle)
                          : const Center(child: Text('ログイン')),
                    ),
                    onTap: () => model.isMember = !model.isMember,
                  );
                },
              ),
            ],
          ),
          body: ChangeNotifierProxyProvider<AccountModel, ArticleListModel>(
            create: (context) => ArticleListModel(),
            update: (context, accountModel, articleListModel) {
              articleListModel.updateList(accountModel.isMember);
              return articleListModel;
            },
            child: ArticleListPage(),
          ),
        ),
      ),
    );
  }
}
