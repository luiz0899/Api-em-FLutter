import 'package:flutter/material.dart';

enum TipoCombustivel { gasolina, alcool }

class RadioBox extends StatefulWidget {
  TipoCombustivel? tipoCombustivel;

  RadioBox({Key? key, required this.tipoCombustivel}) : super(key: key);

  @override
  _RadioBoxState createState() => _RadioBoxState();
}

class _RadioBoxState extends State<RadioBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            title: Text('Gasolina'),
            leading: Radio<TipoCombustivel>(
              value: TipoCombustivel.gasolina,
              groupValue: widget.tipoCombustivel,
              onChanged: (value) {
                setState(() {
                  widget.tipoCombustivel = value;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text('Alcool'),
            leading: Radio<TipoCombustivel>(
              value: TipoCombustivel.alcool,
              groupValue: widget.tipoCombustivel,
              onChanged: (value) {
                setState(() {
                  widget.tipoCombustivel = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
