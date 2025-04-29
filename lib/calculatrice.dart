import 'package:flutter/material.dart';

class Calculatrice extends StatefulWidget {
  const Calculatrice({super.key});

  @override
  State<Calculatrice> createState() => _CalculatriceState();
}

class _CalculatriceState extends State<Calculatrice> {
  String _input = '';
  String _resultat = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(20),
            child: Text(
              _input,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          buildClavier(),
        ],
      ),
    );
  }

  Widget buildClavier() {
    final touches = [
      ['C', '+/-', '%', '÷'],
      ['7', '8', '9', '×'],
      ['4', '5', '6', '-'],
      ['1', '2', '3', '+'],
      ['DEL', '0', '.', '='],
    ];

    return Column(
      children:
          touches.map((row) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  row.map((text) {
                    return bouton(text);
                  }).toList(),
            );
          }).toList(),
    );
  }

  Widget bouton(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _input += text;
          });
        },

        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(20),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        child: Text(text, style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
