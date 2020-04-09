import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cards'),
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[_cardType1()],
        ));
  }

  Widget _cardType1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el título de esta tarjeta'),
            subtitle: Text(
                'Esto es el subtítulo de esta tarjeta que va a servir para mostrar que pasa cuando la línea es demasiado larga'),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            FlatButton(onPressed: () {}, child: Text('Calendar')),
            FlatButton(
              onPressed: () {},
              child: Text('Ok'),
            )
          ])
        ],
      ),
    );
  }
}
