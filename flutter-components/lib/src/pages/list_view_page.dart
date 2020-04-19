import 'package:flutter/material.dart';

import 'dart:async';

class ListviewPage extends StatefulWidget {
  ListviewPage({Key key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListviewPage> {
  static const int QUANTITY = 10;

  ScrollController _scrollController = new ScrollController();
  List<int> _numberList;
  int _lastItem = -1;
  bool _loading = false;

  @override
  void initState() {
    super.initState();

    _numberList = new List();
    _addImages(QUANTITY);

    // Add scroll listener
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _addImages(QUANTITY);
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('List')),
        body: Stack(
          children: <Widget>[
            _createList(),
            _createLoading(),
          ],
        ));
  }

  Future<Null> getPage(int page) async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _numberList.clear();
      _lastItem++;
      _addImages(QUANTITY);
    });

    return Future.delayed(duration);
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: () => getPage(1),
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _numberList.length,
          itemBuilder: (BuildContext context, int index) {
            final image = _numberList[index];
            return FadeInImage(
                placeholder: AssetImage('assets/original.gif'),
                image: NetworkImage(
                    'https://i.picsum.photos/id/$image/500/300.jpg'));
          }),
    );
  }

  void _addImages(int quantity) {
    for (var i = 0; i < quantity; i++) {
      _lastItem++;
      _numberList.add(_lastItem);
    }

    setState(() {});
  }

  Future fetchData() async {
    _loading = true;

    setState(() {});

    final Duration duration = new Duration(seconds: 2);
    return new Timer(duration, httpResponse);
  }

  void httpResponse() {
    _loading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);

    _addImages(QUANTITY);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _createLoading() {
    if (_loading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
