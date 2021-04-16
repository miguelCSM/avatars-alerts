import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page')
        ),
        body: Center(
          child: ElevatedButton(
            child:  Text('Alerta'),
            onPressed: ()=> _mostrarAlert(context),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              shape: StadiumBorder()
            ),
          )
        ),
    );
  }

  _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Contenido de alerta'),
              FlutterLogo(size: 100,)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: ()=> Navigator.of(context).pop()),
            FlatButton(
              child: Text('Cancel'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }
}