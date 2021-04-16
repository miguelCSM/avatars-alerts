import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('MG'),
              backgroundColor: Colors.red,
              
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/spider-man-remastered-ps5-esquire-4-1605525077.jpg?crop=0.524xw:1.00xh;0.298xw,0&resize=640:*'),
              radius: 25,
            ),
          )

        ],
        ), 
        body: Center(
          child: FadeInImage(
            image: NetworkImage('https://i.pinimg.com/736x/80/32/0c/80320c335e7d2c96e1c6a86d456fd93c.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 1000),
          ),
        ),
    );
  }
}