import'package:flutter/material.dart';
import 'package:proteka_app/pages/checklist_page.dart';
import 'package:proteka_app/pages/setores_page.dart';
import 'package:proteka_app/pages/usuario_page.dart';
import 'package:proteka_app/repositories/posto_repository.dart';
import 'package:proteka_app/models/posto.dart';
import 'package:proteka_app/services/auth_service.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget{
  HomePage({Key? key}): super(key:key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context){
    final tabela = PostoRepository.tabela;
    // alterar rotas
    // mostrarSetor(Local posto){
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (_) => SetoresPage(posto: posto),
    //   ));
    // }

    mostrarChecklist(Local posto){
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => ChecklistPage(posto:posto),
      ));
    }

    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text('PROTEKA APP'),
        actions:<Widget>[
          //logout
          IconButton(
              onPressed: ()=> context.read<AuthService>().logout(),
              icon: Icon(Icons.logout_outlined))
        ]

      ),
      body:ListView.separated(itemBuilder: (BuildContext context, int posto){
        return ListTile(
          leading: const SizedBox(
            width: 40,
            child: Icon(Icons.business_sharp),
          ),
          title:Text(tabela[posto].nome),
           onTap: () => mostrarChecklist(tabela[posto]),
        );
      },
          padding: EdgeInsets.all(16),
          separatorBuilder: (_,___)=> Divider(),
          itemCount: tabela.length,
      )
    );
  }
}