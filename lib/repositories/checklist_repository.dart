import 'package:proteka_app/models/checklist.dart';

class ChecklistRepository{
  static List<Checklist>chklist = [
    Checklist(
        checklist: 'CONCORRENTE',
        checked: false
    ),
    Checklist(
        checklist: 'TERMINAL',
      checked: false
    ),
    Checklist(
        checklist: 'Coleta de Lixo',
        checked: false
    ),
    Checklist(
        checklist: 'Piso',
        checked: false
    ),
    Checklist(
        checklist: 'Vaso',
        checked: false
    ),
    Checklist(
        checklist: 'Pia',
        checked: false
    ),
    Checklist(
        checklist: 'Papel Higiênico',
        checked: false
    ),
    Checklist(
        checklist: 'Papel Toalha',
        checked: false
    ),
    Checklist(
        checklist: 'Álcool em Gel',
        checked: false
    ),
    Checklist(
        checklist: 'Sabonete',
        checked: false
    ),
  ];

  static List<Checklist>chklistmshop = [
    Checklist(
        checklist:'Vidro',
        checked: false
        ),
  ];
}