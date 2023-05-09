import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CaixaDeTextoMsg extends StatefulWidget {

  final mensagem ;
  final height ;
  final Width ;

  const CaixaDeTextoMsg({super.key,this.mensagem,this.Width,this.height });

  @override
  State<CaixaDeTextoMsg> createState() => _CaixaDeTextoMsgState();
}

class _CaixaDeTextoMsgState extends State<CaixaDeTextoMsg> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: SizedBox(
            width: widget.Width,
            height: widget.height,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                    color: Color.fromARGB(255, 133, 133, 133), width: 1),
              ),
              child: 
                  Text(widget.mensagem,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 71, 134, 252),
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
            )));
  }
}
