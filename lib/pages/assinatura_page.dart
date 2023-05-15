import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:flutter/material.dart';

class AssinaturaPage extends StatefulWidget {
  const AssinaturaPage({Key? key}) : super(key: key);

  @override
  State<AssinaturaPage> createState() => _AssinaturaPageState();
}
// bool get debugNeedsPaint{
//   late bool result;
//   assert((){
//     result = _needsPaint;
//     return true;
//   }());
//   return result;
// }

class _AssinaturaPageState extends State<AssinaturaPage> {
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  get layer => layer;

  ui.Size get size => size;

  bool get debugNeedsPaint => true;

  Future<ui.Image> toImage({double pixelRatio = 1.0}) {
    assert(!debugNeedsPaint);
    final OffsetLayer offsetLayer = layer! as OffsetLayer;
    return offsetLayer.toImage(Offset.zero & size, pixelRatio: pixelRatio);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AlertDialog(
      scrollable: true,
      title:const Text('Assine para Finalizar',
      textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, color: Colors.blueAccent),
      ),
      content:SizedBox(
        height: height*0.35,
        width: width,
        child:Column(
          children: [
            Container(
              height: 300,
              width: 500,
              child: SfSignaturePad(
                  key: _signaturePadKey,
                  backgroundColor: Colors.grey[200],
                  strokeColor: Colors.black,
                  minimumStrokeWidth: 3.0,
                  maximumStrokeWidth: 5.0),
            ),
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                      child: const Text('Assinar'),
                      onPressed: () async {
                        ui.Image image =
                        await _signaturePadKey.currentState!.toImage();

                        var snackBar = const SnackBar(content: Text('Assinatura Salva!'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        //EventListener;
                        Navigator.pop(context);
                      }),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        child: const Text('Cancelar'),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                ),
                Align(
                  alignment:Alignment.center,
                  child: ElevatedButton(
                      child: const Text('Limpar Campo'),
                      onPressed:() async{
                        _signaturePadKey.currentState!.clear();
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
