import'package:flutter/material.dart';
import 'package:proteka_app/widgets/auth_check.dart';
import 'package:provider/provider.dart';

class MeuAplicativo extends StatelessWidget{
  const MeuAplicativo({Key? key}):super(key:key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    title: 'Proteka App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
        home:AuthCheck(),
    );
  }
}