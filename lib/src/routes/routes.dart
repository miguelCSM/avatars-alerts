import 'package:componentes_01/src/pages/alert_page.dart';
import 'package:componentes_01/src/pages/avatar_page.dart';
import 'package:componentes_01/src/pages/card_page.dart';
import 'package:componentes_01/src/pages/home_page.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> getAplicationRoutes(){
  return <String,WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        'alert': (BuildContext context) => AlertPage(),
        'avatar': (BuildContext context) => AvatarPage(),
        'card': (BuildContext context) => CardPage(),
      };
}