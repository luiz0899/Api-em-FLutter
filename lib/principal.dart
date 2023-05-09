import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:previsaodotempo/componentes/botao.dart';
import 'package:previsaodotempo/componentes/caixaDeTexto.dart';
import 'package:previsaodotempo/componentes/caixaDeTextoMsg.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

final _txtCep = TextEditingController();
final _formKey = GlobalKey<FormState>();

var cidade ;
var data ;
var hora ;
var temperatura ;
var descricao ;
var dataDiaSeguinte ;
var diaSemanaDiaSeguinte ;
var descricaoDiaSeguinte ;

buscarEndereco() async {
  final String urlViaCep = 'https://viacep.com.br/ws/${_txtCep.text}/json/';
  Response respCidade = await get(Uri.parse(urlViaCep));
  Map valCidade = json.decode(respCidade.body);

  var nomeCidade = valCidade['localidade'];
  var nomeUf = valCidade['uf'];
  var cidadeUf = (nomeCidade + ',' + nomeUf);
  buscarTempo(cidadeUf);
}

buscarTempo(cidadeUf) async {
  
  final String urlViaCep ='https://api.hgbrasil.com/weather?format=json-cors&key=dacba3a8&city_name=${cidadeUf}';
  Response respTempo = await get(Uri.parse(urlViaCep));
  Map valTempo = json.decode(respTempo.body);

  setState(() {

   cidade = valTempo ['results'] ['city'];
   data = valTempo ['results'] ['date'];
   hora = valTempo ['results'] ['time'];
   temperatura = valTempo ['results'] ['temp'];
   descricao = valTempo ['results'] ['description'];
   dataDiaSeguinte = valTempo ['results'] ['forecast'][1]['date'];
   diaSemanaDiaSeguinte = valTempo ['results'] ['forecast'][1]['weekday'];
   descricaoDiaSeguinte = valTempo ['results'] ['forecast'][1]['description'];

  });  
}

  @override
  Widget build(BuildContext context) {
    _criaBody() {
      return Form(
          key: _formKey,
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  child: CaixaDeTexto(
                    controlador: _txtCep,
                    texto: 'Digite CEP .',
                    msgValidacao: 'Informe nome ',
                  ),
                ),
                Botao(
                  funcao: buscarEndereco,
                  texto: "Buscar",
                )
              ],
            ),
           
            Text('Cidade : $cidade'),
            Text('Data :$data'),
            Text('Hora :$hora '),
            Text('Temperatura :$temperatura °'),
            Text('Descrição : $descricao '),
          
           Padding(padding: EdgeInsets.all(20) ),
          
           CaixaDeTextoMsg(

            height:100 ,
            Width: 300,
            mensagem: '$diaSemanaDiaSeguinte - $dataDiaSeguinte'
            

           ),
            CaixaDeTextoMsg(
              height:200 ,
              Width: 300,
              mensagem: ' $descricaoDiaSeguinte',

            ),
            //Image.network('https://assets.hgbrasil.com/weather/images/27.png' ,width: 200, height: 200,)

          ]));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Principal'),
      ),
      body: _criaBody(),
    );
  }
}
