import 'package:flutter/material.dart';

class HomeTemp extends StatelessWidget {
  
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco', 'Seis'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temp components'),
      ),
      body: ListView(
        children: _shortCreateItems() 
      ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> lista = new List<Widget>();
    for (String opt in opciones) {
      final tempWidget = ListTile(title: Text(opt));
      lista..add(tempWidget)
           ..add(Divider());
    }
    return lista;
  }

  List<Widget> _shortCreateItems() {
    return opciones.map((o) => Column(
      children: <Widget>[
        ListTile(
          title: Text(o), 
          subtitle: Text('num'),
          leading: Icon(Icons.account_box),
          trailing: Icon(Icons.add_a_photo),),
        Divider()
      ],
    )).toList();
  }
}