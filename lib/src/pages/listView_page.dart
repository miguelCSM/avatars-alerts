import 'package:flutter/material.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // nos servirá para agregar elementos (imagenes a nuestro listView)
  List<int> _ListaNumeros = new List();

  int _ultimoItem = 0;

  bool _isLoading = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listas')),
      body: Stack(
        children: <Widget>[_crearLista(), _crearLoading()],
      ),
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _ListaNumeros.length, //Cantidad de items que se desea cargar
      itemBuilder: (BuildContext context, int index) {
        final imagen = _ListaNumeros[index];

        return FadeInImage(
          image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );
      },
    );
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});
    final duracion = new Duration(seconds: 3);
    return new Timer(duracion, responseHTTP);
  }

  void responseHTTP() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 150,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _agregar10();
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      //_ultimoItem++;
      _ListaNumeros.add(_ultimoItem++);
      setState(() {});
    }
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
        ],
      );
    }
    return Container();
  }
}
