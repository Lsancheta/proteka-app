import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthException implements Exception{
  String message;
  AuthException(this.message);
}
class AuthService extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService(){
    _authCheck();
  }

  _authCheck(){
    _auth.authStateChanges().listen((User? user){
      usuario = (user == null) ? null: user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser(){
    usuario = _auth.currentUser;
    notifyListeners();
  }

  login(String re, String senha) async{
    try{
      await _auth.signInWithEmailAndPassword(email:re, password: senha);
      _getUser();
    }on FirebaseAuthException catch(e){
      if(e.code =='user-not-found'){
        throw AuthException('RE não encontrado, entre em contato com a supervisão');
      } else if (e.code =='wrong-password'){
        throw AuthException('Senha incorreta, tente novamente');
      }
    }
  }

  logout() async{
    await _auth.signOut();
    _getUser();
  }
}