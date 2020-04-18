import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  bool _imageResizable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Expanded(child: _createImage())
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Image size',
        value: _sliderValue,
        min: 100.0,
        max: 250.0,
        onChanged: _sliderOnChange());
  }

  Function _sliderOnChange() {
    return _imageResizable
        ? null
        : (value) {
            setState(() {
              _sliderValue = value;
            });
          };
  }

  Widget _createImage() {
    return Image(
        image: NetworkImage(
            'https://i.pinimg.com/originals/66/67/40/6667405a729b7d39e0daaa338fff32cf.png'),
        width: _sliderValue,
        fit: BoxFit.contain);
  }

  Widget _createCheckbox() {
    return CheckboxListTile(
        title: Text('Image resizable: '),
        value: _imageResizable,
        onChanged: (value) {
          setState(() {
            _imageResizable = value;
          });
        });
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text('Image resizable: '),
        value: _imageResizable,
        onChanged: (value) {
          setState(() {
            _imageResizable = value;
          });
        });
  }
}
