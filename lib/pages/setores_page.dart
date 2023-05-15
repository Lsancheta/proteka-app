// import 'package:flutter/material.dart';
// import 'package:proteka_app/models/checklist.dart';
// import 'package:proteka_app/models/posto.dart';
// import 'package:proteka_app/models/setor.dart';
// import 'package:proteka_app/pages/checklist_page.dart';
// import 'package:proteka_app/repositories/checklist_repository.dart';
// import 'package:proteka_app/repositories/setor_repository.dart';
//
// class SetoresPage extends StatefulWidget {
//   final Local posto;
//   const SetoresPage({Key? key, required this.posto}) : super(key: key);
//
//   @override
//   State<SetoresPage> createState() => _SetoresPageState();
// }
//
// class _SetoresPageState extends State<SetoresPage> {
//
//   @override
//   Widget build (BuildContext context){
//     final tabela0 = SetorRepository.sede;
//     final tabela1 = SetorRepository.mshop;
//     final check = ChecklistRepository.chklist;
//
//     // mostrarChecklist(Setor setor){
//     //   Navigator.push(context, MaterialPageRoute(
//     //     builder: (_) => ChecklistPage(setor:setor),
//     //   ));
//     // }
//
//     if(widget.posto.posto == 'SEDE'){
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.posto.posto),
//         ),
//         body:ListView.separated(itemBuilder:(BuildContext context, int sede){
//           return ListTile(
//             leading: const SizedBox(
//               width: 40,
//               child: Icon(Icons.account_tree),
//             ),
//             title:Text(tabela0[sede].getsetor, ),
//               //onTap: () => mostrarChecklist(tabela0[sede])
//           );
//         },
//           padding: const EdgeInsets.all(16),
//           separatorBuilder: (_,___)=> const Divider(),
//           itemCount: tabela0.length,
//         ),
//         );
//     }
//
//     if(widget.posto.posto == 'MOGI SHOPPING'){
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.posto.posto),
//         ),
//         body:ListView.separated(itemBuilder:(BuildContext context, int mshop){
//           return ListTile(
//             leading: const SizedBox(
//               width: 40,
//               child: Icon(Icons.account_tree),
//             ),
//             title:Text(tabela1[mshop].getsetor),
//              // onTap: () => mostrarChecklist(tabela1[mshop])
//           );
//         },
//           padding: const EdgeInsets.all(16),
//           separatorBuilder: (_,___)=> const Divider(),
//           itemCount: tabela1.length,
//         ),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.posto.posto),
//       ),
//     );
//   }
// }
