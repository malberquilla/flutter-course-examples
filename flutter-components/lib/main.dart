import 'package:flutter/material.dart';

import 'src/pages/alert_page.dart';
import 'package:components/src/routes/routes.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: HomePage(),
      initialRoute: '/',
      routes: getAppRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print('Ruta llamada: ${ settings.name }');

        return MaterialPageRoute(builder: (BuildContext context) => AlertPage());
      },
    );
  }
}