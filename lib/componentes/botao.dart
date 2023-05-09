import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Botao extends StatefulWidget {

  final funcao;
  final texto;


  const Botao({super.key, this.funcao, this.texto});

  @override
  State<Botao> createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(10),
    child: ElevatedButton(onPressed: widget.funcao,
     child: Text(widget.texto)),
    );
  }
}