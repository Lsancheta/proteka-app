import 'package:flutter/material.dart';
import 'package:proteka_app/models/posto.dart';
import 'package:proteka_app/repositories/checklist_repository.dart';
import 'package:proteka_app/services/auth_service.dart';
import '../models/checklist.dart';
import '../repositories/posto_repository.dart';
import 'assinatura_page.dart';

class ChecklistPage extends StatefulWidget{
  //final GlobalKey<ChecklistPage> _checkListKey = GlobalKey();

  final Local posto;
  const ChecklistPage({Key? key, required this.posto}) : super(key: key);
  @override
  State<ChecklistPage>createState() => _ChecklistPageState();
}
class _ChecklistPageState extends State<ChecklistPage>{
  Checklist? checklist;
  @override
   void initState() {
     // TODO: implement initState
     super.initState();
     checklist;
   }
   final tcheck = ChecklistRepository.chklist;
  final tposto = PostoRepository.tabela;
   @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.posto.nome)
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text('Rotina de Higienização - Sanitários',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
            ),
            ListView.builder(
              shrinkWrap:true,
              itemCount: tcheck.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  child: Column(
                      children:<Widget>[
                        CheckboxListTile(
                            title:Text(tcheck[index].checklist),
                            value: tcheck[index].checked,
                            onChanged:(bool? val) {
                              setState(() {
                                tcheck[index].checked = val!;
                              });
                            })

                      ]
                  )
              );
            }),
            const SizedBox(
              height:20,
            ),
            ElevatedButton(
              onPressed: (){
                //assinaturaPage
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> const AssinaturaPage())
                );
              }
              , child: const Text('Assinatura'),
            ),
            ElevatedButton(
              onPressed: () async{
                // confirmar se foi feito assinatura
                //if(ChangeNotifier(AssinaturaPage) = true)


                // salvar checklist
                int i = 0;
                debugPrint('Relatório');
                debugPrint('Posto: ${widget.posto.posto}');
                debugPrint('Usuario: %user%');
                debugPrint('______________________');
                for (var element in tcheck) {
                  i++;
                  if(element.checked == true){
                    //debugPrint('selecionou$i: ${element.checked}');
                    debugPrint('Efetuado: ${element.checklist}');
                  }
                  if(element.checked ==false){
                    debugPrint('Não efetuado: ${element.checklist}');
                  }
                }
                debugPrint('_________________________________');
               // tcheck.currentState!.clear();
                setState(() {
                  for(var element in tcheck){
                    i++;
                    if(element.checked == true){
                      setState(() {
                        element.checked = false;
                      });
                    }
                  }
                });
                var snackBar = const SnackBar(content: Text('Checklist Salvo!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              child: const Text('Salvar'),
            ),
          ]
        )
      )
    );
  }
}
