import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _birthday = '';

  TextEditingController _inputFieldBirthdayController =
      new TextEditingController();

  List _powers = [
    'Flight',
    'X-rays',
    'Super Strength',
    'Super Speed',
    'Invulnerability'
  ];
  String _powerSelected = 'Flight';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createBirthday(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letters ${_name.length}'),
          hintText: 'Name',
          labelText: 'Name',
          helperText: 'Name only',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Name: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_powerSelected),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _createBirthday(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldBirthdayController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Birthday',
          labelText: 'Birthday',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _birthday = picked.toString();
        _inputFieldBirthdayController.text = _birthday;
      });
    }
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> list = new List();

    _powers.forEach((power) {
      list.add(DropdownMenuItem(child: Text(power), value: power));
    });

    return list;
  }

  Widget _createDropdown() {
    return Row(children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30.0,),
      DropdownButton(
        value: _powerSelected,
        items: getDropdownItems(),
        onChanged: (item) {
          setState(() {
            _powerSelected = item;
          });
        },
      )
    ]);
  }
}
