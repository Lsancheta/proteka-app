import 'package:flutter/material.dart';
import 'package:proteka_app/pages/home_page.dart';
import 'package:provider/provider.dart';
import '../pages/login_page.dart';
import '../services/auth_service.dart';

class AuthCheck extends StatefulWidget{
  AuthCheck({Key? key}): super(key: key);

  @override
  _AuthCheckState createState()=> _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck>{
  @override
  Widget build(BuildContext context){
    AuthService auth = Provider.of<AuthService>(context);

    if(auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return LoginPage();
    } else
      return HomePage();
  }
  loading(){
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }


}