import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/util_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Components')), body: _loadList());
  }

  Widget _loadList() {
    // menuProvider.dataLoad();

    return FutureBuilder(
      future: menuProvider.dataLoad(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        print(snapshot.data);
        return ListView(
          children: _loadListItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _loadListItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opts = [];
    data.forEach((opt) {
      final widget = ListTile(
          title: Text(opt['text']),
          leading: getIcon(opt['icon']),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {
            // final route = MaterialPageRoute(builder: (context) => AlertPage());
            // Navigator.push(context, route);

            Navigator.pushNamed(context, opt['route']);
          });

      opts..add(widget)..add(Divider());
    });

    return opts;
  }
}
