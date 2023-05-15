import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proteka_app/pages/usuario_page.dart';
import 'package:proteka_app/repositories/posto_repository.dart';
import 'package:proteka_app/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'meu_aplicativo.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create:(context)=>AuthService()),
        //ChangeNotifierProvider(create:(context)=>UsuarioPage()),
        //ChangeNotifierProvider(create:(context)=>PostoRepository(),
      ],
      child:const MeuAplicativo(),
    ),
  );
}


